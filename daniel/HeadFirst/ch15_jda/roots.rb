require 'yaml/store'

store = YAML::Store.new('empty_store.yml')
store.transaction do
  highest_id = store.roots.max || 0
  p highest_id + 1
end