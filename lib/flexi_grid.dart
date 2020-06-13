library flexi_grid;

import 'dart:math';

import 'package:flutter/material.dart';

class FlexiGrid extends StatefulWidget {
  @override
  _FlexiGridState createState() => _FlexiGridState();
}

class _FlexiGridState extends State<FlexiGrid> {
  List<int> gridItemList = List.generate(53, (int index) => index + 1);
  int crossAxisCount = 2;
  double _scaleFactor = 19.0;
  double _baseScaleFactor = 1.0;
  double _tempScaleFactor;
  double _tempScale;

  @override
  void initState() {
    super.initState();
    _tempScaleFactor = _scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _baseScaleFactor = _scaleFactor;
        // print(object);
      },
      onScaleUpdate: (details) {
        print(details.scale);
        if (_tempScale != details.scale) {
          _scaleFactor = _baseScaleFactor / details.scale;
          if (_tempScaleFactor.ceil() != _scaleFactor.ceil()) {
            
            _tempScale = details.scale;
            _tempScaleFactor = _scaleFactor;
            setState(() {});
          }
        }
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
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
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
