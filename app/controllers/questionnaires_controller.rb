class QuestionnairesController < ApplicationController

  def index
    @questionnaires = Questionnaire.all
    @count = @questionnaires.count
  end

  private

  def questionnaire_params
      params.require(:questionnaire).permit(:fio, :code, :sex, :age_years, :age_months, :place, :graduate, 
                                            :weight, :height, :bmi, :abdominal_pain, :headache, :concentration,
                                            :fatigability, :average_score)
  end
end
