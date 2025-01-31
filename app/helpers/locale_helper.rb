module LocaleHelper
  # Strips any locale prefix from a path
  def self.strip_locale_prefix(path, _locale = nil)
    return '' if path == '/' || path.blank?
    
    # Remove leading and trailing slashes first
    clean_path = path.gsub(/^\/|\/$/, '')
    
    # Remove any locale prefix (not just the current one)
    clean_path = clean_path.sub(/^(#{I18n.available_locales.join('|')})\//, '')
    
    # Return the clean path
    clean_path
  end
end
