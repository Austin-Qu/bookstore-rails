class VisitorsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @visitors = Visitor.all
  end
end
