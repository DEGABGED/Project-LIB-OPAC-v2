module Api
  class BooksController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }

    before_action :set_book, only: [:show, :update, :destroy, :borrow, :return]

    def index
      @books = Book.all
      json_response(@books)
    end

    def create
      @book = Book.create!(book_params)
      json_response(@book, :created)
    end

    def show
      json_response(@book)
    end

    def update
      @book.update(book_params)
      head :no_content
    end

    def destroy
      @book.destroy
      head :no_content
    end

    def borrow
      if @book.borrow_book && @book.save
        head :no_content
      else
        json_response({ message: "Book is #{@book.status} and can't be borrowed" },
                      :unprocessable_entity)
      end
    end

    def return
      if @book.return_book && @book.save
        head :no_content
      else
        json_response({ message: "Book is #{@book.status} and can't be returned" },
                      :unprocessable_entity)
      end
    end

    private

    def book_params
      params.permit(:title, :author, :section, :batch, :size, :callnr, :status)
    end

    def set_book
      @book = Book.find(params[:id])
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
