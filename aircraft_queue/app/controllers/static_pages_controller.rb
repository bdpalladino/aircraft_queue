class StaticPagesController < ApplicationController
  def home
  end

  def boot
  	aqm_request_process(BOOT_REQUEST, nil)
  end
end
