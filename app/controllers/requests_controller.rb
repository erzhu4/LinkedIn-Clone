class RequestsController < ApplicationController

  def create
    @request = Request.new({sender_id: current_user.id, responder_id: params[:id].to_i})
    @request.save
    render text: ""
  end

  def destroy
    @request = Request.find_by({sender_id: params[:senderid], responder_id: params[:responderid]})
    @request.destroy if @request
    render text: "something"
  end

end
