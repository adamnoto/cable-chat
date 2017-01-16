class Chat < ApplicationRecord
  validates_presence_of :text
  validates_presence_of :sender_id

  after_create_commit { ChatBroadcasterJob.perform_now(self) }

  belongs_to :sender, class_name: User

  ITEMABLE_REGEX = /\A.*jual\s+/i

  def itemable?
    !(text =~ ITEMABLE_REGEX).nil?
  end

  def items
    items = []
    return items unless itemable?

    # hapus semua text sekitar jual sampai spasi terakhir
    clean_text = text.dup.gsub(ITEMABLE_REGEX, '')
    
    # karena satu chat bisa berisi lebih dari 1 item yang dipisahkan
    # oleh titik koma
    items_text = clean_text.split(';')

    # iterasi untuk setiap item yang terkandung dalam
    # text yang belum di parsing
    items_text.each do |item_text|
      # pisahkan item text berdasarkan tanda koma,
      # data pertama berisi nama item, data kedua berisi harga,
      # kemudian ambil kedua data tersebut untuk setiap iterasinya
      item_text.split(',').each_slice(2) do |name, price|
        # tambahkan ke koleksi items
        items << {
          name: name,
          price: price.tr('.', '').to_i
        }
      end
    end

    # item yang sudah di parse dari text chat, setiap item berisi
    # data nama dan harga yang terkandung dalam struktur data
    # berupa hash/dictionary/associative array
    items
  end

  def gross_amount
    amount = 0
    items.each do |item|
      amount += item[:price]
    end
    amount
  end
end
