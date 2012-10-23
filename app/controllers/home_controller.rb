class HomeController < ApplicationController
  def index
    @schedule = Schedule.get('short-feern-schedule')
  end
end
