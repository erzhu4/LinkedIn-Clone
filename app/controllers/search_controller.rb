class SearchController < ApplicationController

  def get_results
    @results = User.where({fname: params[:fname]});
    render json: @results
  end

end
