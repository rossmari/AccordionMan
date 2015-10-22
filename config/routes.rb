Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  post '/updates/handle' => 'updates#handle'

end
