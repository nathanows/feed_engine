set :output, "../log/cron_log.log"

every 15.minutes do
  rake "pull_data:all_twitter"
end
