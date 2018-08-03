class QuestionnairesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]
  before_action :detect_invalid_user, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :denied_action

  def index
    params[:search]='' if params[:commit]=='Показать все'
    params[:search].strip! if params[:search]
    @questionnaires = Questionnaire.where('user LIKE ? AND (fio LIKE ? OR code = ?)',
                                          user_signed_in? ? current_user.email : '%',
                                          "%#{params[:search]}%",
                                          params[:search]).order(:fio)
    @count = @questionnaires.count
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.user = current_user.email

    if @questionnaire.save
      redirect_to questionnaires_path, notice: 'Анкета успешно создана.'
    else
      flash[:alert] = 'Анкета заполнена неверно.'
      render :new
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to questionnaires_path, notice: 'Анкета успешно удалена.'
  end

  def edit
  end

  def update
    if @questionnaire.update(questionnaire_params)
      redirect_to questionnaires_path, notice: 'Анкета успешно отредактирована.'
    else
      flash[:alert] = 'Анкета заполнена неверно.'
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
                                            :fatigability, :average_score,
                                            :i_1_1, :i_1_2, :i_1_3, :i_1_4, :i_1_5, :i_1_6, :i_1_7, :i_1_8,
                                            :i_1_9, :i_1_10, :i_1_11, :i_2_1, :i_2_2, :i_2_3, :i_2_4, :i_2_5,
                                            :i_2_6, :i_2_7, :i_2_8, :i_2_9, :i_2_10, :i_2_11, :i_2_12, :i_2_13,
                                            :i_3_1, :i_3_2, :i_3_3, :i_3_4, :i_3_5, :i_3_6, :i_3_7, :i_3_8,
                                            :i_3_9, :i_3_10, :i_3_11)
  end

  def detect_invalid_user
    denied_action if @questionnaire.user != current_user.email
  end

  def denied_action
    redirect_to :questionnaires, alert: "Попытка доступа к не существующей или созданной не Вами анкете"
  end
end
