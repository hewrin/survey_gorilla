
post '/survey/:s_id/' do
  ChoicesUser.create(choice_id: params[:answer] ,user_id: params[:u_id])
  survey = Survey.find params[:s_id]

  redirect to "/survey/#{survey.id}/results"
end

get '/survey/:s_id/results' do
  survey = Survey.find params[:s_id]
  question = survey.questions.where(survey_id: params[:s_id]).first
  choices =  Choice.where(question_id: question.id)
  @name = []
  @amount = []
  choices.each do |c|
    @amount << ChoicesUser.where(choice_id: c.id).length
    @name << c.choice
  end

  erb :result

end