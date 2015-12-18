class Api::V1::SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :update, :destroy]

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /schools
  # GET /schools.json
  def index
    @schools = Api::V1::School.all

    render json: @schools
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /schools/1
  # GET /schools/1.json
  def show
    render json: @school
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # POST /schools
  # POST /schools.json
  def create
    params = school_params

    if !params.has_key?(:active)
      params[:active] =  true
    end

    @school = Api::V1::School.new(params)

    if @school.save
      render json: @school, status: :created
    else
      render json: @school.errors, status: :unprocessable_entity    
    end
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    @school = Api::V1::School.find(params[:id])

    if @school.update(school_params)
      head :ok
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy

    head :no_content
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  private

    def set_school
      @school = Api::V1::School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :slug, :active)
    end
end
