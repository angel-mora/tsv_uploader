class UsersController < ActionController::Base
  def index
    @user = User.new
    @user.save
    @reports = @user.reports.all
  end

  def self.assign_from_row(row)
    report = Report.where(comprador: row[:comprador]).first_or_initialize
    report.assign_attributes row.to_hash.slice(:comprador, :descripcion_del_item, :precio_del_item, :total_de_items, :direccion_del_vendedor, :vendedor)
    report
  end

  def create
    @user = User.new(params[:user])
    #flash[:success] = 'User already exists.'
    if @user.save
      session[:user_id] = @user.id
      @current_user = User.find(session[:user_id])
      @report = @current_user.reports.create
      flash[:success] = 'New User created.'
      redirect_to 'user#index'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
