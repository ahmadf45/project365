import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/services.dart';

class Day1 extends StatefulWidget {
  @override
  _Day1State createState() => _Day1State();
}

class Gambar {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;

  Gambar(this.id, this.author, this.width, this.height, this.url);
}

class _Day1State extends State<Day1> {
  List<Gambar> items = new List<Gambar>();

  _Day1State() {
    items.add(new Gambar("image001", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image001/500/500"));
    items.add(new Gambar("image002", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image002/500/800"));
    items.add(new Gambar("image003", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image003/500/300"));
    items.add(new Gambar("image404", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image404/500/900"));
    items.add(new Gambar("image005", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image005/500/600"));
    items.add(new Gambar("image006", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image006/500/500"));
    items.add(new Gambar("image007", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image007/500/400"));
    items.add(new Gambar("image008", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image008/500/700"));
    items.add(new Gambar("image009", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image009/500/600"));
    items.add(new Gambar("image010", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image010/500/900"));
    items.add(new Gambar("image011", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image011/500/500"));
    items.add(new Gambar("image012", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image012/500/800"));
    items.add(new Gambar("image013", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image013/500/300"));
    items.add(new Gambar("image014", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image014/500/900"));
    items.add(new Gambar("image015", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image015/500/600"));
    items.add(new Gambar("image016", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image016/500/500"));
    items.add(new Gambar("image017", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image017/500/400"));
    items.add(new Gambar("image018", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image018/500/700"));
    items.add(new Gambar("image019", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image019/500/600"));
    items.add(new Gambar("image020", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image020/500/800"));
    items.add(new Gambar("image021", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image021/500/600"));
    items.add(new Gambar("image022", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image022/500/400"));
    items.add(new Gambar("image023", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image023/500/500"));
    items.add(new Gambar("image024", "Alejandro Escamilla", 560, 370,
        "https://picsum.photos/seed/image024/500/500"));
  }

  Widget Iii(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(items[index].url, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            color: Colors.transparent,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: items.length,
              itemBuilder: (context, index) => Iii(context, index),
              //pinterest
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              // ig
              // staggeredTileBuilder: (index) => StaggeredTile.count(
              //     (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          ),
          Align(
            alignment: Alignment(-0.9, -0.9),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     //   return AddTask();
      //     // }));
      //   },
      //   tooltip: 'Increment',
      //   mini: true,
      //   backgroundColor: Colors.brown,
      //   foregroundColor: Colors.white54,
      //   child: Icon(
      //     Icons.arrow_back,
      //   ),
      //   elevation: 5,
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniStartTop
    );
  }
}
