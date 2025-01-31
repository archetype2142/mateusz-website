Mobility.configure do
  plugins do
    backend :key_value
    active_record
    reader
    writer
    backend_reader
    query
    cache
    presence
    fallbacks true
    locale_accessors
    default
  end
end
