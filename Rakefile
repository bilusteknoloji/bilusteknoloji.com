task :default => [:run_server]

desc "run server"
task :run_server do
  system %{
    bin/middleman server
  }
end

desc "build site"
task :build do
  system %{
    bin/middleman build --clean --verbose
  }
end

desc "deploy"
task :deploy do
  now = Time.now.strftime("%Y-%m-%d-%H-%M")

  system %{
    cd build/ &&
    git pull &&
    cd ../ &&
    bin/middleman build --clean --verbose &&
    cd build/ &&
    git add . &&
    git commit -m "release #{now}" &&
    git push &&
    cd ../ &&
    git pull
  }
  puts "deployed..."
end
