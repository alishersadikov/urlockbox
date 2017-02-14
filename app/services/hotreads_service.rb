class HotreadsService
  def self.send_link(url)
    conn = Faraday.new(url: "http://localhost:3000")
    conn.post '/api/v1/reads', {url: url}
  end
end
