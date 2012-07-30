class ApplicationController < ActionController::Base
  protect_from_forgery

  def load_company
    @company = Company.find(params[:company_id])
  end

end
