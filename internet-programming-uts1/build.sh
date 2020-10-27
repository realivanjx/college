echo Preparing
mkdir bin
mkdir bin/WEB-INF
mkdir bin/WEB-INF/classes
mkdir bin/WEB-INF/lib

echo Compiling
javac \
  -classpath "./lib" \
  -d bin/WEB-INF/classes \
  src/logic/models/BookCategory.java \
  src/logic/models/Book.java \
  src/logic/models/Customer.java \
  src/logic/models/Order.java \
  src/logic/repositories/DB.java \
  src/logic/repositories/IBookCategoryRepository.java \
  src/logic/repositories/BookCategoryRepository.java \
  src/logic/repositories/IBookRepository.java \
  src/logic/repositories/BookRepository.java \
  src/logic/repositories/ICustomerRepository.java \
  src/logic/repositories/CustomerRepository.java \
  src/logic/repositories/IOrderRepository.java \
  src/logic/repositories/OrderRepository.java \
  src/logic/services/BookCategoryService.java \
  src/logic/services/BookService.java \
  src/logic/services/CustomerService.java
  
cp -R src/* bin
find ./bin -type f -name '*.java' -exec rm {} +
rm -rf bin/logic

echo Copying lib
cp -R lib/* bin/WEB-INF/lib

echo Packaging
cd bin
jar cvf build.war .
mv build.war ../internet-programming-uts1.war
cd ..
rm -rf bin