class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update edit destroy]
  def index
    # @questions = Question.all
    
    #新しいインスタンす創って、、
    question = Question.new(params_question_search)#検索窓の値使うから引数にする。
    #引数使って(?)検索かける。この関数はモデルで定義。
    @questions = question.search
  end



  def new
    @question = Question.new
    @title = "新規作成"
    @button_value = "作成"
  end
  
  def create
    Question.create(question_params)
    redirect_to root_path, notice: "新規作成できました！"
    
  end
  
  def edit
    # @question = Question.find(params[:id])
    @title = "編集"
    @button_value = "保存する"
  end
  
  def update
    # @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to root_path, notice: "保存が完了しました！"
  end
  
  def destroy
    # @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice:"削除しました！"
  end
  
  # def search
  #   #新しいインスタンツ創って、、
  #   question = Question.new(params_question_search)
  #   #それを検索かける。この関数はモデルで定義
  #   @questions = question.search
  # end
  
  private
  def question_params
    params.require(:question).permit(:quiz, :answer)
  end
  def set_question
    @question = Question.find(params[:id])
  end
  #permit関数についての解説。
  #permitは違うデータが渡されるとエラーを起こすという勘違いをしていたがそうではなく、
  # 違うデータが渡されたときは、それを「捨てる。」
  # ちなみにparamsの値は、ターミナル画面のこれ（https://prnt.sc/ugagwv）。
  def params_question_search
    params.permit(:search_quiz, :search_answer)
  end
end
