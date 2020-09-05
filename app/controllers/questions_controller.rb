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
    redirect_to root_path, notice: "新規作成できました！"
    
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to root_path, notice: "保存が完了しました！"
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice:"削除しました！"
  end
  
  private
  def question_params
    params.require(:question).permit(:quiz, :answer)
  end
end
