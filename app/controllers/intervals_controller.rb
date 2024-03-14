class IntervalsController < ApplicationController
  def new
    @interval = Interval.new
  end

  def create
    @interval = Interval.new(interval_params)
    if @interval.save
      redirect_to result_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def result
    @interval = Interval.last
    @naturales = @interval.determinar_naturales
  end

  def again
    Interval.destroy_all
    redirect_to new_interval_path
  end

  private

  def interval_params
    params.require(:interval).permit(:minimum, :maximum)
  end
end
