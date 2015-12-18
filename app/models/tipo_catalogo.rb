class TipoCatalogo
  include Mongoid::Document
  field :nome, type: String
  field :ativo, type: Mongoid::Boolean
end
