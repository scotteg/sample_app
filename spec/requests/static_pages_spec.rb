require 'spec_helper'

describe 'StaticPages' do
  subject {page}

  shared_examples_for :all_static_pages do
    it {should have_content(heading)}
    it {should have_title(full_title(page_title))}
  end

  describe 'Home page' do
    before {visit root_path}
    let(:heading) {'Sample App'}
    let(:page_title) {''}
    it_should_behave_like :all_static_pages
    it {should_not have_title('| Home')}
  end

  describe 'Help page' do
    before {visit help_path}
    let(:heading) {'Help'}
    let(:page_title) {'Help'}
    it_should_behave_like :all_static_pages
  end

  describe 'About page' do
    before {visit about_path}
    let(:heading) {'About Us'}
    let(:page_title) {'About Us'}
    it_should_behave_like :all_static_pages
  end

  describe 'Contact' do
    before {visit contact_path}
    let(:heading) {'Contact'}
    let(:page_title) {'Contact'}
    it_should_behave_like :all_static_pages
  end

  it 'should have the right links on the layout' do
    visit root_path
    click_link 'Home'
    expect(page).to have_title(full_title(''))
    click_link 'Sign up now!'
    expect(page).to have_title(full_title('Sign up'))
    click_link 'About'
    expect(page).to have_title(full_title('About Us'))
    click_link 'Help'
    expect(page).to have_title(full_title('Help'))
    click_link 'Contact'
    expect(page).to have_title(full_title('Contact'))
    click_link 'sample app'
    expect(page).to have_title(full_title(''))
  end
end
