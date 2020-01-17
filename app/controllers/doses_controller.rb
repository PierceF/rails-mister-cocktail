# frozen_string_literal: true

class DosesController < ApplicationController
  before_action :set_cocktail

  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = dose.find(params[:id])
    @dose.update(dose_params)
    redirect_to doses_path
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description) # what else should I put in here?
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:ingredient_id])
  end
end
