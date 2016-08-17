class AddNewProperties < ActiveRecord::Migration
  DEPRECATED_PROPERTY_KEYS = %w(
    HeaderName
    HeaderEmail
    HeaderSubtitle
    HeaderGitHubAccountName
  )
  NEW_PROPERTY_KEYS = %w(HeaderLeft HeaderRight)

  def up
    return unless properties_all_present?
    new_properties.each { |k, v| Property.create(:key => k, :value => v) }
  end

  def down
    NEW_PROPERTY_KEYS.each { |k| Property.find_by_key(k).try(:delete) }
  end

  private

  def properties_all_present?
    DEPRECATED_PROPERTY_KEYS.all? { |k| Property.find_by_key(k) }
  end

  def new_properties
    { 'HeaderLeft' => "#{prop('HeaderName')}\r\n#{prop('HeaderSubtitle')}",
      'HeaderRight' => "#{prop('HeaderEmail')}\r\n#{prop('HeaderGitHubAccountName')}"
    }
  end

  def prop(k)
    Property.find_by_key(k).value
  end
end
