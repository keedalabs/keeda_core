require "administrate/base_dashboard"

class ActivityHierarchyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ancestor: Field::BelongsTo.with_options(class_name: "Activity"),
    descendant: Field::BelongsTo.with_options(class_name: "Activity"),
    ancestor_id: Field::Number,
    descendant_id: Field::Number,
    generations: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  ancestor
  descendant
  ancestor_id
  descendant_id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  ancestor
  descendant
  ancestor_id
  descendant_id
  generations
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  ancestor
  descendant
  ancestor_id
  descendant_id
  generations
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how activity hierarchies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(activity_hierarchy)
  #   "ActivityHierarchy ##{activity_hierarchy.id}"
  # end
end
