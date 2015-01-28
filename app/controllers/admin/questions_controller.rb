class Admin::QuestionsController < ApplicationController

  before_filter :authorize


  def index
    @question = Question.all

    respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  end

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end


  def new
    @question = Question.new

    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end


  def edit
    @question = Question.find(params[:id])
  end


  def create
    @question = Question.new(params[:article])

    respond_to do |format|
      if @question.save
        format.html { redirect_to admin_questions_url, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: [:admin,@question] }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @article = Question.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to admin_questions_url, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to admin_questions_url }
      format.json { head :no_content }
    end
  end
end
