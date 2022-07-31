import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/custom_icons/appbar_icons.dart';
import 'package:shopybee/uitls/custom_methods.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AppScreen/components/search_box.dart';
import 'package:shopybee/view/ui_blocks/address_book_modal_sheet.dart';

class BodyWithAppBar extends StatelessWidget {
  final dynamic body;
  BodyWithAppBar({required this.body});
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
                      isScrollControlled: true,
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
                    Consumer<UserDetailProvider>(
                      builder: (context, controller, child) {
                        switch (controller.addressStatus) {
                          case AddressStatus.creating:
                            return creatingAppBarAddress();
                          case AddressStatus.notFetched:
                            controller.setAdderesses();
                            return notFetchedAddress();
                          case AddressStatus.fetching:
                            return fetchingAppBarAddress();
                          case AddressStatus.deleting:
                            return deletingAppBarAddress();
                          case AddressStatus.editing:
                            return editingAppBarAddress();
                          case AddressStatus.ok:
                            return okayAppbarAddress(
                                controller
                                    .addresses[controller.selectedAddressIndex]
                                    .addressLine,
                                controller
                                    .addresses[controller.selectedAddressIndex]
                                    .city,
                                controller
                                    .addresses[controller.selectedAddressIndex]
                                    .pincode);
                        }
                      },
                    ),
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
      body: body,
    );
  }
}
