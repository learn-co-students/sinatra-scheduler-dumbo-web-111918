class CoursesController < ApplicationController
  get '/courses' do
    @courses = Course.all
    erb :"courses/index"
  end

  def find_course(id)
    Course.find(id)
  end

  get "/courses/new" do 
    erb :"courses/new"
  end

   post '/courses' do
    @course = Course.new(params[:course])
    @course.save
    redirect to "/courses"
  end

  get "/courses/:id" do
    @course = find_course(params[:id])
    erb :"courses/show"
  end
  get "/courses/:id/edit" do
    @course = find_course(params[:id])
    erb :"courses/edit"
  end

  put "/courses/:id" do
    @course = find_course(params[:id])
    @course.update(params[:course])
    redirect to "/courses/#{@course.id}"
  end

  delete "/courses/:id" do 
    @course = find_course(params[:id])
    @course.destroy 
    redirect to "/courses"
  end
end
