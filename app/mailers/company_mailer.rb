class CompanyMailer < ActionMailer::Base

  def love_you(company)
    @company = company
    prepend_view_path @company.resolver
    mail to: "champ@example.com", subject: "Lovely", from: "vvv@example.com"
  end

end