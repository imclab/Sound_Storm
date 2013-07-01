class UsersController < ApplicationController
	before_filter :authenticate_user, except: :new
	respond_to :json

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			# login(@user)
			p "WHATHATHWATHAS DFASDHF ASDFH SDAHF ASDHF SDAFH"
			redirect_to users_url
		else
			flash[:errors] = @user.errors.full_messages
			render :new
		end
	end

	def show
		debugger
		p "errmmm yea.... thats supposed to be a break point (i.e. the debugger)"
		if current_user
			render json: current_user
		else
			render error: 404
		end
	end

	def index
		respond_to do |format|
			format.html { render :index }
			format.json { render json: current_user.to_json(include: :tracks) }
		end
	end

	def edit
	end

	def update
		current_user.update_attributes(params[:user])
		respond_with current_user
	end

end
