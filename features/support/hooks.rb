Before do
  Capybara.page.driver.browser.manage.window.maximize
  @data = YAML.safe_load(File.read('./features/support/config/config.yaml'))
end

After do |scenario|
  if scenario.failed?
    timestamp = Time.now.strftime('%Y-%m-%d-%H:%M:%S')
    screenshot_name = "screenshot-#{scenario.name}-#{timestamp}.png"
    screenshot_path = "./report/screenshots/#{screenshot_name}"
    Capybara.page.save_screenshot(screenshot_path, full: true)
  end
end
