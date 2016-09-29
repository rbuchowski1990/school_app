class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }


  def subjects
    flash.now[:notice] = session[:pluto] if session[:pluto]
    session.delete(:pluto)
  end

end
