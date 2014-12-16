class ContributorsController < ApplicationController

  def index
    @contributors = Contributor.all
    render json: @contributors
  end

end
