class MakeShoutPolymorphic < ActiveRecord::Migration[7.0]
  def change
    add_reference :shouts, :content, polymorphic: true, index: true

    reversible do |dir|
      Shout.reset_column_information
      Shout.find_each do |shout|
        dir.up do
          text_shout = TextShout.create(body: shout.body)
          shout.update(content_type: 'TextShout', content_id: text_shout.id)
        end
        dir.down do
          shout.update(body: shout.content.body)
          shout.content.destroy
        end
      end
    end

    remove_column :shouts, :body, :string
  end
end
