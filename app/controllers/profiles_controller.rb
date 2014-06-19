class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @profile = current_user.profile
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profiles_url, notice: "Tu perfil ha sido creado"
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profiles_url, notice: "Perfil Actualizado"
    else
      render :edit
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :location, :web, :bio)
  end
end
