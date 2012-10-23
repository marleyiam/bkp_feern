#encoding: utf-8

class Admin::ScheduleController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def index
    schedule_type = params[:schedule_type].present? ? params[:schedule_type] : 'short-feern-schedule'
    @schedule = Schedule.get(schedule_type)
  end

  def refresh
    @schedule = Schedule.new(params[:schedule])
    if @schedule.valid?
      @schedule.update
      redirect_to admin_schedule_index_path(schedule_type: @schedule.schedule_type), notice: 'Programação atualizada com sucesso!'
    else
      render :index
    end
  end
end
