class WebContentsController < ApplicationController
  def index 
    @contents = {}
    WebContent.all.each do |w|
      @contents[w.identifier] = w
    end
  end
    
end
