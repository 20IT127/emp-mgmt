class ReportMailer < ApplicationMailer
    def send_report(report, recipient_email)
      @report = report
      mail(to: recipient_email, subject: 'New Daily Work Report')
    end
  end
  