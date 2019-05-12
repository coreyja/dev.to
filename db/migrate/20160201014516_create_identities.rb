class CreateIdentities < ActiveRecord::Migration
  def change
    create_table(:identities) do |t|

      # t.references :user, index: true
      t.integer(:user_id)
      t.string(:provider)
      t.string(:uid)
      t.timestamps(null: false)
    end
  end
end
