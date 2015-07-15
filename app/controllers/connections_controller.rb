class ConnectionsController < ApplicationController

  def create
    @connection1 = Connection.new({ user_id1: params[:id1], user_id2: params[:id2] })
    @connection2 = Connection.new({ user_id1: params[:id2], user_id2: params[:id1] })
    @connection1.save
    @connection2.save
    render text: "something"
  end

  def destroy
  end

end
