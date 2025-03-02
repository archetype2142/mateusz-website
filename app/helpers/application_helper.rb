module ApplicationHelper
  def articles
    @articles ||= Spina::Resource.find_by(name: "articles").pages.live
  end

  def nav_items
    @nav_items ||= Spina::Navigation.find_by(name: "main").navigation_items.roots.sorted
  end

  def tags
    @tags ||= Spina::Current.page.content(:tags).to_s.split(";").map(&:strip).compact
  end
  def blogposts
    Spina::Page.live.where(resource: Spina::Resource.find_by(name: "blogposts")).order(created_at: :desc)
  end

  def recommended_blogposts
    blogposts.limit(5).offset(1) # Skip the first (most recent) post
  end

  def reading_time(content)
    words_per_minute = 200
    words = content.to_s.split.size
    (words / words_per_minute.to_f).ceil
  end
end
