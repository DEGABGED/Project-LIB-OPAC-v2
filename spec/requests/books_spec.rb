require 'rails_helper'

RSpec.describe 'Book API', type: :request do
  # Init test data
  let!(:books) { create_list(:book, 10) }
  let(:book_id) { books.first.id }

  # Test for GET all books
  describe 'GET /books' do
    # Make an http request before the testing
    before { get '/api/books' }

    it "returns a list of books" do
      expect(json).not_to be_empty
      expect(json.size).to eql(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # Test for GET single book
  describe 'GET /books/:id' do
    before { get "/api/books/#{book_id}" }

    context 'when the book exists' do
      it 'returns the book' do
      end

      it 'returns status code 200' do
      end
    end

    context 'when the record does not exist' do
      let(:book_id) { 100 }

      it 'returns status code 404' do
      end

      it 'returns a not found message' do
      end
    end
  end

  # Test for POST book (for creation)
  describe 'POST /books' do
    # valid payload
    let(:valid_attr) { {title: 'Art of War', author: 'Sun Tzu', 
                        section: "Games & Learning", batch: 1, size: 1} }
    # invalid
    let(:invalid_attr) { {title: 'asdfasdf', author: 'asd', section: "X", batch: 0} }

    context 'when the request is valid' do
      before { post '/api/books', params: valid_attr }

      it 'creates a book' do
        expect(json['title']).to eql('Art of War')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/books', params: invalid_attr }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation error message' do
        expect(response.body)
        .to match(/Validation failed: Size can't be blank/)
      end
    end
  end

  # Test for PUT /books/:id
  describe 'PUT /books/:id' do
    let(:valid_attr) { {title: 'War of Art'} }

    context 'when the record exists' do
      before { put "/api/books/#{book_id}", params: valid_attr }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Tests for borrowing and returning books
  describe "borrowing and returning books" do
    before do
      @book_i = create(:book)
      @book_o = create(:book, :on_circ)
      @book_d = create(:book, :discont)
    end
    # Test for PATCH /books/:id/borrow
    describe 'PATCH /books/:id/borrow' do
      context 'when borrowing a book in shelf' do
        before { patch "/api/books/#{book_id}/borrow" }
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end

        it 'changes the book\'s status' do
          get "/api/books/#{book_id}"
          expect(json['status']).to eql("on_circ")
        end
      end

      context 'when borrowing a book on circ' do
        before { patch "/api/books/#{@book_o.id}/borrow" }
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'doesn\'t change the book status' do
          get "/api/books/#{@book_o.id}"
          expect(json['status']).to eql("on_circ")
        end
      end

      context 'when borrowing a discontinued book' do
        before { patch "/api/books/#{@book_d.id}/borrow" }
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'doesn\'t change the book status' do
          get "/api/books/#{@book_d.id}"
          expect(json['status']).to eql("discont")
        end
      end
    end

    # Test for PATCH /books/:id/return
    describe 'PATCH /books/:id/return' do
      context 'when returning a book on circ' do
        before { patch "/api/books/#{@book_o.id}/return" }
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end

        it 'changes the book\'s status' do
          get "/api/books/#{@book_o.id}"
          expect(json['status']).to eql("in_shelf")
        end
      end

      context 'when returning a book in shelf' do
        before { patch "/api/books/#{@book_i.id}/return" }
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'doesn\'t change the book status' do
          get "/api/books/#{@book_i.id}"
          expect(json['status']).to eql("in_shelf")
        end
      end

      context 'when returning a discontinued book' do
        before { patch "/api/books/#{@book_d.id}/return" }
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'doesn\'t change the book status' do
          get "/api/books/#{@book_d.id}"
          expect(json['status']).to eql("discont")
        end
      end
    end
  end

  # Test for DELETE /books/:id
  describe 'DELETE /books/:id' do
    before { delete "/api/books/#{book_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

## LICENSE
## This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.
##
