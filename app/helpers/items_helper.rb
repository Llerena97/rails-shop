module ItemsHelper
  def item_author item
    user_signed_in? && current_user == item.user
    
  end
end
