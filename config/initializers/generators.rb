Rails.application.config.generators do |generator|
  # Change the primary default type
  generator.orm :active_record, primary_key_type: :uuid
end
