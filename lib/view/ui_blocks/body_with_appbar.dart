import 'package:flutter/material.dart';
import 'package:shopybee/services/navbar_icons/appbar_icons.dart';
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CustomAppbar.location,
                    color: Colors.red[600]!,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.35,
                          child: const Text('Gamharia',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'mutka',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.35,
                          child: const Text(
                            'Chhota Gamharia',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ]),
                ],
              ),
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
