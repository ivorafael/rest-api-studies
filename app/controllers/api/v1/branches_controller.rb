class Api::V1::BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :update, :destroy]

  def list_by_school
    @school = Api::V1::School.find_by(slug: params[:school])

    # logger.debug '---------------------------------------------'
    # logger.debug @school.nil?
    # logger.debug '---------------------------------------------'

    if @school.nil?
      render json: {'success' => false, 'error' => 'no_school_found'}
    else
      @branches = Api::V1::Branch.where({'school_id' => @school[:id]})

      if @branches.empty?
        render json: {'success' => false, 'error' => 'no_branch_found'}
      else
        render json: {'success' => true, 'branches' => @branches}  
      end
    end
  end

  # GET /branches
  # GET /branches.json
  def index
    @branches = Api::V1::Branch.all

    render json: @branches
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    render json: @branch
  end

  # POST /branches
  # POST /branches.json
  def create
    params = branch_params

    if !params.has_key?(:active)
      params[:active] =  true
    end

    @branch = Api::V1::Branch.new(params)

    if @branch.save
      params[:slug] = "#{@branch[:name].dasherize.downcase}-#{@branch[:school_id]}-#{@branch[:id]}"

      if @branch.update(params)
        render json: @branch, status: :created
      else
        render json: @branch.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    @branch = Api::V1::Branch.find(params[:id])

    if @branch.update(branch_params)
      head :no_content
    else
      render json: @branch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy

    head :no_content
  end

  private

    def set_branch
      @branch = Api::V1::Branch.find(params[:id])
    end

    def branch_params
      params.require(:branch).permit(:name, :slug, :school_id, :active)
    end
end
