class BuyingsController < ApplicationController

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    card = CreditCard.where(user_id: current_user.id).first
    charge = Payjp::Charge.create(
      amount: (@item.price * 1.1).ceil,
      customer: Payjp::Customer.retrieve(card.customer_id),
      currency: 'jpy'
    )

    buying = Buying.new(user_id: current_user.id, item_id: @item.id, address_id: current_user.address.id, credit_card_id: card.id, amount: (@item.price * 1.1).ceil)
    if buying.save
      @item.status_id = 2
      @item.save
      redirect_to root_path
    else
      recirect_to action: 'new', id: @item.id, alert: '商品の購入に失敗しました'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
