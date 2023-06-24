class TasksController < ApplicationController
    def index
        @tasks = Task.all
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)

        respond_to do |format|
            if @task.save
                format.html { redirect_to tasks_url, notice: "Task was successfully created"}
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @task = Task.find(params[:id])
        if @task.present?
            @task.destroy
        end
        redirect_to tasks_url
    end

    

    private

    def task_params
        params.require(:task).permit(:description)
    end
end
