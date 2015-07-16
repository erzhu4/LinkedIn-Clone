class ExperiencesController < ApplicationController

  def create
    @experience = Experience.new ({
        user_id: current_user.id,
        title: params[:title],
        employer: params[:employer],
        description: params[:description],
        start_date: params[:start_date],
        end_date: params[:end_date]
      })
      @experience.save
      render text:""
  end

end
