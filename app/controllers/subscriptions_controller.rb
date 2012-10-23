#encoding: utf-8

class SubscriptionsController < ApplicationController
  #before_filter :check_availability

  respond_to :html

  layout 'inscricao'

  def new
     @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    
    unless @subscription.save
      render :new
    end
  end

  protected
  def check_availability
    render text: 'Inscrições Encerradas!' unless Subscription.available?
  end
end
