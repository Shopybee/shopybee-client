import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/uitls/custom_icons/appbar_icons.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AppScreen/components/search_box.dart';
import 'package:shopybee/view/ui_blocks/address_book_modal_sheet.dart';

class BodyWithAppBar extends StatelessWidget {
  final dynamic child;
  BodyWithAppBar({required this.child});
  final Logger logger = Logger('BodyWithAppBar');

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: InkWell(
                onTap: () {
                  logger.fine('Open Address Book');
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      builder: (ctx) {
                        return AddressBookModalSheet();
                      });
                },
                child: Row(
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
                                    fontFamily: 'Mukta',
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
