#encoding: utf-8

class Admin::ScheduleController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def index
    @schedule = Schedule.get
  end

  def refresh
    @schedule = Schedule.new(params[:schedule])
    if @schedule.valid?
      @schedule.update
      redirect_to admin_schedule_index_path, notice: 'Programação atualizada com sucesso!'
    else
      render :index
    end
  end
end
