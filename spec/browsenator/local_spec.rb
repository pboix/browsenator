describe Browsenator::Local do
  describe '.for' do
    after(:each) do
      @browser&.quit
    end

    it 'starts Chrome when browser is :chrome' do
      @browser = Browsenator::Local.for :chrome
      browser_type = @browser.driver.browser

      expect(@browser).to be_a(Watir::Browser)
      expect(browser_type).to eql(:chrome)
    end

    it 'starts Firefox when browser is :firefox' do
      @browser = Browsenator::Local.for :firefox
      browser_type = @browser.driver.browser

      expect(@browser).to be_a(Watir::Browser)
      expect(browser_type).to eql(:firefox)
    end

    it 'starts Safari when browser is :safari' do
      @browser = Browsenator::Local.for :safari
      browser_type = @browser.driver.browser

      expect(@browser).to be_a(Watir::Browser)
      expect(browser_type).to eql(:safari)
    end

    it 'throws an error when browser is unknown' do
      expect { Browsenator::Local.for :chromium }.to raise_error(ArgumentError)
    end
  end
end
