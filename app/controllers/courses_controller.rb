class CoursesController < ApplicationController
  get '/courses' do
    @courses = Course.all
    erb :"courses/index"
  end

  def find_course(id)
    Course.find(id)
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
end
