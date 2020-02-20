class SignupsController < ApplicationController
    def step1
    @user = User.new
    end

    def step2
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new
    end

    def create
      @user = User.new(
        email: session[:email], # sessionに保存された値をインスタンスに渡す
        password: session[:password],
        password_confirmation: session[:password_confirmation],
        name: user_params[:name]  # step2で入力した値をインスタンスに渡す
    )
        if @user.save
            session[:user_id] = @user.id # ログイン状態維持のためuser_idをsessionに保存
            redirect_to new_user_path
        else
            render '/users/step1'
        end
    end

private
    def user_parms
        params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
end