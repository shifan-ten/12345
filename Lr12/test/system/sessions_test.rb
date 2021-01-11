# frozen_string_literal: true

require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase
  test 'should not login user with invalid credentials' do
    visit login_url

    fill_in 'Email', with: 'abcd'
    fill_in 'Password', with: 'efgh'
    click_on 'Login'

    assert_text 'Email or password is invalid'
  end

  test 'register and count' do
    login = 'testemail@email.com'
    password = 'testpass'

    visit signup_url

    fill_in 'Email', with: login
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Create User'

    assert_text 'User was created.'

    fill_in 'Email', with: login
    fill_in 'Password', with: password
    click_on 'Login'

    assert_text 'Logged in'

    fill_in 'n', with: 1000
    click_on 'Найти палиндром'


  end

  test 'register login and logout' do
    login = 'testemail@email.com'
    password = 'testpass'

    visit signup_url

    fill_in 'Email', with: login
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Create User'

    fill_in 'Email', with: login
    fill_in 'Password', with: password
    click_on 'Login'

    assert_text 'Logged in'

    click_on 'Log Out'
    assert_text 'Вход в систему'
  end
end
