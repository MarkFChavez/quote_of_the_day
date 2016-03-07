env :PATH, ENV["PATH"]
set :output, "#{path}/log/cron.log"

every :day, :at => "9am" do
  rake "generate_quote"
end
