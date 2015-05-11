require 'spec_helper'

describe(List) do
  it('tells which tasks are in it') do
    list = List.create({:name => 'list'})
    task1 = Task.create({:description => "task1", :list_id =>list.id})
    task2 = Task.create({:description => "task2", :list_id =>list.id})
    task3 = list.tasks().create({:description => "task3"})
    expect(list.tasks()).to(eq([task1, task2, task3]))
 end
end
