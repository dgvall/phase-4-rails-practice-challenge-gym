class GymsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  def show
    gym = Gym.find(params[:id])
    render json: gym, include: :memberships, status: :ok
  end

  def destroy
    gym = Gym.find_by(id: params[:id])
    if gym
    gym.destroy
    head :no_content
    else
      render json: {error: "Gym no found"}, status: :not_found
    end
  end

  private
  def render_unprocessable_entity(invalid)
    render json:{error: invalid.record.errors}, status: :unprocessable_entity
  end
end
