ActiveAdmin.register Dishpic do
  permit_params :id, :dish_id, :favorites, :user_id, :flagged, :remove, :caption, :quality_score, :url
  
  
  
end
