class SubjectsController < ApplicationController
  def index
     if params[:query].present?
       sql_query = "title ILIKE :query OR location ILIKE :query"
       @subjects = Subject.where(sql_query, query: "%#{params[:query]}%")
     else
       @subjects = Subject.all
     end
   end
end

