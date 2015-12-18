json.array!(@catalogos) do |catalogo|
  json.extract! catalogo, :id, :nome, :tipo_id, :usuario_id
  json.url catalogo_url(catalogo, format: :json)
end
