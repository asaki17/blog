class ContactsController < ApplicationController
   
  before_action :set_contact, only:[:edit, :update, :destroy]

  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end
  
  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice:"保存しました"
    else
      render 'new'
    end
  end

 def index
   @contacts = Contact.all
 end
 
 def edit
 end
 
 def update
   if @contact.update(contact_params)
     redirect_to contacts_path, notice: "ブログを編集しました！"
   else
     render 'edit'
   end
 end
 
 def destroy
   @contact.destroy
   redirect_to contacts_path, notice: "ブログを削除しました！"
 end

  def confirm 
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end
  
   private
   def contact_params
    params.require(:contact).permit(:name,:mail,:content)
   end

   def set_contact
     @contact = Contact.find(params[:id])
   end
end
