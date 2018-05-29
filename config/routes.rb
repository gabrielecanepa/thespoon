Rails.application.routes.draw do
  resources :restaurants do
    # New general and not CRUD urls must be nested with the collection method at a collection level, not a member level (/:id/new-url)
    collection do
      get 'top' => 'restaurants#top' # will generate a route with top_restaurants as prefix and /restaurants/top as URI pattern
    end

    # Nest at member level for specific routes regarding a specific member
    member do
      get 'chef' => 'restaurants#chef' # will generate a route with chef_restaurant as prefix and /restaurants/:id/chef as URI pattern
    end
  end
end
