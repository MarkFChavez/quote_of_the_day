set :output, "#{path}/log/cron.log"

every 1.minute do
  rake "generate_quote"
end
