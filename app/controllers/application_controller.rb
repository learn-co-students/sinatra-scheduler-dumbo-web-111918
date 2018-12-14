class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  set :method_override, true

  get '/' do
    erb :'index.html'
  end

  get '/courses' do
    @courses = Course.all
    erb :show
    #binding.pry

  end

  get '/courses/:id' do
    find_courses
    erb :showcourse
end

  get "/courses/:id/edit" do
    # binding.pry
    find_courses
    erb :edit

    # @course.update(params[:id])
    # redirect to "/courses/#{@course.id}"

  end

  put "/courses/:id" do
    #binding.pry
    find_courses
      @course.update(name: params[:name], professor: params[:professor], credits: params[:credits])
      redirect to "/courses/#{@course.id}"
end


  get "/schedule" do
    @schedule = Classe.all
    find_sched
    find_credits
    # binding.pry
    erb :sched_show

  end

  get "/schedule/new" do
    #binding.pry
    erb :new

  end

  post "/schedule" do
    find_sched
find_credits
#binding.pry
if (@new_ar.reduce(:+) == 13 && params[:classe][:course_id].to_i > 2) || (@new_ar.reduce(:+) == 14 && params[:classe][:course_id].to_i > 1) || (@new_ar.reduce(:+) == 15)

redirect to "/schedule/er"

else
    @course = Classe.create(params[:classe])
    redirect to "/schedule"
end
end

  get "/schedule/er" do
    find_sched
    find_credits
    erb :sched_er_show
  end

  get "/schedule/delete" do
    find_sched

    erb :sched_delete


  end

    delete "/schedule" do
      class_ids
      binding.pry
      find_sched
      @bad_class = Classe.all.find(params[:classe][:course_id])

      @bad_class.destroy
      redirect to "/schedule"


end
  def find_courses
    @course = Course.find(params[:id])

  end

  def find_sched
    @class = Classe.all.map do |classj|
    Course.all.find(classj.course_id)
  end
end

def class_ids
  @new_class= Classe.all.each do |classj|
    classj.course_id == params[:classe][:course_id]
  end
end


  def find_credits

    find_sched
    @new_ar= @class.map do |classj|
      classj.credits
    end
    #binding.pry
  end
end
