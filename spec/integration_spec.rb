require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the index page path', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    test_list = List.new({:name => 'School stuff', :id => nil})
    test_list.save()
    visit('/')
    click_link(test_list.name())
    expect(page).to have_content("List of tasks")
  end

  it('allows user to add list') do
    visit('/lists/new')
    fill_in('name', with: "new list")
    click_button('Add List')
    expect(page).to have_content('Success')
  end

  it('takes user from success page to index') do
    visit('/lists')
    click_link('Back')
    expect(page).to have_content('To Do Lists')
  end

  it('shows user task_list') do
    visit('/lists/:id')
    click_link('Task')
    expect(page).to have_content('Add a task to the list:')

  end

  it('Allows the user input form task') do
    visit('/lists/:id/task/new')
    fill_in('Name:', with: "do stuff")
    click_button('Add Task')
    expect(page).to have_content('Success')
  end
 end
