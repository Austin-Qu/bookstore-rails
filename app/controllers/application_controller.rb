class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_ips
    Visitor.create(remote_ip: request.remote_ip, visit_time: Time.zone.now)
  end
end
