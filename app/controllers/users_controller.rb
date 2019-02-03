class UsersController < ApplicationController

	# def show
 #    user = User.find(show_params[:id])
 #    @nickname = current_user.nickname
 #    @blogs = current_user.blogs.page(params[:page]).per(5).order('created_at DESC')
 #  end

  # private
  # def show_params
  #   params.permit(:id)
  # end

  def show
		user = User.find(params[:id])
	@nickname = user.nickname
	@blogs = user.blogs.page(params[:page]).per(5).order("created_at DESC")

    end
end

