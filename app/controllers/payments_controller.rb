class PaymentsController < ApplicationController
  def edit
  	@payment = Payment.find(params[:format])
  end

  def update
  	@pay = Payment.find(params[:id])

    @pay.update(payment_params)

    flash[:notice] = 'Upisano plaćanje'

    redirect_to ucenik_path(@pay.ucenik_id)
  end

  private
    def payment_params
    params.require(:payment).permit(:uplaceno, :uplata)
  end
end
