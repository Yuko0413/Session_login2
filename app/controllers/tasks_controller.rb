class TasksController < ApplicationController
  before_action :logged_in_user
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('.created')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: t('.destroyed')
  end

  private

    def set_task
      @task = current_user.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to tasks_path, alert: 'タスクが見つかりません'
    end

    def task_params
      params.require(:task).permit(:title, :content)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_path
      end
    end
end
