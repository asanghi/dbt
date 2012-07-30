class MessageTemplateResolver < ActionView::Resolver

  attr_accessor :message_template, :company

  def initialize(company)
    @company = company
    super()
  end

  def find_templates(name, prefix, partial, details)
    # name = "action"
    # prefix = "controller"
    # partial => "true/false"
    # details => {:format => "html"/"text", :handlers => [:erb, :haml, ...], :locale => "en"}
    search_args = details.merge({ :name => name, :prefix => prefix, :partial => partial, :company_id => company.id })
    MessageTemplate.where(search_args).all.map do |message_template|
      ActionView::Template.new(*template_args(message_template))
    end
  end

  def template_args(message_template)
    args = [message_template.source]
    args << "view_template-#{message_template.id}-#{message_template.prefix}-#{message_template.name}"
    args << ::ActionView::Template.registered_template_handler(message_template.handlers)
    args << { :format => Mime[message_template.formats], :virtual_path => virtual_path(message_template) }
  end

  def virtual_path(message_template)
    virtual = "#{message_template.prefix.to_s}/"
    virtual << "_" if message_template.partial
    virtual << message_template.name.to_s
  end
end