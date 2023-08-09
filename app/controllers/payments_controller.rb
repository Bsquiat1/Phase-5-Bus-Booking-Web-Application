class PaymentsController < ApplicationController
    def initiate_online_payment
      amount = params[:amount]
      phone_number = params[:phone_number]
      paybill_number = 'YOUR_PAYBILL_NUMBER'
      callback_url = 'YOUR_CALLBACK_URL'
  
      response = MpesaService.initiate_payment(amount, phone_number, paybill_number, callback_url)
  
      # Handle the response, redirect to success/failure page, etc.
    end
  
    # Implement USSD payment callback handler here
  end
  