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
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: '成功！'
    else
      render :new
      flash[:alert] = '失敗！'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: '成功！'
    else
      flash[:alert] = '失敗'
      render :edit
    end
  end
  
  private
  
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
