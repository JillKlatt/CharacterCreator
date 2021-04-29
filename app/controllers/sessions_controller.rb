class SessionsController < ApplicationController


    def new

    end

    def create
        @user = User.find_by_email(params[:user][:email])
            #binding.pry
        if @user && @user.authenticate(params[:user][:password])
            #flash[:message] = "Welcome '#{@user.name!}"
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:message] = "#{@user.errors.full_messages.join(', ')}"
            render :new
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:username]
            u.name = auth[:info][:name]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end
        # @user = User.find_or_create_by(uid: auth[:uid]) do |u|
        #     u.email = auth[:info][:email]
        #     u.username = auth[:info][:username]
        #     u.name = auth[:info][:name]
        #     u.uid = auth[:uid]
        #     u.provider = auth[:provider]
        #     u.password = SecureRandom.hex(10)
        # end
#binding.pry
        if @user.valid?
            #flash[:message] = "Welcome '#{@user.name!}!'"
            session[:user_id] = @user.id
            redirect_to '/'
        else
            #flash[:message] = "Issue logging in, please try again"
            flash[:message] = "#{@user.errors.full_messages.join(', ')}"
            redirect_to login_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    


end