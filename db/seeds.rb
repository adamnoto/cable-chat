[
  # sender id akan digunakan untuk me-render avatar, sedangkan text-nya
  # akan digunakan sebagai isi chat
  {text: "Hello world", sender_id: 1},
  {text: "Ayo ntar main FIFA oi!", sender_id: 4},
  {text: "Ah lu kalah mulu, bosen gue", sender_id: 2},
  {text: "Sad truth :(", sender_id: 5},
  {text: "nih biar gak kalaan, gue jual stick ps, 150.000", sender_id: 6},
  {text: "gue juga mo jual memory ps 2, 80.000", sender_id: 3}
].each do |chat|
  # equal to Chat.new(chat).save
  Chat.create(chat)
end
