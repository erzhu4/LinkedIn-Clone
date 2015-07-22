class EducationsController < ApplicationController

  def create
    @education = Education.new({user_id: current_user.id})
    school = params[:school]
    field = params[:field]
    year = params[:graduation_year].to_i
    @education.school = school
    @education.field = field
    @education.graduation_year = year if year > 0
    @education.save
    render text: ""
  end

  def destroy
  end


end
