class Api::RequestsController < ApplicationController
  def show
    @request = Request.includes(:requestor, bike: :owner)
                      .find(params[:id])
  end

  def create
    @request = current_user.requests_made.new(request_params)
    if @request.save
      flash.now[:notice] = "Thank you for requesting #{@request.bike.name} the
                        #{@request.bike.type}! #{@request.bike.name}'s owner is
                        reviewing your request and we'll notify you when they've
                        responded."

      render json: @request
    else
      p @request.errors.full_messages
      render json: @request.errors.full_messages
    end
  end

  def update
    @request = Request.find(params[:id])

    if @request.update!(request_params)
      render json: @request
    else
      render json: @request.errors.full_messages
    end
  end

  def destroy
    @request = Request.find(params[:id])

    if @request.destroy
      render json: @request
    else
      render json: @request.errors.full_messages
    end
  end

  private

    def request_params
      params.require(:request).permit(:bike_id, :approved, :end_ampm,
                                      :end_hour, :end_min, :start_ampm,
                                      :start_hour, :start_min, :start_date,
                                      :end_date,)
    end
end
