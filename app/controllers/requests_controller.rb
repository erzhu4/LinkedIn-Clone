class RequestsController < ApplicationController

  def create
    @request = Request.new({sender_id: current_user.id, responder_id: params[:id].to_i})
    @request.save
    render text: ""
  end

  def destroy
  end

end
