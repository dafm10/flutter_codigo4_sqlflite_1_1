import 'package:flutter/material.dart';
import 'package:flutter_codigo4_sqflite_1/db/db_admin.dart';
import 'package:flutter_codigo4_sqflite_1/models/book.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemBookListWidget extends StatefulWidget {
  int id;
  String title;
  String author;
  String description;
  String image;
  String favourite;
  Function function;
  Function onDeleted;
  Function onUpdate;

  ItemBookListWidget({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    required this.favourite,
    required this.onDeleted,
    required this.onUpdate,
    required this.function,
  });

  @override
  State<ItemBookListWidget> createState() => _ItemBookListWidgetState();
}

class _ItemBookListWidgetState extends State<ItemBookListWidget> {

  bool isFavourite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // se usa widget. para usar los atributos asignados en la 1ra parte
    isFavourite = widget.favourite == "true";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      height: 90,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.image),
              ),
            ),
            /*child: IconButton(
              icon: Container(
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  color: isFavourite
                      ? Color(0xfff72585)
                      : Colors.white.withOpacity(0.8),
                  width: 36,
                ),
              ),
              onPressed: () {
                isFavourite = !isFavourite;
                Book book = Book(
                  id: widget.id,
                  title: widget.title,
                  author: widget.author,
                  description: widget.description,
                  image: widget.image,
                  favourite: isFavourite.toString(),
                );
                DBAdmin.db.updateBook(book);
                setState(() {});
              },
            ),*/
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.comfortaa(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.author,
                    style: GoogleFonts.comfortaa(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  Text(
                    widget.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: GoogleFonts.comfortaa(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/edit.svg',
              color: Colors.white,
            ),
            onPressed: () {
              widget.onUpdate();
            },
          ),
          IconButton(
            icon:
                SvgPicture.asset('assets/icons/trash.svg', color: Colors.white),
            onPressed: () {
              widget.onDeleted();
            },
          ),
          IconButton(
            icon: Container(
              child: SvgPicture.asset(
                "assets/icons/heart.svg",
                color: isFavourite
                    ? Color(0xfff72585)
                    : Colors.white.withOpacity(0.8),
                width: 36,
              ),
            ),
            onPressed: () {
              widget.function();
              isFavourite = !isFavourite;
              Book book = Book(
                id: widget.id,
                title: widget.title,
                author: widget.author,
                description: widget.description,
                image: widget.image,
                favourite: isFavourite.toString(),
              );
              DBAdmin.db.updateBook(book);
              setState(() {
                DBAdmin.db.getBooksFavourites();
              });
            },
          ),
        ],
      ),
    );
  }
}
