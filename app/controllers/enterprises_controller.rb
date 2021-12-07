class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: %i[show edit update destroy]
  def index
    @enterprises = Enterprise.all
  end

  def show; end

  def new
    @enterprise = Enterprise.new
  end

  def edit; end

  def create
    @enterprise = current_user.enterprises.new(enterprise_params)

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully created.' }
        Logger.instance.log('Enterprise was successfully created.')
      else
        format.html { render :new, status: :unprocessable_entity }
        Logger.instance.log('Enterprise not created.')
      end
    end
  end

  def update
    respond_to do |format|
      if @enterprise.update(enterprise_params)
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully updated.' }
        Logger.instance.log('Enterprise was successfully updated.')
      else
        format.html { render :edit, status: :unprocessable_entity }
        Logger.instance.log("Enterprise wasn't successfully updated.")
      end
    end
  end

  def destroy
    @enterprise.destroy
    respond_to do |format|
      format.html { redirect_to enterprises_url, notice: 'Enterprise was successfully destroyed.' }
    end
    Logger.instance.log('Enterprise was successfully deleted.')
  end

  private

  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end

  def enterprise_params
    params.require(:enterprise).permit(:title, :headquaters, :description)
  end
end
