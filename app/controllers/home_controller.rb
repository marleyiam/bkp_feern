class HomeController < ApplicationController
  def index
    @schedule = Schedule.get('short-feern-schedule')
  end

  def progcompleta
    @schedule = Schedule.get('feern-schedule')
    render :index
  end
end
