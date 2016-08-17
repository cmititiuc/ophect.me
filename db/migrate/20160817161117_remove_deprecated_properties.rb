class RemoveDeprecatedProperties < ActiveRecord::Migration
  DEPRECATED_PROPERTIES = {
    'HeaderName' => 'h1. HeaderName',
    'HeaderEmail' => 'h2. "HeaderEmail":mailto:HeaderEmail',
    'HeaderGitHubAccountName' => 'h2. "Github":https://github.com/HeaderGitHubAccountName',
    'HeaderSubtitle' => 'h2. HeaderSubtitle'
  }

  def up
    DEPRECATED_PROPERTIES.each { |k, _| Property.find_by_key(k).try(:delete) }
  end

  def down
    DEPRECATED_PROPERTIES.each { |k, v| Property.create(key: k, value: v) }
  end
end
