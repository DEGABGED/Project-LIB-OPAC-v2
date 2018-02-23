class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :section
      t.integer :batch
      t.integer :size
      t.integer :callnr
      t.datetime :time_in
      t.datetime :time_out
      t.integer :status

      t.timestamps
    end
  end
end

# Author: Francis Zac dela Cruz
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.

# Code History:
# Francis Zac dela Cruz
# 02/23/18
# Sprint 2

# Comments
# 02/23/18
# Group 3
# Recoletas Chapel
#
##
