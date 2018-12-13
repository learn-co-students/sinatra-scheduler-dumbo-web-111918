class ApplicationController < Sinatra::Base
  set :views, 'app/views'


######### HOME
  get '/' do
    erb :"index.html"
  end

  get '/courses' do
    @courses = Course.all
    erb :"courses/index"
  end

  get '/courses/:id' do
    @course = Course.find(params[:id])
  erb :"courses/show"
  end

  get '/courses/:id/edit' do
    @course = Course.find(params[:id])
    erb :"courses/edit"
  end

  put '/courses/:id' do
    @course = Course.find(params[:id])
    @course.update(params[:course])
    erb :"courses/edit"
    redirect to "/courses/#{@course.id}"
  end


end
