import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/ui_blocks/address_book_modal_sheet.dart';

class ChangeAddressBar extends StatelessWidget {
  const ChangeAddressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            builder: (ctx) {
              return AddressBookModalSheet();
            });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: displayHeight(context) * 0.06,
        color: primaryColor.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.black54,
            ),
            Consumer<UserDetailProvider>(
              builder: (context, controller, child) {
                return Text(
                  'Deliver to ${controller.user!.name} - ${controller.addresses[controller.selectedAddressIndex].city} ${controller.addresses[controller.selectedAddressIndex].pincode}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
