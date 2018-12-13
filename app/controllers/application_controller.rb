class ApplicationController < Sinatra::Base
  set :views, 'app/views'

  get '/' do
    erb :'index.html'
  end

  get '/courses' do
    # binding.pry
    @courses = Course.all
    erb :show_all
  end

  get '/courses/delete' do
    @courses = Course.all
    erb :delete
  end

  get '/courses/new' do
    erb :new
  end

  post '/courses' do
    Course.create(params[:course])
    redirect "/courses"
  end

  get '/courses/:id' do
    # binding.pry
    @course = Course.find(params[:id])
    erb :show
  end

  get '/courses/:id/edit' do
    @course = Course.find(params[:id])
    erb :edit
  end

  patch '/courses/:id' do
    @course = Course.find(params[:id])
    @course.update(params[:course])
    redirect "/courses/#{@course.id}"
  end

  delete '/courses' do
    id = params[:course_id].keys
    binding.pry
    id.each do |i|
      Course.delete(id)
    end
    redirect '/courses'
  end


end
