env :PATH, ENV["PATH"]
set :output, "#{path}/log/cron.log"

every :day, :at => "10am" do
  rake "generate_quote"
end
