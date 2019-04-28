class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all
  end

  def  show
    @coupon = current_coupon
  end

  def new
  end

  # def create
  #   coupon = Coupon.create(coupon_code: params[:coupon][:coupon_code], store: params[:coupon][:store])
  #   redirect_to coupon_path(coupon)
  # end

  def create
    permit_params = params.require(:coupon).permit(:coupon_code, :store)
    coupon = Coupon.create(permit_params)
    redirect_to coupon_path(coupon)
  end

  def current_coupon
    Coupon.find(params[:id])
  end
end
