import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'staggered_grid_view_page.dart';

const List<StaggeredTile> _tiles = const <StaggeredTile>[
  const StaggeredTile.count(1, 1.3),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.3),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.3),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.3),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.3),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.3),
  const StaggeredTile.count(1, 1),
];

class MainCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const StaggeredGridViewPage.count(
        title: 'Main Category', crossAxisCount: 2, tiles: _tiles);
  }
}
