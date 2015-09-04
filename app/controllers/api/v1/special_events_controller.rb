class Api::V1::SpecialEventsController < ApplicationController
  respond_to :json
  def index
    special_events = SpecialEvent.only_active
    if special_events.count > 0
      respond_with special_events
    else
      head 204
    end
  end
end
