class Ps1::DivideByZeroController < ApplicationController
  def page
    logger.error("its an error!! you just tried to divide by nothing")
    @res = 100/0

  end



end
