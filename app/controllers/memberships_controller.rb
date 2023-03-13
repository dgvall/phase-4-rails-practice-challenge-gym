class MembershipsController < ApplicationController
  def create
    membership = Membership.create(client_id: params[:client_id], gym_id: params[:gym_id], charge: params[:charge])
    if membership.valid?
      render json: membership, status: :created
    else
      render json: membership.errors.full_messages
    end
  end
end
