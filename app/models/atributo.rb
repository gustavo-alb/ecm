class Atributo
  include Mongoid::Document
  include Mongoid::Enum
  field :nome, type: String
  field :tipo, type: String
  belongs_to :catalogo
  enum :tipo, [ :texto,:data,:arquivo,:telefone,:texto_grande,:cep,:cpf,:'coleção' ]
end
