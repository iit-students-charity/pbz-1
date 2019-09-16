class AddData < ActiveRecord::Migration[5.2]
  def up
    create_table 'преподаватели', id: :string, primary_key: 'ЛичныйНомер' do |t|
      t.string 'Фамилия'
      t.string 'Должность'
      t.string 'Кафедра'
      t.string 'Специальность'
      t.string 'ТелефонДомашний'
    end

    create_table 'предметы', id: :string, primary_key: 'КодовыйНомерПредмета' do |t|
      t.string 'НазваниеПредмета'
      t.integer 'КоличествоЧасов'
      t.string  'Специальность'
      t.integer 'Семестр'
    end

    create_table 'группы', id: :string, primary_key: 'КодовыйНомерГруппы' do |t|
      t.string 'НазваниеГруппы'
      t.integer 'КоличествоЧеловек'
      t.string 'Специальность'
      t.string 'ФамилияСтаросты'
    end

    create_table 'занятия', primary_key: %w[КодовыйНомерГруппы КодовыйНомерПредмета ЛичныйНомер] do |t|
      t.string 'КодовыйНомерГруппы', references: %w[группы КодовыйНомерГруппы]
      t.string 'КодовыйНомерПредмета', references: %w[предметы КодовыйНомерПредмета]
      t.string 'ЛичныйНомер', references: %w[преподаватели ЛичныйНомер]
      t.integer 'НомерАудитории'
    end
  end

  def down
    drop_table 'преподаватели'
    drop_table 'предметы'
    drop_table 'группы'
    drop_table 'занятия'
  end
end
