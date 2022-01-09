import 'dart:io';

import 'package:flutter_codigo4_sqflite_1/models/book.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? _myDatabase;
  static final DBAdmin db = DBAdmin._();

  DBAdmin._();

  // verificar la BD
  Future<Database?> getDatabase() async {
    if (_myDatabase != null) return _myDatabase;
    _myDatabase = await initDB();
    return _myDatabase;
  }

  // verificar donde se instaló el App e instalamos la BD
  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "BookDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, description TEXT, image TEXT, favourite TEXT)");
        });
  }

  //Listar Libros
  Future<List> getBooksRaw() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res = await db!.rawQuery("SELECT * FROM BOOK");
    print(res);
    return res;
  }

  Future<List<Book>> getBooks() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res = await db!.query("BOOK");
    List<Book> books = res.map<Book>((item) => Book.fromJson(item)).toList();
    print(books);
    return books;
  }

  //Insertar

  Future<int> insertBookRaw(Book book) async {
    final db = await getDatabase();
    int res =  await db!.rawInsert(
        "INSERT INTO BOOK(title, author, description, image, favourite) VALUES ('${book.title}','${book.author}', '${book.description}','${book.image}','${book.favourite}')");
    return res;
  }

  Future<int> insertBook(Book book) async {
    final db = await getDatabase();
    int res = await db!.insert(
      "BOOK",
      book.toJson(),
    );
    return res;
  }

  // Eliminar
  Future<int>deleteBookRaw(int id) async {
    final db = await getDatabase();
    int res = await db!.rawDelete("DELETE FORM BOOK WHERE id = $id");
    return res;
  }

  Future<int>deleteBook(int id) async {
    final db = await getDatabase();
    int res = await db!.delete("BOOK", where: "id = $id");
    return res;
  }

  // Actualizar
  Future<int> updateBookRaw(int id) async {
    final db = await getDatabase();
    int res = await db!.rawUpdate("UPDATE BOOK SET title = 'asdasd', author = 'DFSDF' WHERE id = $id");
    return res;
  }

  Future<int>updateBook(Book book) async {
    final db = await getDatabase();
    int res = await db!.update("BOOK", book.toJson(), where: "id = ${book.id}");
    return res;
  }

  Future<List<Book>> getBooksFavourites() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> res = await db!.query("BOOK", where: "favourite = 'true'");
    List<Book> books = res.map<Book>((item) => Book.fromJson(item)).toList();
    return books;
  }

}