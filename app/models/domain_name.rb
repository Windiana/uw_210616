class DomainName < ActiveRecord::Base
  
  validates :url, :presence => true, :url => true

  def validate_each(record, attribute, value)
    return if value.blank?
    begin
      uri = URI.parse(value)
      domain = uri.host
    rescue URI::InvalidURIError
      domain = ""
    end
    unless domain.present?
      record.errors[attribute] << (options[:message] || "is not an url")
    end
  end
end

value = "http://mail.stackoverflow.com/questions/6674230/how-would-you-parse-a-url-in-ruby-to-get-the-main-domain"
uri = URI.parse(value)