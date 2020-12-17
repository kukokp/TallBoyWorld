import 'package:tallboyworld/model/MainCategoryModel.dart';
import 'package:tallboyworld/utils/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tallboyworld/utils/GeneralUtils.dart';

class RowCategory extends StatelessWidget {
  final MainCategoryModel model;

  RowCategory(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        margin: EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () => onTapped(context, model),
          child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.all(4.0),
                  child: Image.network(this.model.catImageURL,
                      width: 100, height: 100)),
              Flexible(
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(this.model.catName,
                          maxLines: 3,
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: AppConstant.fontTitleStyle)),
                  SizedBox(
                    height: 7.0,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(this.model.catDescription,
                          maxLines: 3,
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: AppConstant.fontSubTitleStyle))
                ]),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

void onTapped(BuildContext context, MainCategoryModel model) {
  // navigate to the next screen.
  GeneralUtils.showToast("Clicked " + model.catName, AppConstant.toastBottom,
      AppConstant.toastInfo);
  // Route newRoute = MaterialPageRoute(
  //     builder: (_) => SubCategoryScreen(title: 'Sub Category'));
  // Navigator.pushReplacement(context, newRoute);
}
