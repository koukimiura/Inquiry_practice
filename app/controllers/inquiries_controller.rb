class InquiriesController < ApplicationController
    
    
    def index
        @inquries = Inquiry.all.order(created_at: :desc)
        @answers= Answer.all.order(created_at: :desc)
    end
    
    
    def new
        @inquiry = Inquiry.new
    end
    
    
    def create
        @inquiry = Inquiry.new(inquiry_params)
        #respond_to do |format|
        if @inquiry.save
            SampleMailer.send_when_create(@inquiry).deliver   #確認メールを送信（メッセージを送信したよ)
            redirect_to inquiries_path
            #format.html { redirect_to inquiries_path, notice: 'Message was successfully sent.' }
            #format.json { render :index, status: :created, location: @inquiry }#メールが送信された現状:statusと:locaationは表示するurl
        else
            render 'new'
            #format.html { render :new } #newアクションに飛ばしている。
            #format.json { render json: @inquiry.errors, status: :unprocessable_entity }#おそらくエラーメッセージを出すためのコード
        end
        
        
        
    end
    
    private
    
    def inquiry_params
        params.require(:inquiry).permit(:name, :email, :content)
    end
    
    
end
