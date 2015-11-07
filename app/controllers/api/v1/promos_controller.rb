class Api::V1::PromosController < ApplicationController
  respond_to :json
  def index
    if params[:longitude] && params[:latitude]
      promos = Promo.
                only_active.
                near( [params[:latitude], params[:longitude]], 999999).
                #where("distance < radius").
                reorder("priority DESC, distance ASC").
                first
    else
      
      promos = Promo.only_active.order(priority: :desc).first
    end
    if promos
      respond_with promos
    else
      head 204
    end
  end
end
