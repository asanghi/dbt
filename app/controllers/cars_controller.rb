class CarsController < ApplicationController

  def index
    begin
      load_company
      prepend_view_path @company.resolver
    rescue
      #Rails.logger.error e.backtrace
      flash[:error] = "Error in view. Please update the message template accordingly."
      redirect_to :back
    end
  end

end