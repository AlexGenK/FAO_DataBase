class QuestionnairesController < ApplicationController

  include Pagy::Backend

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
    @pagy, @questionnaires = pagy(@questionnaires)
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
                                            :children_height, :children_bmi, :region, :address,
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
                                            :iii_2_1,
                                            :iii_3_1,
                                            :iii_4_1,
                                            :iii_5_1, :iii_5_2, :iii_5_3, :iii_5_4,
                                            :iii_6_1,
                                            :iii_7_1, :iii_7_2, :iii_7_3, :iii_7_4,
                                            :iii_8_1, :iii_8_2, :iii_8_3, :iii_8_4, :iii_8_5, :iii_8_6,
                                            :iii_9_1, :iii_9_2, :iii_9_3, :iii_9_4, :iii_9_5, :iii_9_6, :iii_9_7,
                                            :iii_9_8, :iii_9_9, :iii_9_10, :iii_9_11, :iii_9_12, :iii_9_13, :iii_9_14,
                                            :iii_9_15, :iii_9_16, :iii_9_17, :iii_9_18, :iii_9_19, :iii_9_20, :iii_9_21,
                                            :iii_9_22, :iii_9_23, :iii_9_24, :iii_9_25, :iii_9_26, :iii_9_27, :iii_9_28,
                                            :iii_9_29, :iii_9_30, :iii_9_31,
                                            :iii_10_1, :iii_10_2, :iii_10_3, :iii_10_4, :iii_10_5, :iii_10_6,
                                            :iii_11_1, :iii_11_2, :iii_11_3, :iii_11_4, :iii_11_5, :iii_11_6, :iii_11_7,
                                            :iii_11_8, :iii_11_9, :iii_11_10, :iii_11_11, :iii_11_12, :iii_11_13,
                                            :iii_12_1, :iii_12_2, :iii_12_3, :iii_12_4, :iii_12_5, :iii_12_6, :iii_12_7,
                                            :iii_13_1, :iii_13_2, :iii_13_3, :iii_13_4,
                                            :iii_14_1, :iii_14_2, :iii_14_3, :iii_14_4,
                                            :iii_15_1, :iii_15_2, :iii_15_3, :iii_15_4,
                                            :iii_16_1, :iii_16_2, :iii_16_3, :iii_16_4,
                                            :iii_17_1, :iii_17_2, :iii_17_3, :iii_17_4,
                                            :iii_18_1, :iii_18_2, :iii_18_3, :iii_18_4,
                                            :iii_19_1, :iii_19_2, :iii_19_3,
                                            :iii_20_1, :iii_20_2, :iii_20_3,
                                            :iii_21_1, :iii_21_2, :iii_21_3,
                                            :iii_22_1, :iii_22_2, :iii_22_3,
                                            :iii_23_1, :iii_23_2, :iii_23_3, :iii_23_4,
                                            :iii_24_1,
                                            :iii_25_1,
                                            :iii_26_1,
                                            :iii_27_1, :iii_27_2, :iii_27_3, :iii_27_4, :iii_27_5, :iii_27_6, :iii_27_7,
                                            :iii_27_8, :iii_27_9, :iii_27_10, :iii_27_11, :iii_27_12, :iii_27_13, :iii_27_14,
                                            :iii_27_15, :iii_27_16, :iii_27_17, :iii_27_18, :iii_27_19, :iii_27_20,
                                            :iii_28_1, :iii_28_2, :iii_28_3, :iii_28_4,
                                            :iii_29_1, :iii_29_2, :iii_29_3, :iii_29_4,
                                            :iii_30_1, :iii_30_2, :iii_30_3, :iii_30_4,
                                            :iii_31_1, :iii_31_2, :iii_31_3, :iii_31_4,
                                            :iii_32_1, :iii_32_2, :iii_32_3, :iii_32_4,
                                            :iii_33_1, :iii_33_2, :iii_33_3, :iii_33_4,
                                            :iii_34_1, :iii_34_2, :iii_34_3,
                                            :iii_35_1, :iii_35_2, :iii_35_3,
                                            :iii_36_1, :iii_36_2, :iii_36_3,
                                            :iii_37_1, :iii_37_2, :iii_37_3, :iii_37_4, :iii_37_5, :iii_37_6, :iii_37_7,
                                            :iii_38_1, :iii_38_2, :iii_38_3, :iii_38_4, :iii_38_5, :iii_38_6, :iii_38_7,
                                            :iii_38_8, :iii_38_9,
                                            :iii_39_1, :iii_39_2, :iii_39_3, :iii_39_4,
                                            :iii_40_1, :iii_40_2, :iii_40_3, :iii_40_4,
                                            :iii_41_1, :iii_41_2, :iii_41_3, :iii_41_4,
                                            :iii_42_1, :iii_42_2, :iii_42_3, :iii_42_4,
                                            :iii_43_1, :iii_43_2, :iii_43_3, :iii_43_4,
                                            :iv_1_1,
                                            :iv_2_1,
                                            :iv_3_1, :iv_3_2, :iv_3_3, :iv_3_4,
                                            :iv_4_1, :iv_4_2, :iv_4_3, :iv_4_4,
                                            :iv_5_1, :iv_5_2, :iv_5_3, :iv_5_4,
                                            :iv_6_1, :iv_6_2, :iv_6_3, :iv_6_4,  :iv_6_5,
                                            :iv_7_1, :iv_7_2, :iv_7_3, :iv_7_4,
                                            :iv_8_1, :iv_8_2, :iv_8_3, :iv_8_4, :iv_8_5, :iv_8_6, :iv_8_7, :iv_8_8,
                                            :iv_8_9, :iv_8_10, :iv_8_11, :iv_8_12, :iv_8_13, :iv_8_14, :iv_8_15, :iv_8_16,
                                            :iv_8_17, :iv_8_18,
                                            :iv_9_1, :iv_9_2, :iv_9_3, :iv_9_4,
                                            :iv_10_1, :iv_10_2, :iv_10_3, :iv_10_4, :iv_10_5,
                                            :iv_11_1, :iv_11_2, :iv_11_3, :iv_11_4,
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
