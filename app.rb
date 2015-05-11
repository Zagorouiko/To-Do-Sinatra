require 'sinatra'
require 'sinatra/reloader'
require("sinatra/activerecord")
also_reload 'lib/**/*.rb'
require './lib/task'
require './lib/list'
require 'pg'


get('/') do
  @lists = List.all()
  erb(:index)
end

get('/lists/new') do
  erb(:list_form)
end

post('/lists') do
  @list = List.create({:name => params.fetch("name")})
  @lists = List.all()
  erb(:list_success)
end

get("/lists") do
  @lists = List.all()
  erb(:index)
end

get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i())
  erb(:task_list)
end

get('/lists/:id/task/new') do
  @list = List.find(params.fetch('id').to_i())
  erb(:task_form)
end

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = @list.tasks().create({:description => description})
  # @task = Task.new({:description => description, :list_id => list_id})
  # @task.save()
  erb(:task_success)
end
