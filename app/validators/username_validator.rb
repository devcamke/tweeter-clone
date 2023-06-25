class usernameValidator < ActiveModel::EachValidator
  USERNAME_REGEXP = /\A[a-z0-9_-]{4,20}\z/

  def validate_each(record, attribute, value)
    unless value = USERNAME_REGEXP
      error_msg = options.fetch(:message){"Must be alphanumeric and only include '-' or '_' characters"}
      record.errors[attribute] << error_msg
    end
  end
end
