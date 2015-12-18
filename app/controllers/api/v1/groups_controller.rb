class Api::V1::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  before_action :set_branch_id, only: [:list_by_branch_id]

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /p/groups
  # GET /p/groups.json
  def list_by_branch_id
    @groups = Api::V1::Group.where({'branch_id' => @branch_id})

    render json: @groups
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /groups
  # GET /groups.json
  def index
    @groups = Api::V1::Group.all

    render json: @groups
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # GET /groups/1
  # GET /groups/1.json
  def show
    render json: @group
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # POST /groups
  # POST /groups.json
  def create
    params = group_params

    if !params.has_key?(:active)
      params[:active] =  true
    end

    @group = Api::V1::Group.new(params)

    if @group.save
      render json: @group, status: :created
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group = Api::V1::Group.find(params[:id])

    if @group.update(group_params)
      head :ok
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy

    head :no_content
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  private

    def set_branch_id
      @branch_id = params[:branch_id] || Base64.decode64(request.headers["s651o"]).split(".")[2][1..100].to_i / 624
      logger.debug @branch_id
    end

    def set_group
      @group = Api::V1::Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :branch_id, :active)
    end
end
