class SearchController < ApplicationController

  def get_results ## Possibility of SQL injections
    str = params[:str][1..-1]
    cap_str = params[:str].capitalize;
    @results1 = User.where("users.fname LIKE '%" + cap_str + "%' OR users.lname LIKE '%" + cap_str +"%' OR users.email LIKE '%" + cap_str + "'" );

    @results2 = User.where("users.fname LIKE '%" + str + "%' OR users.lname LIKE '%" + str +"%' OR users.email LIKE '%" + str + "'" );
    render json: @results1 + @results2
  end

end
