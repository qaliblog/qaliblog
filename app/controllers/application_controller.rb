class ApplicationController < ActionController::Base
  before_action :set_locale,:setlanstyle
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = t('cont.application.requireuser')
      redirect_to root_path
    end
  end


  def default_url_options
    { locale: I18n.locale }
  end



  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def setlanstyle
    if I18n.locale == :en
      open("#{Rails.root}/app/assets/lanstyle/_lans.scss", "w") do |lans|
        lans.write(
            "$aleft : left;
            $aright : right;
            $dir : ltr;
            $letterspace : auto;
            $wordspace : auto;
            $linespace : auto;
            $iconwsp: auto;
            $fblogo : 'ubuntubi';
            $fthead : 'ubuntub mono';
            $ft : 'ubuntub';
            $fr : 'ubuntur';")
      end
    elsif I18n.locale == :fa
      open("#{Rails.root}/app/assets/lanstyle/_lans.scss", "w") do |lans|
        lans.write(
          "$aleft : right;
          $aright : left;
          $dir : rtl;
          $letterspace : 0.1px;
          $wordspace : 1.2px;
          $linespace : auto;
          $iconwsp: 3px;
          $fblogo : 'helal';
          $fthead : 'koodak';
          $ft : 'zar';
          $fr : 'koodak';")
      end
    end
  end






end
