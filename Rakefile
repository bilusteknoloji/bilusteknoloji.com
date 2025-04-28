# frozen_string_literal: true

require 'bundler'
require 'time'
Bundler.require

task :default => [:run_server]



desc 'run console'
task :console do
  system %{
    bin/middleman console
  }
end

desc 'run server'
task :run_server do
  system %{
    bin/middleman server
  }
end

desc 'build site'
task :build do
  system %{
    bin/middleman build --clean --verbose
  }
end

desc 'deploy'
task :deploy do
  now = Time.now.strftime('%Y-%m-%d-%H-%M')

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
  puts 'deployed...'
end

VALID_LANGUAGES = ['en']
BLOG_PUBLISH_DATE_FORMAT = '%b %d, %Y %H:%M'
BLOG_FRONTMATTER_DATE_FORMAT = '%Y-%m-%d %H:%M'
BLOG_FILE_DATE_FORMAT = '%Y-%m-%d'


namespace :new do
  desc 'create blog post'
  task :post, [:title,:publish_date,:language] do |_, args|
    abort 'please enter page title!...' unless args.title

    args.with_defaults(language: 'en')
    abort "please set valid language: #{VALID_LANGUAGES.join(",")}. #{args.language} is not a valid" unless VALID_LANGUAGES.include?(args.language)

    now = Time.now
    publish_date = Time.parse(args.publish_date || now.strftime(BLOG_PUBLISH_DATE_FORMAT))
    file_date = publish_date.strftime(BLOG_FILE_DATE_FORMAT)
    file_year = publish_date.strftime('%Y')
    frontmatter_date = publish_date.strftime(BLOG_FRONTMATTER_DATE_FORMAT)
    
    output = <<-END
---
title: #{args.title}
lang: #{args.language}
date: #{frontmatter_date}
cover: #{file_date}-#{args.title.to_url}.EXT
author: Bilus Teknoloji
is_blog: true
---
END
    save_file = "source/blog/#{args.language}/#{file_year}/#{file_date}-#{args.title.to_url}.html.md.erb"

    File.open(save_file, "w") do |f|
      f.write output
    end

    puts "new post is ready at: #{save_file}"
  end
  
end

task :command_exists, [:command] do |_, args|
  abort "#{args.command} doesn't exists" if `command -v #{args.command} > /dev/null 2>&1 && echo $?`.chomp.empty?
end
task :is_repo_clean do
  abort 'please commit your changes first!' unless `git status -s | wc -l`.strip.to_i.zero?
end
task :has_bump_my_version do
  Rake::Task['command_exists'].invoke('bump-my-version')
end

AVAILABLE_REVISIONS = %w[major minor patch].freeze
task :bump, [:revision] => [:has_bump_my_version] do |_, args|
  args.with_defaults(revision: 'patch')
  unless AVAILABLE_REVISIONS.include?(args.revision)
    abort "Please provide valid revision: #{AVAILABLE_REVISIONS.join(',')}"
  end

  system %{ bump-my-version bump #{args.revision} }
  exit $?.exitstatus
end


desc "release new version #{AVAILABLE_REVISIONS.join(',')}, default: patch"
task :release, [:revision] => [:is_repo_clean] do |_, args|
  args.with_defaults(revision: 'patch')
  Rake::Task['bump'].invoke(args.revision)
end
