class InterestMailer < ApplicationMailer
        def send_notification_email(artist)
          @artist = artist
          mail(to: artist.email, subject: "Notification Email")
        end
end
