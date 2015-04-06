module Api
  class ProfilesController < ApplicationController
    before_action :set_profle, only: [:show]

    # GET /api/profiles/1.json
    def show
      render json: @profile
    end

    # PATCH/PUT /api/profiles/self.json
    def update
      if current_user.update(profile_params)
        head :no_content
      else
        render json: current_user.errors, status: :unprocessable_entity
      end
    end

  private

    def set_profile
      @profile = User.find(params[:id])
    end

    def profile_params
      puts params
      params.require(:profile).permit(:text, :anonymous, :cloudinary_image_id)
    end
  end
end
