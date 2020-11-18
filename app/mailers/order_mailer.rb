class OrderMailer < ApplicationMailer
  def order_email(user, order, line_items)
    @user = user
    @order = order
    @line_items = line_items
    mail(to: @user.email, subject: "Order ##{@order.id} from Jungle")
  end
end
