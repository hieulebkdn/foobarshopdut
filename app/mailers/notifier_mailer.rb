class NotifierMailer < ApplicationMailer
	default :from => "Foo Bar Shop <foobarshop.dut@gmail.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.order_received.subject
  #
  def order_received(order)
    @order = order
    mail :to => "bengoctrong@gmail.com", :subject => "We've received your order"
    # mail :to => @order.email, :subject => "We've received your order"
  end
end
