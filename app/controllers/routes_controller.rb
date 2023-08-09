# app/controllers/routes_controller.rb

class RoutesController < ApplicationController
    def index
      @routes = Route.all
      render :index
    end
    def show
        @route = Route.find(params[:id])
      end
  end
  