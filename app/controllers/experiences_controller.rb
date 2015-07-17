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

  def edit
    @experience = Experience.find_by({id: params[:id]});
    if @experience
      @experience.update_attributes({
          title: params[:title],
          employer: params[:employer],
          description: params[:description],
          start_date: params[:start_date],
          end_date: params[:end_date]
        })
      @experience.save!
    end
    render text: ""
  end

  def destroy
    @experience = Experience.find_by({id: params[:id]});
    @experience.destroy if @experience
    render json: ""
  end

end
