class HomeController < ApplicationController
  def index
    @schedule = Schedule.get
  end
end
