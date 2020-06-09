class BuyingsController < ApplicationController
  before_action :set_item
  before_action :have_credit_card?, only: :create
  require 'payjp'

  def new
    @address = current_user.address
    @images = @item.images
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    card = CreditCard.find_by(user_id: current_user.id)
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

  def have_credit_card?
    redirect_to new_user_credit_card_path(current_user) unless current_user.credit_cards.present?
  end
end
