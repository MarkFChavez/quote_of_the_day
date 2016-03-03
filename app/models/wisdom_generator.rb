class WisdomGenerator
  ENDPOINT = "http://quotes.rest/qod.json"

  def self.generate
    new.generate
  end

  def generate
    return random_quote unless response.code == "200"

    quote_hash = JSON.parse(response.body)["contents"]["quotes"].first
    quote_hash["quote"]
  end

  private

  def random_quote
    ["quote a", "quote b", "quote c"].sample
  end

  def response
    uri = URI.parse ENDPOINT
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))

    response
  end
end
