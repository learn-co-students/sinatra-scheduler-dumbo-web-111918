class CoursesController < ApplicationController
  get '/courses' do
    @courses = Course.all
    erb :"courses/index"
  end

  get "/courses/:id" do
    @course = Course.find(params[:id])
    erb :"courses/show"
  end
end
