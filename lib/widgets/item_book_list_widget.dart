import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemBookListWidget extends StatelessWidget {

  String title;
  String author;
  String description;
  String image;

  ItemBookListWidget({
    required this.title,
    required this.author,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      height: 90,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.comfortaa(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    author,
                    style: GoogleFonts.comfortaa(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  Text(
                    description,
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
            onPressed: () {},
          ),
          IconButton(
            icon:
            SvgPicture.asset('assets/icons/trash.svg', color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}