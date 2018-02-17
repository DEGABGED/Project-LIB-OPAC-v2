require 'rails_helper'

RSpec.describe Book, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @book = create :book
    @book2 = create :book, :discont
    @book3 = create :book, :on_circ
  end

  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:section) }
  it { should validate_presence_of(:batch) }
  it { should validate_presence_of(:size) }

  context "when creating" do
    it "is in shelf by default" do
      assert @book.in_shelf?
    end
  end

  context "when borrowing" do
    it "can borrow a book in shelf" do
      @book.borrow_book()
      assert @book.on_circ?
    end

    it "can't borrow a book not in shelf" do
      expect(@book2.borrow_book()).to eql(false)
      assert @book2.discont?
      expect(@book3.borrow_book()).to eql(false)
      assert @book3.on_circ?
    end
  end

  context "when returning" do
    it "can return a book on circ" do
      assert @book3.return_book()
      assert @book3.in_shelf?
    end

    it "can't return a book not on circ" do
      expect(@book2.return_book()).to eql(false)
      assert @book2.discont?
      expect(@book.return_book()).to eql(false)
      assert @book.in_shelf?
    end
  end
end

## LICENSE
## This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.
##
