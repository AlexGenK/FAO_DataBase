class QuestionnairesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  def index
    params[:search]='' if params[:commit]=='Показать все'
    params[:search].strip! if params[:search]
    @questionnaires = Questionnaire.where('user LIKE ? AND (fio LIKE ? OR code LIKE ?)',
                                          current_user.email,
                                          "%#{params[:search]}%",
                                          "%#{params[:search]}%").order(:fio)
    @count = @questionnaires.count
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.user = current_user.email

    if @questionnaire.save
      redirect_to questionnaires_path, notice: 'Questionnaire was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to questionnaires_path, notice: 'Questionnaire was successfully destroyed.'
  end

  def edit
  end

  def update
    if @questionnaire.update(questionnaire_params)
      redirect_to questionnaires_path, notice: 'Questionnaire was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
      params.require(:questionnaire).permit(:fio, :code, :sex, :age_years, :age_months, :place, :graduate, 
                                            :weight, :height, :bmi, :abdominal_pain, :headache, :concentration,
                                            :fatigability, :average_score)
  end
end
