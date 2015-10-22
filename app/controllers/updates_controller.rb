class UpdatesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:handle]

  def handle
    update = Telegrammer::DataTypes::Update.new(update_id: params[:update_id], message: params[:message])

    # process message - parse and detect accordions
    Message::Processor.process(update.message)

    # leave bot in peace
    render nothing: true
  end

end