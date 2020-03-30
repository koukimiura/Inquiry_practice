class SampleMailer < ApplicationMailer
    
    #default to: ENV['USER_EMAIL']
    
    def send_when_create(inquiry)
        @inquiry = inquiry
        mail to: 'miurak565@gmail.com', subject: 'ユーザーからのお問い合わせ'
        # ENV['USER_EMAIL']
    end 
    
    
    def send_when_create_answer(answer)
        @answer = answer
        @inquiry = Inquiry.find_by(id: @answer.inquiry_id)
        mail to: @inquiry.email, 
        subject: 'subject: 【test】 お問い合わせありがとうございます'
    end
    
end


