class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    # /doses/:id
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully destroyed.'
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
end
