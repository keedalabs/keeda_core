require "administrate/base_dashboard"

class ActivityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    activity_topics: Field::HasMany,
    topics: Field::HasMany,
    replies: Field::HasMany.with_options(class_name: "Activity"),
    reactions: Field::HasMany,
    event: Field::HasOne,
    parent_activity: Field::BelongsTo.with_options(class_name: "Activity"),
    rich_text_content: Field::HasOne,
    versions: Field::HasMany.with_options(class_name: "PaperTrail::Version"),
    parent: Field::BelongsTo.with_options(class_name: "Activity"),
    children: Field::HasMany.with_options(class_name: "Activity"),
    ancestor_hierarchies: Field::HasMany.with_options(class_name: "ActivityHierarchy"),
    self_and_ancestors: Field::HasMany.with_options(class_name: "Activity"),
    descendant_hierarchies: Field::HasMany.with_options(class_name: "ActivityHierarchy"),
    self_and_descendants: Field::HasMany.with_options(class_name: "Activity"),
    id: Field::Number,
    verb: Field::String,
    object: Field::String.with_options(searchable: false),
    content: Field::Text,
    parent_activity_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    heading: Field::Text,
    parent_id: Field::Number,
    sort_order: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  user
  activity_topics
  topics
  replies
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  user
  activity_topics
  topics
  replies
  reactions
  event
  parent_activity
  rich_text_content
  versions
  parent
  children
  ancestor_hierarchies
  self_and_ancestors
  descendant_hierarchies
  self_and_descendants
  id
  verb
  object
  content
  parent_activity_id
  created_at
  updated_at
  heading
  parent_id
  sort_order
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  user
  activity_topics
  topics
  replies
  reactions
  event
  parent_activity
  rich_text_content
  versions
  parent
  children
  ancestor_hierarchies
  self_and_ancestors
  descendant_hierarchies
  self_and_descendants
  verb
  object
  content
  parent_activity_id
  heading
  parent_id
  sort_order
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

  # Overwrite this method to customize how activities are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(activity)
  #   "Activity ##{activity.id}"
  # end
end
