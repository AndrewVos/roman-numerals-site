class HomeController < ApplicationController
  def index
    if params[:value]
      integer = Integer(params[:value]) rescue nil
      if integer
        @converted = RomanNumerals.to_roman(integer)
      else
        @converted = RomanNumerals.to_decimal(params[:value])
        if @converted == 0
          @converted = nil
          flash.now[:error] = "Please enter a valid value"
        end
      end
    end
  end
end
