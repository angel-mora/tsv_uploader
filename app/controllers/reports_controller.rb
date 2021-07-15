class ReportsController < ActionController::Base
  def index
    @reports = Report.all
    @import = Report::Import.new
  end

  def import
    @import = Report::Import.new report_import_params
    if @import.save
      redirect_to users_path, notice: "Imported #{@import.imported_count} transactions"
    else
      @reports = Report.all
      flash[:alert] = "There were #{@import.errors.count} errors with your CSV file"
      render action: :index
    end
  end

  def create
    user = User.find_or_create_by(name: params[:report][:comprador])
    Report.create(comprador: report_params[:report][:comprador], user: user)
  end

  private

  def user_import_params
    params.require(:report_import).permit(:file)
  end

  def report_params
    params.require(:report).permit(:user_id)
  end
end
