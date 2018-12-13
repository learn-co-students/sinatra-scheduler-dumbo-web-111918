class CourseController < ApplicationController
    get '/courses' do
        erb :index
      end
    
      get '/courses/:id' do
        find_course
        erb :show
      end
    
      get '/courses/:id/edit' do
        find_course
        erb :edit
      end
    
      def find_course
        @course = Course.find(params[:id])
      end
    
      put '/courses/:id' do
        find_course
        @course.update(params[:course])
    
        redirect to "/courses/#{@course.id}"
      end
      
end