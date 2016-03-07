class WisdomGenerator
  ENDPOINT = "http://quotes.rest/qod.json"

  def self.generate
    new.generate
  end

  def generate
    res = response
    return random_quote unless res.code == "200"

    generate_quote(res)
  end

  private

  def generate_quote(response)
    quote_hash = JSON.parse(response.body)["contents"]["quotes"].first
    text = quote_hash["quote"]
    author = quote_hash["author"]

    "\"#{text}\" - #{author}"
  end

  def random_quote
    [
      "\"quote a\" - author a", 
      "\"quote b\" - author b", 
      "\"quote c\" - author c", 
    ].sample
  end

  def response
    uri = URI.parse(ENDPOINT)
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))

    response
  end
end
