class QuestionnairesController < ApplicationController

  include Pagy::Backend

  before_action :authenticate_user!, except: [:index]
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]
  before_action :detect_invalid_user, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :denied_action

  def index
    params[:search]='' if params[:commit]=='Показать все'
    params[:search].strip! if params[:search]
    @pagy, @questionnaires = pagy(Questionnaire.where('user LIKE ? AND (fio LIKE ? OR code = ?)',
                                                      user_signed_in? ? current_user.email : '%',
                                                      "%#{params[:search]}%",
                                                      params[:search]).order(:fio))
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
                                            :fatigability, :average_score, :category, :children_weight,
                                            :children_height, :children_bmi,
                                            :i_1_1, :i_1_2, :i_1_3, :i_1_4, :i_1_5, :i_1_6, :i_1_7, :i_1_8,
                                            :i_1_9, :i_1_10, :i_1_11, 
                                            :i_2_1, :i_2_2, :i_2_3, :i_2_4, :i_2_5, :i_2_6, :i_2_7, :i_2_8,
                                            :i_2_9, :i_2_10, :i_2_11, :i_2_12, :i_2_13,
                                            :i_3_1, :i_3_2, :i_3_3, :i_3_4, :i_3_5, :i_3_6, :i_3_7, :i_3_8,
                                            :i_3_9, :i_3_10, :i_3_11,
                                            :i_4_1, :i_4_2, :i_4_3, :i_4_4, :i_4_5, :i_4_6, :i_4_7, :i_4_8,
                                            :i_4_9, :i_4_10, :i_4_11, :i_4_12, :i_4_13,
                                            :i_5_1, :i_5_2, :i_5_3, :i_5_4, :i_5_5, :i_5_6, :i_5_7, :i_5_8,
                                            :i_5_9, :i_5_10, :i_5_11, :i_5_12, :i_5_13, :i_5_14, :i_5_15, :i_5_16,
                                            :i_5_17, :i_5_18, :i_5_19, :i_5_20,
                                            :i_6_1, :i_6_2, :i_6_3,
                                            :i_7_1, :i_7_2, :i_7_3,
                                            :i_8_1, :i_8_2, :i_8_3, :i_8_4, :i_8_5, :i_8_6, :i_8_7, :i_8_8,
                                            :i_8_9, :i_8_10, :i_8_11,
                                            :i_9_1, :i_9_2, :i_9_3, :i_9_4, :i_9_5, :i_9_6,
                                            :i_10_1,
                                            :i_11_1,
                                            :i_12_1, :i_12_2, :i_12_3,
                                            :i_13_1, :i_13_2, :i_13_3,
                                            :i_14_1, :i_14_2, :i_14_3,
                                            :i_15_1, :i_15_2, :i_15_3,
                                            :i_16_1, :i_16_2, :i_16_3,
                                            :i_17_1, :i_17_2, :i_17_3,
                                            :ii_1_1, :ii_1_2, :ii_1_3, :ii_1_4, :ii_1_5, :ii_1_6, :ii_1_7, :ii_1_8,
                                            :ii_1_9,
                                            :ii_2_1, :ii_2_2, :ii_2_3, :ii_2_4, :ii_2_5, :ii_2_6, :ii_2_7, :ii_2_8,
                                            :ii_2_9, :ii_2_10, :ii_2_11, :ii_2_12,
                                            :ii_3_1, :ii_3_2, :ii_3_3,
                                            :ii_4_1, :ii_4_2, :ii_4_3, :ii_4_4, :ii_4_5, :ii_4_6, :ii_4_7, :ii_4_8,
                                            :ii_4_9, :ii_4_10, :ii_4_11, :ii_4_12,
                                            :ii_5_1, :ii_5_2, :ii_5_3, :ii_5_4, :ii_5_5,
                                            :ii_6_1, :ii_6_2, :ii_6_3, :ii_6_4,
                                            :iii_1_1, :iii_1_2, :iii_1_3, :iii_1_4,
                                            :iii_2_1, :iii_2_2, :iii_2_3, :iii_2_4,
                                            :iii_3_1, :iii_3_2, :iii_3_3, :iii_3_4,
                                            :iii_4_1, :iii_4_2, :iii_4_3, :iii_4_4, :iii_4_5, :iii_4_6, :iii_4_7,
                                            :iii_4_8, :iii_4_9, :iii_4_10, :iii_4_11, :iii_4_12, :iii_4_13, :iii_4_14,
                                            :iii_4_15, :iii_4_16, :iii_4_17, :iii_4_18, :iii_4_19, :iii_4_20, :iii_4_21,
                                            :iii_4_22, :iii_4_23, :iii_4_24, :iii_4_25, :iii_4_26, :iii_4_27,
                                            :iii_5_1, :iii_5_2, :iii_5_3, :iii_5_4, :iii_5_5, :iii_5_6,
                                            :iii_6_1, :iii_6_2, :iii_6_3, :iii_6_4, :iii_6_5, :iii_6_6, :iii_6_7,
                                            :iii_6_8, :iii_6_9, :iii_6_10, :iii_6_11, :iii_6_12, :iii_6_13,
                                            :iii_7_1, :iii_7_2, :iii_7_3, :iii_7_4, :iii_7_5, :iii_7_6, :iii_7_7,
                                            :iii_8_1, :iii_8_2, :iii_8_3,
                                            :iii_9_1, :iii_9_2, :iii_9_3,
                                            :iii_10_1, :iii_10_2, :iii_10_3,
                                            :iii_11_1, :iii_11_2, :iii_11_3,
                                            :iii_12_1, :iii_12_2, :iii_12_3,
                                            :iii_13_1,
                                            :iii_14_1, :iii_14_2, :iii_14_3, :iii_14_4, :iii_14_5, :iii_14_6, :iii_14_7,
                                            :iii_14_8, :iii_14_9, :iii_14_10, :iii_14_11, :iii_14_12, :iii_14_13, :iii_14_14,
                                            :iii_14_15, :iii_14_16, :iii_14_17, :iii_14_18, :iii_14_19, :iii_14_20,
                                            :iii_15_1, :iii_15_2, :iii_15_3,
                                            :iii_16_1, :iii_16_2, :iii_16_3,
                                            :iii_17_1, :iii_17_2, :iii_17_3,
                                            :iii_18_1, :iii_18_2, :iii_18_3, :iii_18_4, :iii_18_5, :iii_18_6, :iii_18_7,
                                            :iii_19_1, :iii_19_2, :iii_19_3, :iii_19_4, :iii_19_5, :iii_19_6, :iii_19_7,
                                            :iii_19_8,
                                            :iii_20_1, :iii_20_2, :iii_20_3, :iii_20_4,
                                            :iii_21_1, :iii_21_2, :iii_21_3, :iii_21_4,
                                            :iii_22_1, :iii_22_2, :iii_22_3, :iii_22_4,
                                            :iii_23_1, :iii_23_2, :iii_23_3, :iii_23_4,
                                            :iv_1_1,
                                            :iv_2_1,
                                            :iv_3_1, :iv_3_2, :iv_3_3,
                                            :iv_4_1, :iv_4_2, :iv_4_3,
                                            :iv_5_1, :iv_5_2, :iv_5_3,
                                            :iv_6_1, :iv_6_2, :iv_6_3, :iv_6_4,
                                            :iv_7_1, :iv_7_2, :iv_7_3, :iv_7_4,
                                            :iv_8_1, :iv_8_2, :iv_8_3, :iv_8_4, :iv_8_5, :iv_8_6, :iv_8_7, :iv_8_8,
                                            :iv_8_9, :iv_8_10, :iv_8_11, :iv_8_12, :iv_8_13, :iv_8_14, :iv_8_15, :iv_8_16,
                                            :iv_8_17, :iv_8_18,
                                            :iv_9_1, :iv_9_2, :iv_9_3,
                                            :iv_10_1, :iv_10_2, :iv_10_3, :iv_10_4,
                                            :v_1_1, :v_1_2, :v_1_3, :v_1_4, :v_1_5, :v_1_6, :v_1_7, :v_1_8,
                                            :v_2_1, :v_2_2, :v_2_3,
                                            :v_3_1, :v_3_2, :v_3_3, :v_3_4, :v_3_5,
                                            :v_4_1, :v_4_2, :v_4_3,
                                            :v_5_1, :v_5_2, :v_5_3, :v_5_4,
                                            :v_6_1, :v_6_2, :v_6_3, :v_6_4,
                                            :v_7_1, :v_7_2, :v_7_3, :v_7_4,
                                            :v_8_1, :v_8_2, :v_8_3, :v_8_4,
                                            :v_9_1, :v_9_2, :v_9_3, :v_9_4,
                                            :v_10_1, :v_10_2, :v_10_3, :v_10_4,
                                            :v_11_1, :v_11_2, :v_11_3, :v_11_4,
                                            :v_12_1, :v_12_2, :v_12_3, :v_12_4,
                                            :vi_1_1, :vi_1_2, :vi_1_3, :vi_1_4, :vi_1_5, :vi_1_6,
                                            :vi_2_1, :vi_2_2, :vi_2_3, :vi_2_4,
                                            :vi_3_1, :vi_3_2, :vi_3_3, :vi_3_4,
                                            :vi_4_1, :vi_4_2, :vi_4_3, :vi_4_4,
                                            :vi_5_1, :vi_5_2, :vi_5_3, :vi_5_4,
                                            :vi_6_1, :vi_6_2, :vi_6_3, :vi_6_4,
                                            :vi_7_1, :vi_7_2, :vi_7_3, :vi_7_4)
  end

  def detect_invalid_user
    denied_action if @questionnaire.user != current_user.email
  end

  def denied_action
    redirect_to :questionnaires, alert: "Попытка доступа к не существующей или созданной не Вами анкете"
  end
end
