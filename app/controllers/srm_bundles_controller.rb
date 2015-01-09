class SrmBundlesController < ApplicationController
  before_action :set_srm_bundle, only: [:show, :edit, :update, :destroy]

  # GET /srm_bundles
  def index
    @srm_bundles = SrmBundle.all
  end

  # GET /srm_bundles/1
  def show
  end

  # GET /srm_bundles/new
  def new
    @srm_bundle = SrmBundle.new
  end

  # GET /srm_bundles/1/edit
  def edit
  end

  # POST /srm_bundles
  def create
    @srm_bundle = SrmBundle.new(srm_bundle_params)

    if @srm_bundle.save
      redirect_to @srm_bundle, notice: 'Srm bundle was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /srm_bundles/1
  def update
    if @srm_bundle.update(srm_bundle_params)
      redirect_to @srm_bundle, notice: 'Srm bundle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /srm_bundles/1
  def destroy
    @srm_bundle.destroy
    redirect_to srm_bundles_url, notice: 'Srm bundle was successfully destroyed.'
  end

  def sync
    SrmApp.global.authorization.sync
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_srm_bundle
      @srm_bundle = SrmBundle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def srm_bundle_params
      params.require(:srm_bundle).permit(:bundle_id, :name)
    end
end
