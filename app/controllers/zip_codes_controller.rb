class ZipCodesController < ApplicationController
  def index
  end

  def search
    @states = ZipCodes.identify(params[:zip_code])
    @states = [] << @states unless @states.kind_of?(Array)
  end
end
