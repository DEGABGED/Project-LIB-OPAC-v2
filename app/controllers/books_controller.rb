class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy, :borrow, :return]

  # GET /books
  # GET /books.json
  def index
    @books = Book.search(params[:search_key], params[:term])
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @type = "Create"
  end

  # GET /books/1/edit
  def edit
    @type = "Edit"
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user = current_user

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors.messages, status: :unprocessable_entity }
        format.js   { render json: @book.errors.messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book.user = current_user
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_path, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.js   { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    respond_to do |format|
      if @book.destroy
        format.html { redirect_to root_url }
        format.json { head :no_content }
      else
        format.html { redirect_to books_url, notice: 'Cannot delete book.' }
        format.json { render json: @book.errors.messages, status: :unprocessable_entity }
        format.js   { render json: @book.errors.messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /books/:id/borrow
  def borrow
    respond_to do |format|
      if @book.borrow_book && @book.save!
        format.html { redirect_to books_path, notice: 'Book was successfully borrowed.' }
      else
        format.html { render :edit }
        format.js   { render json: @book.errors.messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /books/:id/return
  def return
    respond_to do |format|
      if @book.return_book && @book.save!
        format.html { redirect_to books_path, notice: 'Book was successfully returned.' }
      else
        format.html { render :edit }
        format.js   { render json: @book.errors.messages, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :section, :batch, :size, :callnr, :time_in, :time_out, :status, :term, :search_key, :circ)
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
