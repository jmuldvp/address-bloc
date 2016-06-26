require_relative '../models/address_book'

RSpec.describe AddressBook do
    let(:book) { AddressBook.new } # let helper to DRY up the code
    
    # Another method used to help DRY up code
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
    
    describe "attributes" do
        it "responds to entries" do
            # book = AddressBook.new  # see helper at the top
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            # book = AddressBook.new  # see helper at the top
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            # book = AddressBook.new  # see helper at the top
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            # book = AddressBook.new  # see helper at the top
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            # book = AddressBook.new  # see helper at the top
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    describe "#remove_entry" do
        it 'remove the correct information from entries' do
            # book = AddressBook.new  # see helper at the top
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Bat Man', '010.019.9912', 'batman@gotham.gov')
            
            expect(book.entries.size).to eq(2)
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
        end
    end
    
    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv")
            book_size = book.entries.size
            
            expect(book_size).to eq 5
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[0]
            # need to dry up the code. remarking out lines below
            # expect(entry_one.name).to eq "Bill"
            # expect(entry_one.phone_number).to eq "555-555-4854"
            # expect(entry_one.email).to eq "bill@blocmail.com"
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        end
        
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            entry_two = book.entries[1]
            # need to dry up the code. remarking out lines below
            # expect(entry_two.name).to eq "Bob"
            # expect(entry_two.phone_number).to eq "555-555-5415"
            # expect(entry_two.email).to eq "bob@blockmail.com"
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        end
        
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            entry_three = book.entries[2]
            # need to dry up the code. remarking out lines below
            # expect(entry_three.name).to eq "Joe"
            # expect(entry_three.phone_number).to eq "555-555-3660"
            # expect(entry_three.email).to eq "joe@blockmail.com"
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        end
        
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            entry_four = book.entries[3]
            # need to dry up the code. remarking out lines below
            # expect(entry_four.name).to eq "Sally"
            # expect(entry_four.phone_number).to eq "555-555-4646"
            # expect(entry_four.email).to eq "sally@blocmail.com"
            check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
        end
        
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            entry_five = book.entries[4]
            # need to dry up the code. remarking out lines below
            # expect(entry_five.name).to eq "Sussie"
            # expect(entry_five.phone_number).to eq "555-555-2036"
            # expect(entry_five.email).to eq "sussie@blockmail.com"
            check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
    end
end