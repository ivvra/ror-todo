require 'rails_helper'

RSpec.describe BucketsController, type: :controller do
    describe "GET index JSON" do
        it "should list buckets" do
            %w(personal work).each { |b| Bucket.create(name: b)}
            get :index, format: :json
            resp = JSON.parse(response.body)
            actual_buckets = resp.collect { |b| b["name"] }
            expect(resp.count).to equal(2)
            expect(actual_buckets).to include("work")
            expect(actual_buckets).to include("personal")
        end
    end
    describe "GET index HTML" do
        it "should list buckets" do
            %w(personal work).each { |b| Bucket.create(name: b)}
            get :index, format: :json
            actual_buckets = assigns[:buckets].collect(&:name)
            expect(assigns[:buckets].count).to equal(2)
            expect(actual_buckets).to include("work")
            expect(actual_buckets).to include("personal")
        end
    end

    describe "create a bucket" do
        it "should create a bucket when passed parameters via json" do
            post :create, params: {bucket: {name: "new_bucket"}}, format: :json
            buckets = Bucket.all
            actual_bucket_names = buckets.collect(&:name)
            expect(buckets.count).to eq(1)
            expect(actual_bucket_names).to include("new_bucket")
        end
    end

    describe "update the given bucket" do
        it "should update the bucket with the new name" do
            actual_bucket = Bucket.create({name: "old_bucket"})
            put :update, params: {id: actual_bucket.id, bucket: {name: "new_bucket"}}, format: :json
            last_update_bucket = Bucket.last
            expect(last_update_bucket["name"]).to eq("new_bucket")
        end
    end


end