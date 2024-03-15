class IntervalsController < ApplicationController
  def new
    @interval = Interval.new
  end

  def create
    @interval = Interval.new(interval_params)

    respond_to do |format|
      if @interval.save
        format.html { redirect_to result_path }
        format.json { render :result, status: :created, location: @interval }
      else
        puts @interval.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interval.errors, status: :unprocessable_entity }
      end
    end
  end

  def result
    @interval = Interval.last
  end

  def again
    Interval.destroy_all

    respond_to do |format|
      format.html { redirect_to new_interval_path }
      format.json { head :no_content }
    end
  end

  private

  def interval_params
    params.require(:interval).permit(:minimum, :maximum)
  end
end
