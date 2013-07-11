module ApplicationHelper
  def new_link(name)
    link_to "Create new #{name}", send("new_#{name}_url")
  end

  def edit_link(name)
    link_to "Edit #{name}", send("edit_#{name}_url")
  end

  def destroy_button(object)
    button_to "Delete #{object.class.name.downcase}", object, method: :delete
  end
end
