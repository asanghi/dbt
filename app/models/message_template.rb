class MessageTemplate < ActiveRecord::Base
  belongs_to :company
  attr_accessible :formats, :handlers, :locale, :name, :partial, :prefix, :source
  validates :source, :name, :prefix, :presence => true
end
