# Theme configuration file
# ========================
# This file is used for all theme configuration.
# It's where you define everything that's editable in Spina CMS.

Spina::Theme.register do |theme|
  # All views are namespaced based on the theme's name
  theme.name = "default"
  theme.title = "Ritwick's theme :)"

  # Parts
  # Define all editable parts you want to use in your view templates
  #
  # Built-in part types:
  # - Line
  # - MultiLine
  # - Text (Rich text editor)
  # - Image
  # - ImageCollection
  # - Attachment
  # - Option
  # - Repeater
  theme.parts = [
    { name: "youtube_iframe", title: "Youtube link", part_type: "Spina::Parts::Line"},
    { name: "repeater", title: "Events", part_type: "Spina::Parts::Repeater", item_name: "item", parts: %w[date_place headline body youtube_iframe] },
    { name: "line", title: "Line", part_type: "Spina::Parts::Line" },
    { name: "body", title: "Body", hint: "Your content", part_type: "Spina::Parts::Text" },
    { name: "image_collection", title: "Image collection", part_type: "Spina::Parts::ImageCollection" },
    { name: "image", title: "Image", part_type: "Spina::Parts::Image" },
    { name: "headline", title: "Headline", hint: "Used in the header", part_type: "Spina::Parts::Line" },
    { name: "subtitle", title: "Subtitle", part_type: "Spina::Parts::Line" },
    { name: "pill", title: "Pill", hint: "That text on top greeny", part_type: "Spina::Parts::Line" },
    { name: "footer", title: "Footer", part_type: "Spina::Parts::Text" },
    { name: "date_place", title: "Date and place", part_type: "Spina::Parts::Line" },
    { name: "name", title: "name", part_type: "Spina::Parts::Line" },
    { name: "company_position", title: "company_position", part_type: "Spina::Parts::Line" },
    { name: "featured_projects", title: "Featured Projects", part_type: "Spina::Parts::Repeater", item_name: "item", parts: %w[headline image body date_place link] },
    { name: "reviews", title: "Reviews", part_type: "Spina::Parts::Repeater", item_name: "item", parts: %w[body name company_position] },
    { name: "link", title: "Link", part_type: "Spina::Parts::Line" },
    { name: "categories", title: "Categories", part_type: "Spina::Parts::Repeater", item_name: "item", parts: %w[name] }
  ]

  # View templates
  # Every page has a view template stored in app/views/my_theme/pages/*
  # You define which parts you want to enable for every view template
  # by referencing them from the theme.parts configuration above.
  theme.view_templates = [
    { name: "homepage", title: "Homepage", parts: %w[headline subtitle pill body image_collection featured_projects reviews] },
    { name: "show", title: "Default", parts: %w[body image repeater] },
    { name: "blog", title: "Blog", parts: %w[body image_collection image categories] },
  ]

  # Custom pages
  # Some pages should not be created by the user, but generated automatically.
  # By naming them you can reference them in your code.
  theme.custom_pages = [
    { name: "homepage", title: "Homepage", deletable: false, view_template: "homepage" },
    { name: "blog", title: "Blog", deletable: false, view_template: "blog" }
  ]

  # Navigations (optional)
  # If your project has multiple navigations, it can be useful to configure multiple
  # navigations.
  theme.navigations = [
    { name: "main", label: "Main navigation" }
  ]

  # Layout parts (optional)
  # You can create global content that doesn't belong to one specific page. We call these layout parts.
  # You only have to reference the name of the parts you want to have here.
  theme.layout_parts = []

  # Resources (optional)
  # Think of resources as a collection of pages. They are managed separately in Spina
  # allowing you to separate these pages from the 'main' collection of pages.
  theme.resources = [
    { name: "blogposts", label: "Blogs", view_template: "blog", slug: "blogs" }
  ]

  # Plugins (optional)
  theme.plugins = [ "reviews" ]

  # Embeds (optional)
  theme.embeds = []
end
