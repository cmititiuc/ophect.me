class AddNewProperties < ActiveRecord::Migration
  def up
    properties.each { |k, v| Property.create(:key => k, :value => v) }
  end

  def down
    properties.each { |k, _| Property.find_by_key(k).try(:delete) }
  end

  private

  def properties
    { 'HeaderLeft' => "#{prop('HeaderName')}\r\n#{prop('HeaderSubtitle')}",
      'HeaderRight' => "#{prop('HeaderEmail')}\r\n#{prop('HeaderGitHubAccountName')}"
    }
  end

  def prop(k)
    Property.find_by_key(k).value
  end
end
