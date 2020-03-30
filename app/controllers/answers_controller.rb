class AnswersController < ApplicationController
    

    def new
        @answer = Answer.new
    end

    
    def create
        @answer = Answer.new(answer_params)
        if @answer.save
            SampleMailer.send_when_create_answer(@answer).deliver
        else
            render 'new'
        end
    end
    
    
    
    private
    
    def answer_params
        params.require(:answer).permit(:inqiry_id, :content)
    end
    
end
