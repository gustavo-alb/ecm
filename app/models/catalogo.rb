class Catalogo
  include Mongoid::Document
  field :nome, type: String
  belongs_to :tipo_catalogo
  belongs_to :user
  has_many :atributos,dependent: :destroy
  accepts_nested_attributes_for :atributos,:allow_destroy => true
end
