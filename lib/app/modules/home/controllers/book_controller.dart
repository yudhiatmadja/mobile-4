import 'package:get/get.dart';

class BookController extends GetxController {
  var title = ''.obs;
  var author = ''.obs;
  var image = ''.obs;
  var books = [
    {
      'title': 'Before The Coffee Gets Cold',
      'author': 'Toshikazu Kawaguchi',
      'image': 'assets/novel1.jpg',
    },
    {
      'title': 'Jejak Cinta Yang Tersembunyi',
      'author': 'Claudia Alves',
      'image': 'assets/novel2.jpg',
    },
    {
      'title': 'The Night Circus',
      'author': 'Erin Morgenstern',
      'image': 'assets/novel3.jpg',
    },
  ].obs;

  var selectedBook = {}.obs;

  void selectBook(Map<String, String> book) {
    selectedBook.value = book;
  }
  void setBookDetails(String newTitle, String newAuthor, String newImage) {
    title.value = newTitle;
    author.value = newAuthor;
    image.value = newImage;
  }
}
