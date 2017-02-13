# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"

    conn = Bunny.new(ENV['RABBITMQ-PUBLISHER'])
    conn.start

    ch = conn.create_channel

    # get or create exchange
    x = ch.fanout("urlockbox.links")

    # get or create queue (note the durable setting)
    queue = ch.queue("hotreads.links", durable: true)

    # bind queue to exchange
    queue.bind("urlockbox.links")

    conn.close
  end
end
