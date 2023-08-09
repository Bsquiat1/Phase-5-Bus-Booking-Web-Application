require 'rest-client'
require 'json'

class MpesaService
  BASE_URL = 'https://sandbox.safaricom.co.ke'

  def self.get_access_token
    response = RestClient.post(
      "#{BASE_URL}/oauth/v1/generate?grant_type=client_credentials",
      {},
      { authorization: "Basic #{Base64.strict_encode64('YOUR_CONSUMER_KEY:YOUR_CONSUMER_SECRET')}" }
    )
    JSON.parse(response.body)['access_token']
  end

  def self.initiate_payment(amount, phone_number, paybill_number, callback_url)
    access_token = get_access_token

    payload = {
      BusinessShortCode: paybill_number,
      Password: 'YOUR_PASSWORD',
      Timestamp: Time.now.strftime('%Y%m%d%H%M%S'),
      TransactionType: 'CustomerPayBillOnline',
      Amount: amount,
      PartyA: phone_number,
      PartyB: paybill_number,
      PhoneNumber: phone_number,
      CallBackURL: callback_url,
      AccountReference: 'YOUR_ACCOUNT_REFERENCE',
      TransactionDesc: 'YOUR_TRANSACTION_DESCRIPTION'
    }

    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{access_token}"
    }

    response = RestClient.post(
      "#{BASE_URL}/mpesa/stkpush/v1/processrequest",
      payload.to_json,
      headers
    )

    JSON.parse(response.body)
  end

  # Implement USSD payment initiation here
end
