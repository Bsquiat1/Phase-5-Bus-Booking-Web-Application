# app/services/mpesa_service.rb

class MpesaService
    include HTTParty
    base_uri 'https://sandbox.safaricom.co.ke'  # Use the production URI for live environment
  
    def initialize(consumer_key, consumer_secret)
      @consumer_key = "ZGR0ADakz2MzJS6nV2p5umiRLzV6Ck4w"
      @consumer_secret = "ASRyBgy708MI8kD4"
    end
  
    def access_token
      response = self.class.post('/oauth/v1/generate?grant_type=client_credentials',
        basic_auth: {
          username: @consumer_key,
          password: @consumer_secret
        }
      )
      response.parsed_response['access_token']
    end
  
    def send_payment(phone_number, amount)
      access_token = access_token()
      timestamp = Time.now.strftime('%Y%m%d%H%M%S')
      password = Base64.strict_encode64("#{@consumer_key}:#{timestamp}")
      response = self.class.post('/mpesa/stkpush/v1/processrequest', {
        headers: {
          'Authorization' => "Bearer #{access_token}"
        },
        body: {
          BusinessShortCode: 'YOUR_BUSINESS_SHORTCODE',
          Password: password,
          Timestamp: timestamp,
          TransactionType: 'CustomerPayBillOnline',
          Amount: amount,
          PartyA: phone_number,
          PartyB: 'YOUR_BUSINESS_SHORTCODE',
          PhoneNumber: phone_number,
          CallBackURL: 'YOUR_CALLBACK_URL',
          AccountReference: 'YOUR_ACCOUNT_REFERENCE',
          TransactionDesc: 'Payment for order'
        }
      })
      response.parsed_response
    end
  end
  