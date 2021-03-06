class Api::V1::BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :update, :destroy]
  before_action :set_school_id, only: [:list_by_school_id]

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /p/branches
  # GET /p/branches.json
  def list_by_school_id
    @branches = Api::V1::Branch.where({'school_id' => @school_id})

    render json: @branches
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /branches
  # GET /branches.json
  def index
    @branches = Api::V1::Branch.all

    render json: @branches
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /branches/1
  # GET /branches/1.json
  def show
    render json: @branch
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # POST /branches
  # POST /branches.json
  def create
    params = branch_params

    if !params.has_key?(:active)
      params[:active] =  true
    end

    @branch = Api::V1::Branch.new(params)

    if @branch.save
      render json: @branch, status: :created
    else
      render json: @branch.errors, status: :unprocessable_entity
    end
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    @branch = Api::V1::Branch.find(params[:id])

    if @branch.update(branch_params)
      head :ok
    else
      render json: @branch.errors, status: :unprocessable_entity
    end
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy

    head :no_content
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  private

    def set_school_id
      @school_id = params[:school_id] || Base64.decode64(request.headers["s651o"]).split(".")[2][1..100].to_i / 624
      logger.debug @school_id
    end

    def set_branch
      @branch = Api::V1::Branch.find(params[:id])
    end

    def branch_params
      params.require(:branch).permit(:name, :school_id, :active)
    end
end
