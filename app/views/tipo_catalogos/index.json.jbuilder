json.array!(@tipo_catalogos) do |tipo_catalogo|
  json.extract! tipo_catalogo, :id, :nome, :ativo
  json.url tipo_catalogo_url(tipo_catalogo, format: :json)
end
