task generate_quote: :environment do
  quote = WisdomGenerator.generate
  recipients = ["+639178574111"]
  from = Rails.application.secrets.twilio_number
  auth_sid = Rails.application.secrets.auth_sid
  auth_token = Rails.application.secrets.auth_token

  puts "AUTH SID: #{Rails.application.secrets}"

  @client = Twilio::REST::Client.new auth_sid, auth_token

  recipients.each do |recipient|
    @client.messages.create(
      from: from,
      to: recipient,
      body: quote
    )

    puts "sent an sms to #{recipient}"
  end
end
