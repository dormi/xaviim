require "application_system_test_case"

class SitesTest < ApplicationSystemTestCase
  OK_TEXT = "This page can be read though /example?key=secret"
  KO_TEXT = "You may need to authenticate to see this page, or the page doesn't exist at all."

  test "visiting a site with a valid key works" do
    visit "/example?key=secret"
  
    assert_text OK_TEXT
  end

  test "visiting a site without key is forbidden" do
    visit "/example"
  
    assert_text KO_TEXT
  end
  
  test "visiting a site with invalid key is forbidden" do
    visit '/example?key=wrong'
  
    assert_text KO_TEXT
  end

  test "visiting a site without key works after a first visit with key" do
    visit '/example?key=secret'  
    visit '/example'

    assert_text OK_TEXT
  end

  test "visiting an unknown site without key is forbidden" do
    visit '/unknown'
  
    assert_text KO_TEXT
  end

  test "visiting an unknown site with unexisting key is forbidden" do
    visit '/unknown?key=wrong'
  
    assert_text KO_TEXT
  end

  test "visiting an unknown site with existing key is forbidden" do
    visit '/unknown?key=secret'
  
    assert_text KO_TEXT
  end
end
