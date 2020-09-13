class Question < ApplicationRecord
    #これはquestionモデル。クラスとおんなじイメージで、メソッドとか変数とか定義できる。
    attr_accessor :search_quiz, :search_answer

  def search
    #絞り込むイメージ！
    Question.ransack(quiz_cont: @search_quiz, answer_cont: @search_answer).result
    
  end
end
