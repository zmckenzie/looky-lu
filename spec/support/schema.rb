ActiveRecord::Schema.define do
  self.verbose = false

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table 'no_models', :force => true do |t|
    t.datetime "created_at", null: false
  end

end