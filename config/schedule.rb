env :PATH, ENV["PATH"]
set :output, "#{path}/log/cron.log"

every :day, :at => "8:25pm" do
  rake "generate_quote"
end
