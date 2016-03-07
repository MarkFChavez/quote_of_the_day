task generate_quote: :environment do
  recipients = ["+639178574111", "+639165676550"]
  from = Rails.application.secrets.twilio_number
  auth_sid = Rails.application.secrets.auth_sid
  auth_token = Rails.application.secrets.auth_token

  puts "Starting JOB..."
  puts "==============="

  @client = Twilio::REST::Client.new auth_sid, auth_token
  body = ContentBuilder.build

  recipients.each do |recipient|
    @client.messages.create(
      from: from,
      to: recipient,
      body: body
    )

    puts "SMS sent to #{recipient}"
  end
end
