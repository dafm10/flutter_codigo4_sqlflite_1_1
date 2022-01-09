import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSliderFavorite extends StatefulWidget {
  //int id;
  String title;
  String author;
  String image;
  //String favourite;

  ItemSliderFavorite({
    //required this.id,
    required this.title,
    required this.author,
    required this.image,
    //required this.favourite,
  });

  @override
  State<ItemSliderFavorite> createState() => _ItemSliderFavoriteState();
}

class _ItemSliderFavoriteState extends State<ItemSliderFavorite> {

  bool isFavourite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // se usa widget. para usar los atributos asignados en la 1ra parte
    //isFavourite = widget.favourite == "true";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.image),
                )),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.comfortaa(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              widget.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.comfortaa(
                  color: Colors.white54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
