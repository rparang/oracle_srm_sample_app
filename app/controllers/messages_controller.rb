class MessagesController < ApplicationController

  def index
    @messages = Message.fetch_all(bundle_id: params[:bundle_id])
    @bundles = SrmBundle.all.map { |bundle| [bundle.name, bundle.id] }
  end

end
