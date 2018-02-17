class Book < ApplicationRecord
  enum status: [:in_shelf, :on_circ, :discont]
  before_create :set_defaults
  validates :title, :author, :section, :batch, :size, presence: :true

  SECTIONS = ["Uncategorized",
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

  private
  def set_defaults
    self.status ||= :in_shelf
    self.callnr ||= Book.all.size + 1
    self.time_out = Time.now()
    self.time_in = Time.now()
  end
end
