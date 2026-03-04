class DashboardController < ApplicationController
  def index
    @properties = Property.all
    @total_value = @properties.sum(:current_value)
    @monthly_income = @properties.sum(:monthly_net_income)
    @avg_occupancy = @properties.average(:occupancy_rate) || 0
    @avg_score = @properties.average(:airbnb_score) || 0
    @top_properties = @properties.order(monthly_net_income: :desc).limit(3)
  end
end
