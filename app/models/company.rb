class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :message_templates, dependent: :destroy

  def resolver
    @resolver ||= MessageTemplateResolver.new(self)
  end

end
