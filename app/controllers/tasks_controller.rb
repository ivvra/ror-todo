class TaskPresenter
    def initialize(task)
        @task = task
    end
    def as_json(options = nil)
        hsh = @task.attributes.slice("id", "done", "title")
        puts hsh.inspect
        hsh
    end
end
class TasksController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @tasks = Task.where(bucket_id: params[:bucket_id])
        respond_to do |f|
            f.json { render json: @tasks.to_json }
        end
    end

    def create
        bucket = Bucket.find(params[:bucket_id])
        @task = Task.create(params.require("task").permit("title").to_h.merge(bucket: bucket))
        respond_to do |format|
            format.json { render json: TaskPresenter.new(@task).to_json }
        end
    end

    def complete
        task = Task.find(params["id"])
        task.complete
        respond_to do |format|
            format.json { render json: task.to_json }
        end
    end

end
