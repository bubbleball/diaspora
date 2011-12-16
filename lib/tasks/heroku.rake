namespace :heroku do
  task :config do
    puts "Reading config/application.yml and sending config vars to Heroku..."
    CONFIG = YAML.load_file('config/application.yml')['production'] rescue {}
    command = "heroku config:add"
    CONFIG.each {|key, val| puts "#{key}: #{val}"; command << " #{key}=#{val} " unless val.blank? }
    command << " HEROKU=true "
    puts command
    system command
  end
end
