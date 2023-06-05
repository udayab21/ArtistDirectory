class ArtistMailer < ApplicationMailer

    def email_artist(artist,  message)
        @artist = artist
        
        @message = message
    
        mail(to: @artist.email, subject: 'Message from a fan')
      end
end
