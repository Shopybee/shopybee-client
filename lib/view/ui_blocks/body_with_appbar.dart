import 'package:flutter/material.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AppScreen/components/search_box.dart';

class BodyWithAppBar extends StatelessWidget {
  
  final dynamic child;
  BodyWithAppBar({required this.child});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              iconTheme: const IconThemeData(color: Colors.black87),
              toolbarHeight: displayHeight(context) * 0.08,
              backgroundColor: Colors.white,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              forceElevated: innerBoxIsScrolled,
              bottom: SearchBox(),
            ),
          ),
        ];
      },
      body: child,
    );
  }
}
