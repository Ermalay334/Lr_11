class ChangeDataTypeForDecomp < ActiveRecord::Migration[6.1]
  def change
    change_column(:armsts, :decomp, :text)
  end
end
