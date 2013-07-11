module ApplicationHelper
  def edit_link(name)
    link_to "Edit #{name}", send("edit_#{name}_url")
  end

  def destroy_button(object)
    button_to "Delete #{object.class.name.downcase}", object, method: :delete
  end
end
