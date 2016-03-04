env :PATH, ENV["PATH"]
set :output, "#{path}/log/cron.log"

every :day, :at => "9pm" do
  rake "generate_quote"
end
