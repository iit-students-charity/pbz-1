# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_06_091327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "группы", primary_key: "КодовыйНомерГруппы", id: :string, force: :cascade do |t|
    t.string "НазваниеГруппы"
    t.integer "КоличествоЧеловек"
    t.string "Специальность"
    t.string "ФамилияСтаросты"
  end

  create_table "занятия", primary_key: ["КодовыйНомерГруппы", "КодовыйНомерПредмета", "ЛичныйНомер"], force: :cascade do |t|
    t.string "КодовыйНомерГруппы", null: false
    t.string "КодовыйНомерПредмета", null: false
    t.string "ЛичныйНомер", null: false
    t.integer "НомерАудитории"
  end

  create_table "предметы", primary_key: "КодовыйНомерПредмета", id: :string, force: :cascade do |t|
    t.string "НазваниеПредмета"
    t.integer "КоличествоЧасов"
    t.string "Специальность"
    t.integer "Семестр"
  end

  create_table "преподаватели", primary_key: "ЛичныйНомер", id: :string, force: :cascade do |t|
    t.string "Фамилия"
    t.string "Должность"
    t.string "Кафедра"
    t.string "Специальность"
    t.string "ТелефонДомашний"
  end

end
