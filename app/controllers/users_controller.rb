class UsersController < ActionController::Base
  def index
    @user = User.create!
    @reports = @user.reports.all
  end

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      report = Report.asign_from_row
      if user.save
        counter += 1
      else
        puts "#{report.id} - #{user.errors.full_messages.join(',')}"
      end
    end
    counter

    # raise params[:file]
    # @user = User.create!
    # #binding.pry
    # # later
    # @report = @user.report.build(params[:file])
    # counted = @report.import
    # binding.pry
    # redirect_to users_path, notice: "Imported #{counted} transactions"
  end
end
