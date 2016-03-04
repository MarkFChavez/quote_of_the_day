set :output, "#{path}/log/cron.log"

every :day, :at => "11am" do
  rake "generate_quote"
end
