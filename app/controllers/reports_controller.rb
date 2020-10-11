class ReportsController < ApplicationController
  before_action :authenticate_user!
  def new
    @report= Report.new
  end
  def create
    @report = current_user.reports.new(report_params)
    if @report.save
       flash[:notice] = "Your report has been sent. We will try to fix the problem as soon as possible. Thank You."
       redirect_to root_path
    else
      flash[:alert] = "Sorry! Your report was not sent."
      redirect_to reports_new_path
    end
  end
  private
  def report_params
    params.require(:report).permit(:title, :description, :solve)
  end
end
