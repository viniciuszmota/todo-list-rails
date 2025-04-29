class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  def index
    if params[:status].present?
      @tasks = current_user.tasks.where(status: params[:status])
    else
      @tasks = current_user.tasks.order(created_at: :desc) # mostra da mais recente para mais antiga
    end
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Tarefa criada com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Tarefa atualizada com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: "Tarefa excluida com sucesso"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
