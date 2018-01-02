class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.order_confirmation.subject
  #
  def order_confirmation(order)
    @greeting = "Hi"
    @order = order
    mail to: "#{order.user.email}",subject: "your order has been confirmed - #{order.order_number}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.welcome_email.subject
  #
  def welcome_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
