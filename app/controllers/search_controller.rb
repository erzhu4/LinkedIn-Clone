class SearchController < ApplicationController

  def get_results ## Possibility of SQL injections
    @results = []
    str = params[:str]
    cap_str = params[:str].capitalize;
    if str && cap_str.length > 0
      @results = User.where("users.fname LIKE '%" + cap_str + "%' OR users.lname LIKE '%" + cap_str +"%' OR users.email LIKE '%" + cap_str + "' OR users.fname LIKE '%" + str + "%' OR users.lname LIKE '%" + str +"%' OR users.email LIKE '%" + str + "'");
    else
      @results = []
    end
    render json: @results
  end

end
