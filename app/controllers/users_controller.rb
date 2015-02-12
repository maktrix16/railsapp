class UsersController < ApplicationController
  def index
    # reset_session
  	@user = User.new
  end

  def socket_id
  end

  def create
    if User.last == nil
      session[:id_other] = 99999  #initialize a user
    else
      session[:id_other] = User.last.id      
    end

    # session[:name_other] = User.find(session[:id_other]).name
  	@user=User.create(user_params)
    session[:id_you] = @user.id 
    session[:name_you] = @user.name
  	redirect_to '/users/chat'
  end

  def chat
    @users  = User.all
    # @messages = Message.all.order(created_at: :desc) #change to restrict message between two people

    # @messages = Message.find_by_sql "SELECT temp.message as 'message', temp.from_user as 'from_user', users.name as 'to_user', temp.created_at as 'created_at' FROM (SELECT message, users.name as 'from_user', to_id, messages.created_at FROM messages, users where messages.user_id = users.id) as 'temp',users where temp.to_id = users.id ORDER BY created_at DESC"

    
    # @messages = Message.find_by_sql "SELECT temp.message as 'message', temp.from_user as 'from_user', users.name as 'to_user', temp.from_id as 'from_id', temp.to_id as 'to_id', temp.created_at as 'created_at' FROM (SELECT message, users.name as 'from_user', user_id as 'from_id', to_id, messages.created_at FROM messages, users where messages.user_id = users.id) as 'temp',users where temp.to_id = users.id AND (temp.to_id ="+session[:id_other].to_s+" OR temp.from_id = "+session[:id_other].to_s+") ORDER BY created_at DESC"

    @messages = Message.find_by_sql "SELECT temp.message as 'message', temp.from_user as 'from_user', users.name as 'to_user', temp.from_id as 'from_id', temp.to_id as 'to_id', temp.created_at as 'created_at' FROM (SELECT message, users.name as 'from_user', user_id as 'from_id', to_id, messages.created_at FROM messages, users where messages.user_id = users.id) as 'temp',users where temp.to_id = users.id ORDER BY created_at DESC"
    
    print 'hello'
    # render 'chat'

  end

  def message
    Message.create(message: message_params[:message],user: User.find(session[:id_you]), to: User.find(session[:id_other]))
    # need to change the :id_other
    redirect_to '/users/chat'
  end

  def insight
  end

  private 
  def user_params
    params.require(:user).permit(:name)
  end
  def message_params
    params.require(:message).permit(:message)
  end
end
