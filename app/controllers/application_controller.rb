class ApplicationController < Sinatra::Base
  set :views, 'app/views'

  get '/' do
    erb :'index.html'
  end

  get '/courses' do
    erb :courses
  end

  post '/courses' do
  	@new = Course.create(params)
  	@id = @new.id
    redirect '/courses'
  end

  get '/courses/new' do
    erb :new
  end

  get '/courses/:id' do
  	@id = params[:id]
  	@course = Course.find(@id)
    erb :show_course
  end

  get '/courses/:id/edit' do
  	@id = params[:id]
  	@course = Course.find(@id)
    erb :edit_course
  end

  put '/courses/:id' do
  	@id = params[:id]
  	@course = Course.find(@id)
  	@course.update(name: params[:name], professor: params[:professor], credits: params[:credits])
    redirect '/courses'
  end

end
