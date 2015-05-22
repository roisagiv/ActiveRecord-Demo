Rake.application.remove_task 'db:test:load'
Rake.application.remove_task 'db:test:purge'

namespace :db do
  namespace :test do
    task :load do |t|
      # nothing!
    end
    task :purge do |t|
      # nothing!
    end
  end
end
