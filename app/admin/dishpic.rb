ActiveAdmin.register Dishpic do
  permit_params :dish, :favorites, :user, :flagged, :remove, :caption, :quality_score, :url
  
  
  
end
