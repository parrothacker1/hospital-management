include ActiveRecord
include ActiveSupport

class DoctorsController < ApplicationController
  def create
    @result=nil
    @data=ActiveSupport::JSON.decode(request.body.read)
    begin
      @hospital=Hospital.find(params[:id])
      @result=true
    rescue ActiveRecord::RecordNotFound
      @result=false
    end
    if @result==false
      @result={ :result => "hospital_do_not_exists" }
    else
      @doctor=@hospital.doctor.find_by(name: @data["name"])
      if @doctor==nil
        @hospital.doctor.create(
          name:@data["name"],
          salary:@data["salary"],
          dept:@data["dept"]
        )
        @result = {:result => true}
      else
        @result={:result => "already_exists"}
      end
    end
    render json: @result
  end

  def update
     @result=nil
     @data=ActiveSupport::JSON.decode(request.body.read)
    begin
      @hospital=Hospital.find(params[:id])
      @result=true
    rescue ActiveRecord::RecordNotFound
      @result=false
    end
    if @result==false
      @result={ :result => "hospital_do_not_exists" }
    else
      begin
        @hospital.doctor.find(params[:docid])
        @hospital.doctor.update(
          name:@data["name"],
          salary:@data["salary"],
          dept:@data["dept"]
        )
        @result= {:result => true}
      rescue ActiveRecord::RecordNotFound
        @result= {:result => "do_not_exists" }
      end
     
    end
    render json: @result
  end

  def list
    @doctors=Hospital.find(params[:id]).doctor.all
    render json: @doctors
  end

  def delete
    @result=nil
    begin
      @hospital=Hospital.find(params[:id])
      @result=true
    rescue ActiveRecord::RecordNotFound
      @result=false
    end
    if @result==false
      @result={ :result => "hospital_do_not_exists" }
    else
      begin
        @hospital.doctor.find(params[:docid]).destroy
        @result= {:result => true}
      rescue ActiveRecord::RecordNotFound
        @result= {:result => "do_not_exists" }
      end
    end
    render json: @result
  end
end
