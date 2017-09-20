class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    if(@user.id)
	    @base_lists = BaseList.all
	    @base_lists.each do |base|
	    	@user.book_lists.create(nombre: base.nombre)
		end
	end
  end

  def update
    super
  end

  private

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  def sign_up_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin)
  end

  def account_update_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :current_password, :admin)
  end
end 