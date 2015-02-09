enable :sessions

get '/createsurvey' do
  if session[:u_id] != nil
    erb :createsurvey
  else
     erb :index
  end
end

post '/createsurvey' do
  puts session[:u_id]
  user = User.find session[:u_id]
  survey = user.surveys.create(surveyname: params[:surveyname])
  question = survey.questions.create(question: params[:question])
  choice1 = question.choices.create(choice: params[:choice1])
  choice2 = question.choices.create(choice: params[:choice2])
  choice3 = question.choices.create(choice: params[:choice3])

  redirect to "/user/#{user.id}"
end

get '/takesurvey' do
  @surveys = Survey.all
  @user = User.find session[:u_id]
  erb :takesurvey
end

get '/user/:u_id/survey/:s_id' do
  @survey = Survey.find params[:s_id]
  @questions = Question.where(survey_id: @survey.id).first
  @choices = Choice.where(question_id: @questions.id)
  erb :show_survey
end