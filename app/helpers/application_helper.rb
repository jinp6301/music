module ApplicationHelper
  def destroy_button(object)
    button_to "Delete #{object.class.name.downcase}", object, method: :delete
  end
end
