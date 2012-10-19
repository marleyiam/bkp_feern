#encoding: utf-8

class Admin::SubscriptionsController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    redirect_to admin_subscriptions_path, notice: 'Inscrição removida.'
  end
end
