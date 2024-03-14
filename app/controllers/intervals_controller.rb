class IntervalsController < ApplicationController
  def new
    @interval = Interval.new
    @mensaje = 'mensaje'
  end

  def create
    @interval = Interval.new(interval_params)
    if @interval.save
      redirect_to home_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def home
    @interval = Interval.last
    @naturales = @interval.determinar_naturales
  end

  def again
    Interval.destroy_all
    redirect_to home_path
  end

  private

  def interval_params
    params.require(:interval).permit(:minimum, :maximum)
  end
end
