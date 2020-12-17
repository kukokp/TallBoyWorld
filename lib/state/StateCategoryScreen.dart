import 'dart:math';

import 'dart:async';
import 'dart:convert';

import 'package:tallboyworld/utils/ApiConstant.dart';
import 'package:tallboyworld/utils/AppConstant.dart';
import 'package:tallboyworld/utils/GeneralUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tallboyworld/design/AppDesign.dart';
import 'package:tallboyworld/model/MainCategoryModel.dart';
import 'package:tallboyworld/row/RowCategory.dart';
import 'package:tallboyworld/screen/CategoryScreen.dart';
import 'package:flutter/cupertino.dart';

class StateCategoryScreen extends State<CategoryScreen> {
  final _pairList = <MainCategoryModel>[];
  // final _biggerFont = const TextStyle(fontSize: 18.0);
  final _itemFetcher = _ItemFetcher();

  bool _isLoading = true;
  bool _hasMore = true;

  Future<MainCategoryModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _hasMore = true;
    _loadMore();
    //futureAlbum = fetchAlbum();
  }

  void _loadMore() {
    _isLoading = true;
    // _itemFetcher.fetch().then((List<MainCategoryModel> fetchedList) {
    _itemFetcher.getCategory().then((List<MainCategoryModel> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _pairList.addAll(fetchedList);
        });
      }
    });
  }

  Future<List<MainCategoryModel>> fetchAlbum() async {
    final response =
        await http.get(ApiConstant.baseURL + ApiConstant.methodCATEGORY);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((job) => new MainCategoryModel.fromJson(job))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppDesign.appBarBackground,
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                // Need to display a loading tile if more items are coming
                itemCount: _hasMore ? _pairList.length + 1 : _pairList.length,
                itemBuilder: (BuildContext context, int index) {
                  // Uncomment the following line to see in real time how ListView.builder works
                  // print('ListView.builder is building index $index');
                  if (index >= _pairList.length) {
                    if (!_isLoading) {
                      _loadMore();
                    }
                    return Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        height: 24,
                        width: 24,
                      ),
                    );
                  }
                  return RowCategory(_pairList[index]);
                },
              ),
            )
          ],
        ));
  }
}

class _ItemFetcher {
  final _count = 103;
  final _itemsPerPage = 5;
  int _currentPage = 0;

  // This async function simulates fetching results from Internet, etc.
  Future<List<MainCategoryModel>> fetch() async {
    final list = <MainCategoryModel>[];
    final n = min(_itemsPerPage, _count - _currentPage * _itemsPerPage);
    // Uncomment the following line to see in real time now items are loaded lazily.
    // print('Now on page $_currentPage');
    await Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < n; i++) {
        MainCategoryModel m = new MainCategoryModel(
          catId: 1,
          catParentId: 1,
          catName: "cName -- " + i.toString(),
          catDescription: "catDescription",
          catImageURL:
              "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
        );
        list.add(m);
      }
    });
    _currentPage++;
    return list;
  }

  // This async function simulates fetching results from Internet, etc.
  Future<List<MainCategoryModel>> getCategory() async {
    List list = <MainCategoryModel>[];
    final response =
        await http.get(ApiConstant.baseURL + ApiConstant.methodCATEGORY);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      list =
          jsonResponse.map((e) => new MainCategoryModel.fromJson(e)).toList();
    } else {
      GeneralUtils.showToast("Exception in api calling ",
          AppConstant.toastCenter, AppConstant.toastError);
    }
    return list;
  }
}
