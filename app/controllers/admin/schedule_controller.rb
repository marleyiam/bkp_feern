class Admin::ScheduleController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @schedule = Schedule.get
  end

  def refresh
    @schedule = Schedule.update(params[:schedule][:schedule_text])
    redirect_to admin_schedule_index_path
  end
end
