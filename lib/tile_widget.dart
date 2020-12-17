import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tallboyworld/screen/CategoryScreen.dart';
import 'package:tallboyworld/utils/AppConstant.dart';
import 'package:tallboyworld/utils/GeneralUtils.dart';

const List<String> _list = const <String>[
  "https://picsum.photos/seed/picsum/200/300",
  "https://picsum.photos/200/300?grayscale",
  "https://picsum.photos/200/300/?blur",
  "https://cdn.pixabay.com/photo/2016/10/21/14/50/plouzane-1758197_960_720.jpg",
  "https://picsum.photos/id/237/200/300",
  "https://picsum.photos/id/870/200/300?grayscale&blur=2",
  "https://picsum.photos/seed/picsum/200/300",
  "https://picsum.photos/200/300?grayscale",
  "https://picsum.photos/200/300/?blur",
  "https://cdn.pixabay.com/photo/2016/10/21/14/50/plouzane-1758197_960_720.jpg",
  "https://cdn.pixabay.com/photo/2016/11/16/10/59/mountains-1828596_960_720.jpg",
  "https://picsum.photos/id/870/200/300?grayscale&blur=2",
];

class TileWidget extends StatelessWidget {
  const TileWidget(
      {Key key, @required this.index, this.backgroundColor: Colors.green})
      : super(key: key);

  final int index;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Route route = MaterialPageRoute(
              builder: (_) => CategoryScreen(title: 'Sub Category'));
          Navigator.push(context, route);
          GeneralUtils.showToast(
              "Clicked $index", AppConstant.toastCenter, AppConstant.toastInfo);
        },
        child: Container(
          color: this.backgroundColor,
          child: Card(
            child: new Column(
              children: <Widget>[
                new Image.network(
                  _list[index],
                  width: 160,
                  height: 120,
                  fit: BoxFit.fitWidth,
                ),
                new Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        'Person Name $index',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        'Contact : $index',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // child: new Center(
          //     child: new CircleAvatar(
          //   backgroundColor: Colors.white,
          //   child: new Text('$index'),
          // )),
        ));
  }
}
