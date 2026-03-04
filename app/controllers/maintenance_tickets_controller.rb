class MaintenanceTicketsController < ApplicationController
  def index
    @tickets = MaintenanceTicket.all.includes(:property)
  end
end
