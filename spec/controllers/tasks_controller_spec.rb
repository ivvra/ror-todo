require 'rails_helper'

RSpec.describe TasksController, type: :controller do
    describe "List tasks" do
        it "should list tasks of the given bucket" do
            bucket1 = Bucket.create({name: "bucket1"})
            bucket2 = Bucket.create({name: "bucket2"})
            ["learn ruby", "learn rails"].each { |t| Task.create!(title: t, bucket: bucket1) }
            ["fetch milk", "get tickets", "do something"].each { |t| Task.create!(title: t, bucket: bucket2) }
            
            get :index, params: {bucket_id: bucket1.id}, format: :json
            resp = JSON.parse(response.body)
            titles = resp.pluck("title")
            expect(resp.count).to eq(2)
            expect(titles).to include("learn ruby")
            expect(titles).to include("learn rails")
            expect(titles).not_to include("fetch milk")
            
        end
    end
end
