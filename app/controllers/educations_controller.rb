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

  def update
    @education = Education.find_by({id: params[:id]})
    @education.update_attributes({
      school: params[:school],
      field: params[:field],
      graduation_year: params[:graduation_year]
    })
    render text: ""
  end

  def destroy
    @education = Education.find_by({id: params[:id]})
    @education.destroy if @education
    render json: ""
  end


end
