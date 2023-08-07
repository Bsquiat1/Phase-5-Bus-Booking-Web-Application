class MpesaController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :payment
  
    def payment
      mpesa_service = MpesaService.new('ZGR0ADakz2MzJS6nV2p5umiRLzV6Ck4w', 'ASRyBgy708MI8kD4')
      phone_number = params[:phone_number]
      amount = params[:amount]
  
      response = mpesa_service.send_payment(phone_number, amount)
  
      if response['ResponseCode'] == '0'
        # Payment request was successful
        render json: { message: 'Payment initiated successfully', data: response }, status: :ok
      else
        # Handle payment errors
        render json: { message: 'Payment failed', data: response }, status: :unprocessable_entity
      end
    end
  end
  