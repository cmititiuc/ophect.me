class AddNewProperties < ActiveRecord::Migration
  DEPRECATED_PROPERTY_KEYS = %w(
    HeaderName
    HeaderEmail
    HeaderSubtitle
    HeaderGitHubAccountName
  )
  NEW_PROPERTY_KEYS = %w(HeaderLeft HeaderRight)

  def up
    return unless deprecated_props_present?

    { 'HeaderLeft' => "#{prop('HeaderName')}\r\n\r\n#{prop('HeaderSubtitle')}",
      'HeaderRight' => "#{prop('HeaderEmail')}\r\n\r\n#{prop('HeaderGitHubAccountName')}"
    }.each { |k, v| Property.create(:key => k, :value => v) }
  end

  def down
    NEW_PROPERTY_KEYS.each { |k| Property.find_by_key(k).try(:delete) }
  end

  private

  def deprecated_props_present?
    DEPRECATED_PROPERTY_KEYS.all? { |k| Property.find_by_key(k) }
  end

  def prop(k)
    Property.find_by_key(k).value
  end
end
