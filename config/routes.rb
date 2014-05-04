AddressToCoords::Application.routes.draw do
  get("/coords", { :controller => "addresses", :action => "fetch_coordinates" })
  get("/coords/:address", { :controller => "addresses", :action => "fetch_coordinates" })


end
