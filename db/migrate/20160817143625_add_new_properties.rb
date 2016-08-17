class AddNewProperties < ActiveRecord::Migration
  PROPERTIES = {
    'HeaderLeft' => "#{prop('HeaderName')}\r\n#{prop('HeaderSubtitle')}",
    'HeaderRight' => "#{prop('HeaderEmail')}\r\n#{prop('HeaderGitHubAccountName')}"
  }

  def up
    PROPERTIES.each { |k, v| Property.create(:key => k, :value => v) }
  end

  def down
    PROPERTIES.each { |k, _| Property.find_by_key(k).try(:delete) }
  end

  private

  def prop(k)
    Property.find_by_key(k).value
  end
end
