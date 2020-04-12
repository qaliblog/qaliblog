class ContactsController < ApplicationController
  before_action :require_user
  before_action :set_contact, only: [:show, :destroy, :edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def new
    @contact = Contact.new
    if current_user.admin?
      @contacts = Contact.all
    else
      @userid = current_user.id
      @contacts = Contact.where(user_id: @userid).all
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      flash[:success] = t('cont.contacts.created')
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = t('cont.contacts.updated')
      redirect_to contact_path(@contact)
    else
      render 'edit'
    end
  end

  def index
    if current_user.admin?
      @contacts = Contact.all.recent_first
    else
      @userid = current_user.id
      @contacts = Contact.where(user_id: @userid).all.recent_first
    end
  end


  def show
    @user = User.find(@contact.user_id)
  end


  def destroy
    @contact.destroy
    flash[:danger] = t('cont.contacts.deleted')
    redirect_to contacts_path
  end


  private
  def set_contact
    @contact = Contact.find(params[:id])
  end
  def contact_params
    params.require(:contact).permit(:title, :description)
  end
  def require_same_user
    if current_user != @contact.user and !current_user.admin?
      flash[:danger] = t('cont.contacts.requireuser')
      redirect_to root_path
    end
  end

end
