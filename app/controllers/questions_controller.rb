class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  before_action :check_if_its_not_admin?, only: [:show, :edit, :destroy, :index_all_not_approved_questions, :approve, :disapprove]
  before_action :set_question, only: [:show, :edit, :update, :destroy, :approve, :disapprove]

  def index
    @questions = Question.where(approved: true)
  end

  def index_all_not_approved
    @not_approved_questions = Question.where(approved: false)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, notice: 'Питання було успішно створено. Ми постараємось відповісти вам якомога швидше!' }
        # format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Питання було успішно редаговано.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Питання було успішно видалено.' }
      format.json { head :no_content }
    end
  end

  def approve
    @question.approved = true
    if @question.save
      redirect_to index_all_not_approved_questions_path
    end
  end

  def disapprove
    @question.approved = false
    if @question.save
      redirect_to index_all_not_approved_questions_path
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:text, :answer, :isPrivate, :author, :email, :respondent_id, :likes, :approved)
    end

    def check_if_its_not_admin?
      if user_signed_in? && current_user.admin
        true
      else
        flash[:alert] = "Будь-ласка ввійдіть під своїм логіном"
        redirect_to new_user_session_path
      end
    end
end
