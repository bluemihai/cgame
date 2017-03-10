namespace :games do
  desc "Change status of old games to Completed"
  task complete: :environment do
    games = Game.all.select do |game|
      game.starting < Time.now && game.status != 'completed'
    end
    puts "Updating #{games.size} old games to Completed status..."
    games.each do |game|
      game.update(status: :completed)
    end
  end

  desc "Change status of future games to Confirmed"
  task confirm: :environment do
    games = Game.all.select do |game|
      game.starting > Time.now && game.status == 'completed'
    end
    puts "Updating #{games.size} future games to Confirmed status..."
    games.each do |game|
      game.update(status: :confirmed)
    end
  end
end