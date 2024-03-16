Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Etablecemos las rutas clasicas para el controlador intervals new y create
  resources :intervals, only: %i[new create]
  # Establecemos nuestra nuta '/' como la vista del new
  root "intervals#new"
  # Creamos una ruta para mostrar los resultados, tambien podia haber sido un show
  get "/result", to: "intervals#result"
  # Creamos una ruta que es invocada y responde el método again de intervals
  # controller y funciona para volver a probar la calculadora
  get "/again", to: "intervals#again"
end
