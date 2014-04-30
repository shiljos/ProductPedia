require 'mandrill'

class MandrillDelivery
  attr_accessor :message

  def initialize(mail)
     Rails.logger.info "KONSTRUKT"
  end

  def deliver!(mail)
    Rails.logger.info "DELIVER"
    build_meta_mandrill(mail)
    send_mandrill(mail)
  end

#Message stuff

  def build_meta_mandrill(mail)
    Rails.logger.info "METAMAANDRILL"
    #build Mandrill message hash
    @message = {
      :from_name=> "Admin",
      :from_email=>"shiljos@gmail.com",
      :subject=> "#{mail['subject']}",
      :to=>[
            {
              :email=> "#{mail['to']}"
            }
           ],
      :auto_text => true,
      :global_merge_vars => [
                             {
                               :name => "LISTCOMPANY",
                               :content => "Company Name Here"
                             }
                            ]
    }

    true
  end

  #sends email via Mandrill
  def send_mandrill(mail)
    Rails.logger.info "SENDING"
    m = Mandrill::API.new '1sKnfkoiNApaL5o08AHBBQ'

    sending = m.messages.send(@message)
    Rails.logger.info sending
    Rails.logger.info "POSSLATOOOOOOOOOO"
  end

end

