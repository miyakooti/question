class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end
  
  def create
    Question.create(question_params)
    redirect_to root_path
  end
  
  def edit
  end
  
  private
  def question_params
    params.require(:question).permit(:quiz, :answer)
  end
end
