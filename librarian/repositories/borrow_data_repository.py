class borrow_data_repository:
    def __init__(self):
        self.borrow_data_list = []


    def create(self, borrow_data):
        self.borrow_data_list.append(borrow_data)


    def get(self, nim, isbn):
        for data in self.borrow_data_list:
            if data.nim == nim and data.isbn == isbn:
                return data

        return None


    def list_by_mhs_nim(self, nim):
        return [x for x in self.borrow_data_list if x.nim == nim]


    def list_by_book_isbn(self, isbn):
        return [x for x in self.borrow_data_list if x.isbn == isbn]


    def list_non_returned(self):
        return [
            x for x in self.borrow_data_list
            if not x.is_returned
        ]


    def set_return_date(self, nim, isbn, date):
        data = self.get(nim, isbn)
        data.is_returned = True
        data.return_date = date


    def delete_by_nim(self, nim):
        self.borrow_data_list = [
            x for x in self.borrow_data_list
            if x.nim != nim
        ]


    def delete_by_isbn(self, isbn):
        self.borrow_data_list = [
            x for x in self.borrow_data_list
            if x.isbn != isbn
        ]