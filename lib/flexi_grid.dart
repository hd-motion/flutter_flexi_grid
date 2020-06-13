library flexi_grid;

import 'package:flutter/material.dart';

class FlexiGrid extends StatefulWidget {
  @override
  _FlexiGridState createState() => _FlexiGridState();
}

class _FlexiGridState extends State<FlexiGrid> {
  List<int> gridItemList = List.generate(13, (int index) => index + 1);
  int crossAxisCount = 2;
  double _scaleFactor = 8.0;
  double _baseScaleFactor = 5.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _baseScaleFactor = _scaleFactor;
      },
      onScaleUpdate: (details) {
        print(details.scale);
        setState(() {
          _scaleFactor = _baseScaleFactor / details.scale;
        });
      },
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _scaleFactor.ceil(),
          childAspectRatio: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemCount: gridItemList.length,
        //  getProductList(i, j, ctx).length,
        itemBuilder: (context, index) {
          return Container(
              color: Colors.green,
              child: Center(
                  child: Text(
                "Item: ${gridItemList[index]}",
                style: TextStyle(color: Colors.white),
              )));
        },
      ),
    );
  }
}
