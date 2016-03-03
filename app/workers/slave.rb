class Slave
  include Sidekiq::Worker

  def perform
    puts WisdomGenerator.generate
  end
end
