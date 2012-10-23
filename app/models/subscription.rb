class Subscription
  include Mongoid::Document

  field :nome,      type: String
  field :cargo,     type: String
  field :cpf,       type: String
  field :empresa,   type: String
  field :endereco,  type: String
  field :email,     type: String
  field :telefone,  type: String
  field :skype,     type: String
  field :twitter,   type: String
  field :facebook,  type: String

  validates_presence_of :nome, :cpf, :empresa, :endereco, :email, :telefone
  validates_uniqueness_of :cpf, :email

  def self.available?
    Subscription.count < 250
  end
end
