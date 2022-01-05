import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_sqflite_1/db/db_admin.dart';
import 'package:flutter_codigo4_sqflite_1/models/book.dart';
import 'package:flutter_codigo4_sqflite_1/widgets/input_textfield_widget.dart';
import 'package:flutter_codigo4_sqflite_1/widgets/item_book_list_widget.dart';
import 'package:flutter_codigo4_sqflite_1/widgets/item_slider_favorite.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  showAddBookForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          //insetPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          backgroundColor: Color(0xff14213d),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          content: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Agregar Libro",
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  InputTextFieldWidget(
                    controller: _titleController,
                    icon: "title",
                    hintText: "Titulo",
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  InputTextFieldWidget(
                    controller: _authorController,
                    icon: "author",
                    hintText: "Autor",
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  InputTextFieldWidget(
                    controller: _descriptionController,
                    icon: "description",
                    hintText: "Descripción",
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  InputTextFieldWidget(
                    controller: _imageController,
                    icon: "image",
                    hintText: "Imagen",
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      "Cancelar",
                      style: GoogleFonts.comfortaa(
                        color: Colors.white70,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xfff72585),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {

                      Book book = Book(
                        title: _titleController.text,
                        author: _authorController.text,
                        description: _descriptionController.text,
                        image: _imageController.text,
                        favourite: "false",
                      );

                      DBAdmin.db.insertBook(book).then((value){
                        setState(() {

                        });
                        _titleController.clear();
                        _authorController.clear();
                        _descriptionController.clear();
                        _imageController.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      "Agregar",
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff72585),
        onPressed: () {
          /*//DBAdmin.db.getBooks();
          Book myBook = Book(
            title: "1984",
            author: "George Orwell",
            description:
            "1984 (en su versión original en inglés: Nineteen Eighty-Four) es una novela política de ficción distópica, escrita por George Orwell entre 1947 y 1948 y publicada el 8 de junio de 1949.",
            image:
            "https://images.cdn1.buscalibre.com/fit-in/360x360/10/42/10426f9e9ae4f7cd9eb5d33cef5aa143.jpg",
            favourite: "false",
          );
          // DBAdmin.db.insertBookRaw(myBook);
          DBAdmin.db.insertBook(myBook);
          DBAdmin.db.getBooks();
          DBAdmin.db.getBooksRaw();*/
          showAddBookForm();
        },
        child: Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Color(0XFF161b33),
              Color(0XFF161b33),
            ])),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Buenos días",
                      style: GoogleFonts.comfortaa(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Mis Libros",
                      style: GoogleFonts.comfortaa(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Mis favoritos",
                      style: GoogleFonts.comfortaa(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          ItemSliderFavorite(),
                          ItemSliderFavorite(),
                          ItemSliderFavorite(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "General",
                      style: GoogleFonts.comfortaa(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                    FutureBuilder(
                      future: DBAdmin.db.getBooks(),
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        if (snap.hasData) {
                          List<Book> books = snap.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: books.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ItemBookListWidget(
                                  title: books[index].title,
                                  author: books[index].author,
                                  description: books[index].description,
                                  image: books[index].image
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
