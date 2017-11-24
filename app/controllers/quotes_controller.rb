class QuotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_if_its_not_admin?, only: [:new, :create, :show, :edit, :destroy, :index_all_not_approved_questions, :approve, :disapprove]
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @page = (params[:page] || 0).to_i
    @quotes = Quote.all.offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Цитата була успішно створена.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Цитата була успішно редагована.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Цитата була успішно деактивована.' }
      format.json { head :no_content }
    end
  end

  private
    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.require(:quote).permit(:text, :author, :likes)
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
