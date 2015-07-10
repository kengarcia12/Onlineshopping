class ContactsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_layout"
  respond_to :html
  def index

  end
end
