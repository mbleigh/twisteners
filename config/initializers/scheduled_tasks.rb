scheduler = Rufus::Scheduler.start_new

scheduler.every("30m") do
  User.all(:conditions => ["last_processed_at < ?", 30.minutes.ago]).each do |u|
    u.update_listener!
  end
end