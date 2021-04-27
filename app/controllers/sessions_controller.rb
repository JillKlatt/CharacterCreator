class SessionsController < ApplicationController


    def new

    end

    def create
        @user = User.find_by_username(params[:user][:username])

        if @user && @user.authenticate([:user][:password])
            flash[:message] = "Welcome '#{@user.name!}"
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:message] = "#{@user.errors.full_messages.join(', ')}"
            render :new
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def omniauth

        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:username]
            u.name = auth[:info][:name]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end

        if @user.valid?
            flash[:message] = "Welcome '#{@user.name!}!'"
            session[:user_id] = @user.id
            redirect_to characters_path
        else
            flash[:message] = "Issue logging in, please try again"
            redirect_to login_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    


end