class HotreadsService
  def self.send_link(url)
    conn = Faraday.new(url: "https://hotreads.herokuapp.com/")
    conn.post '/api/v1/reads', {url: url}
  end
end
