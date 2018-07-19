class QuestionnairesController < ApplicationController

  def index
    @questionnaires = Questionnaire.order(:fio)
    @count = @questionnaires.count
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    if @questionnaire.save
      redirect_to questionnaires_path, notice: 'Questionnaire was successfully created.'
    else
      render :new
    end
  end

  private

  def questionnaire_params
      params.require(:questionnaire).permit(:fio, :code, :sex, :age_years, :age_months, :place, :graduate, 
                                            :weight, :height, :bmi, :abdominal_pain, :headache, :concentration,
                                            :fatigability, :average_score)
  end
end
