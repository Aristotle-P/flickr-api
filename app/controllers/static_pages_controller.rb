class StaticPagesController < ApplicationController
  def index
    if !params[:search].blank?
      user_id = params[:search][:user]
    else
      user_id = "157309799@N04"
    end
    @results = flickr.people.getPhotos(user_id: user_id, extras: "url_m", per_page: 50)
  end

  private
    def api_params
      params.require(:search).permit(:user)
    end
end
