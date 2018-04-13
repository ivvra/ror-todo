class BucketsController < ApplicationController
    def index
        @buckets = Bucket.all
        respond_to do |format|
            format.json { render json: @buckets.to_json }
            format.html
        end
    end

    def create 
        @bucket = Bucket.create(bucket_params)
        respond_to do |format|
            format.json { render json: @bucket.to_json }
        end
    end
    
    def update
        @bucket = Bucket.find(params[:id])

        @bucket.update_attributes(bucket_params)
        respond_to do |format|
            format.json { render json: @bucket.to_json }
        end
    end

    private
    def bucket_params
        params.require("bucket").permit("name")
    end

end
