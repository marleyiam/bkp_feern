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

  def export
    subscriptions = Subscription.all
    serializer = CSVSerializer.new(subscriptions: subscriptions)

    filename = I18n.l(Time.now, :format => :short) + 'Inscritos-FEERN.csv'
    
    send_data serializer.serialize, :filename => filename
  end
end
