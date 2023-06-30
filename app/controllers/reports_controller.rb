
  class ReportsController < ApplicationController
        before_action :authenticate_user!
        
          def index
            @report = current_user.reports
          end
          
          def show
            @report = Report.find(params[:id])
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

          def edit
            @report = Report.find(params[:id])
          end
    
          def update
            @report = Report.find(params[:id])
            if @reports.update(report_params)
                redirect_to reports_url, notice: "Report is updated with New content."
            else 
                render :edit, status: :unprocessable_entity
            end
          end
    
          def show
            @report = Report.find(params[:id])
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
