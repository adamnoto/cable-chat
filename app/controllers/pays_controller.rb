class PaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def notify
    Order.find_by_order_id(params["order_id"]).update_attributes!(
      transaction_status: params["transaction_status"]
    )

    render text: "OK"
  end

  def finish
    redirect_to rooms_path
  end

  def unfinish
    redirect_to rooms_path
  end

  def error
    redirect_to rooms_path
  end
end
