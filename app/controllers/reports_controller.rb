class ReportsController < ApplicationController
    class ReportsController < ApplicationController
        before_action :authenticate_user!
      
        def index
          @reports = current_user.reports
        end
      
        def new
          @report = current_user.reports.build
        end
      
        def create
          @report = current_user.reports.build(report_params)
          if @report.save
            send_report_email(@report)
            redirect_to reports_path, notice: 'Report created successfully.'
          else
            render :new
          end
        end
      
        private
      
        def report_params
          params.require(:report).permit(:title, :body, :department)
        end
      
        def send_report_email(report)
          project_leader_email = 'project_leader@example.com' # Replace with the actual project leader's email
          ReportMailer.send_report(report, project_leader_email).deliver_now
        end
      end
      
end
