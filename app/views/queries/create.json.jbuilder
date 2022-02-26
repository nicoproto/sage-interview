if @query.persisted?
  raise
  json.id @query.id
  json.value @query.facts
else
  json.value "Something went wrong"
end