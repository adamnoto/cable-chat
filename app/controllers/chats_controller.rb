class ChatsController < ApplicationController
  def generate_checkout_token
    chat = Chat.find(params[:id])

    response = Veritrans.create_widget_token({
      transaction_details: {
        order_id: "#{params[:id]}#{rand.round(4)}",
        gross_amount: chat.gross_amount
      }
    })

    token = response.token_id
    render json: {token: token}
  end
end
