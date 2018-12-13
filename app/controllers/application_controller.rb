class ApplicationController < Sinatra::Base
  configure do
  set :public_folder, 'public'
  set :method_override, true
  set :views, 'app/views'
  end

  get '/' do
    erb :'index.html'
  end

end
