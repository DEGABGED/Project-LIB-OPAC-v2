class Book < ApplicationRecord
  SECTIONS = ["-Uncategorized",
              "Arts and Crafts",
              "Bible Stories",
              "Cartoons",
              "Disney",
              "Enigma",
              "Fairy Tales & Fantasy",
              "Games & Learning",
              "H",
              "I",
              "Jobs",
              "Kaibigan",
              "Literary Classics",
              "Music & Rhymes",
              "Numbers",
              "Ohana",
              "Pagkain",
              "Q",
              "Reading & Language",
              "Science & Trivia",
              "Travel",
              "U",
              "Values and Morals",
              "W",
              "X",
              "Young Adult",
              "Zoo"]

  SIZES = ["Small",
           "Medium",
           "Large"]

  STATUSES = [:in_shelf,
              :on_circ,
              :discont]

  enum status: [:in_shelf, :on_circ, :discont]
  before_create :set_defaults
  before_destroy :before_destroy
  validates :title, :author, :section, :batch, :size, presence: :true
  validates :section, inclusion: {
    in: SECTIONS,
    message: "is invalid"
  }
  validates :size, inclusion: {
    in: SIZES,
    message: "is invalid"
  }

  def borrow_book
    if self.in_shelf?
      self.status = :on_circ
      self.time_out = Time.now()
      return true
    else
      return false
    end
  end

  def return_book
    if self.on_circ?
      self.status = :in_shelf
      self.time_in = Time.now()
      return true
    else
      return false
    end
  end

  def bookcode
    "#{self.section[0]}#{self.batch} #{self.callnr} #{self.size[0]}"
  end

  private
  def set_defaults
    self.status ||= :in_shelf
    self.callnr ||= self.id
    self.time_out = Time.now()
    self.time_in = Time.now()
  end

  def before_destroy
    return true if self.status != :on_circ and self.status != 'on_circ'
    errors.add :base, "Cannot delete book currently being borrowed."
    throw(:abort)
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
