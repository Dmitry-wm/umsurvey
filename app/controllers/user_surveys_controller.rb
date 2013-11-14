class UserSurveysController < HomeController
  def new
    @user_survey = UserSurvey.new(survey_id: params[:survey_id])
    @user_survey.init_answers
  end

  def create
    @user_survey = UserSurvey.new(params[:user_survey])
    @user_survey.user = current_user
    if @user_survey.save
      redirect_to root_path
    else
      render :new
    end
  end
end

