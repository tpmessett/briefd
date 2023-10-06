class AddFieldsToBrief < ActiveRecord::Migration[7.0] # or your specific Rails version
  def change
    add_column :briefs, :client_score, :integer, limit: 2
    add_column :briefs, :company_score, :integer, limit: 2
    add_column :briefs, :brief_score, :integer, limit: 2
    add_column :briefs, :total_score, :integer, limit: 2
    add_column :briefs, :client_notes, :text
    add_column :briefs, :company_notes, :text
    add_column :briefs, :brief_notes, :text

    # Add database constraints to ensure scores are between 0 and 100
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE briefs
          ADD CONSTRAINT check_client_score
          CHECK (client_score BETWEEN 0 AND 100);
        SQL

        execute <<-SQL
          ALTER TABLE briefs
          ADD CONSTRAINT check_company_score
          CHECK (company_score BETWEEN 0 AND 100);
        SQL

        execute <<-SQL
          ALTER TABLE briefs
          ADD CONSTRAINT check_brief_score
          CHECK (brief_score BETWEEN 0 AND 100);
        SQL

        execute <<-SQL
          ALTER TABLE briefs
          ADD CONSTRAINT check_total_score
          CHECK (total_score BETWEEN 0 AND 100);
        SQL
      end

      dir.down do
        execute <<-SQL
          ALTER TABLE briefs
          DROP CONSTRAINT check_client_score;
        SQL

        execute <<-SQL
          ALTER TABLE briefs
          DROP CONSTRAINT check_company_score;
        SQL

        execute <<-SQL
          ALTER TABLE briefs
          DROP CONSTRAINT check_brief_score;
        SQL

        execute <<-SQL
          ALTER TABLE briefs
          DROP CONSTRAINT check_total_score;
        SQL
      end
    end
  end
end
