include ActiveRecord
include ActiveSupport

class HospitalController < ApplicationController
  def create
    @result=nil
    @data=ActiveSupport::JSON.decode(request.body.read)
    begin
      Hospital.find_by(name: @data["name"])
      @result={ :result => "already_exists" }
    rescue ActiveRecord::RecordNotFound
      Hospital.create(
        name:@data["name"],
        place:@data["place"]
      )
      begin
        Hospital.find(@data["name"])
        @result = { :result => true }
      rescue ActiveRecord::RecordNotFound
        @result = { :result => false }
      end
    end
    render json: @result
  end

  def update
    @result=nil
    @data=ActiveSupport::JSON.decode(request.body.read)
    begin
      @hospital=Hospital.find(params[:id])
      @hospital.update(
        name:@data["name"],
        place:@data["place"]
      )
      @result = { :result => true }
    rescue ActiveRecord::RecordNotFound
      @result = { :result => "do_not_exists" }
    end
    render json: @result
  end

  def list
    @all=Hospital.all
    render json: @all
  end

  def delete
    @result=nil
    begin
      @hospital=Hospital.find(params[:id])
      @hospital.destroy
      begin
        @hospital_again=Hospital.find(params[:id])
        @result={ :result => false }
      rescue ActiveRecord::RecordNotFound
        @result={ :result => true }
      end
    rescue ActiveRecord::RecordNotFound
      @result={ :result => "do_not_exists"}
    end
    render json:@result
  end
end
