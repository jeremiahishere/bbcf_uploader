class ManageUsersController< ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def approve
    @user = User.find_by_id(params[:id])
    @user.approved = 1
    @user.save
    respond_to do |format|
      format.html { redirect_to(manage_users_path, :notice => "#{@user.email} was successfully approved.")}
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(manage_users_path, :notice => "#{@user.email} was successfully deleted.") }
    end
  end
end
