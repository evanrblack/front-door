# This class is inherited from by all mailers.
class ApplicationMailer < ActionMailer::Base
  default from: 'help@myfrontdoor.co'
  layout 'mailer'
end
