class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.all
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end
end
