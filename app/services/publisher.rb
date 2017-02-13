class Publisher
  def self.publish(exchange, message = {})
    x = channel.fanout("urlockbox.#{exchange}")
    x.publish(message.to_json)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new(ENV['RABBITMQ-PUBLISHER']).tap do |c|
      c.start
    end
  end
end
