class CreditCardsController < ApplicationController
  before_action :set_card
  require 'payjp'

  def new
    redirect_to action: 'show', id: @card.id if @card.present?
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      redirect_to new_user_credit_card_path(current_user)
    else
      customer = Payjp::Customer.create(
        card: params['payjpToken'],
        metadata: { user_id: current_user.id }
      )
      @card = CreditCard.new(
        card_id: customer.default_card,
        customer_id: customer.id,
        user_id: current_user.id
      )
      if @card.save
        redirect_to action: 'show', id: @card.id
      else
        redirect_to action: 'create'
      end
    end
  end

  def show
    if @card.blank?
      redirect_to new_user_credit_card_path(current_user)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def destroy
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
    redirect_to action: 'new'
  end


  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

end
