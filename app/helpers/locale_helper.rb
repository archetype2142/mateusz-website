module LocaleHelper
  # Strips the locale prefix from a path
  def self.strip_locale_prefix(path, locale)
    path.sub(/^#{locale}\//, '')
  end
end
