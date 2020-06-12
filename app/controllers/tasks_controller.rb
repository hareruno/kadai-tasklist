class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    if logged_in?
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
    #@tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render '/'
    end
=begin
@task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Task が正常に登録されました"
      redirect_to @task
    else
      flash.now[:danger] = "Task が正常に登録されませんでした"
      render :new
    end
=end
  end
  
  def edit
  end
  
  def update
    
    if @task.update(task_params)
      flash[:success] = "Task は正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "Task は更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = 'Task は正常に削除されました'
    redirect_to @task
=begin
    @task.destroy
    
    flash[:success] = "Task は正常に削除されました"
    redirect_to tasks_url
=end
  end
    
  private
  
  # before_action
  def set_task
    @task = current_user.tasks.find_by(id: params[:id])
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
