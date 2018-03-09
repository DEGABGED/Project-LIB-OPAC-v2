class ChangeSizeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :size, :string
  end
end

# Author: Francis Zac dela Cruz
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.

# Code History:
# Francis Zac dela Cruz
# 03/09/18
# Sprint 3

# Comments
# 03/09/18
# Group 3
# Recoletas Chapel
#
##
