require 'spec_helper'

describe(Task) do
  it("tells which list it belongs to") do
    list = List.create({:name => 'stuff to do'})
    task = Task.create({:description => "wash the dog", :list_id => list.id})
    expect(task.list()).to(eq(list))
  end
 end
