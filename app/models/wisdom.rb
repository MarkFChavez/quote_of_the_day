class Wisdom
  ENDPOINT = "http://quotes.rest/qod.json"

  def get
    JSON.parse(response.body)["contents"]["quotes"].first
  end

  private

  def response
    uri = URI.parse ENDPOINT
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))

    response
  end
end
