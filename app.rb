require "google_drive"
require 'json'
load 'lib/scrapper.rb'


def perform
  session = GoogleDrive::Session.from_config("config.json")

  ws = session.spreadsheet_by_key("1Lal6yeIedu1jTEwkezThPJJ5Q5B9VMEOGx0mH8S8PXY").worksheets[0]

  mailing_list = get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls)

  for i in (1..mailing_list.length-1)
    ws[i, 1] = mailing_list[i][:name]
    ws[i, 2] = mailing_list[i][:email]
    ws.save
  end
  ws.reload
end
perform
