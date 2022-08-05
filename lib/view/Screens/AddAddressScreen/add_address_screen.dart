import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AddAddressScreen/components/address_textfield.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController addressLineController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  TextEditingController landmarkController = TextEditingController();

  TextEditingController phoneNoController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Logger logger = Logger('AddAddressScreen');

  @override
  void dispose() {
    nameController.dispose();
    addressLineController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    phoneNoController.dispose();
    landmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Consumer<UserDetailProvider>(
          builder: (context, controller, child) {
            return InkWell(
              onTap: () async {
                controller.createNewAddress(AddressModel(
                    name: nameController.text,
                    id: 1, // Not the actual id
                    userId: controller.user!.id!,
                    addressLine: addressLineController.text,
                    city: cityController.text,
                    state: stateController.text,
                    landmark: landmarkController.text,
                    pincode: pincodeController.text,
                    phone: phoneNoController.text));
              },
              child: Container(
                height: displayHeight(context) * 0.08,
                width: displayWidth(context),
                color: primaryColor,
                alignment: Alignment.center,
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
        body: Consumer<UserDetailProvider>(
          builder: (context, controller, child) {
            if (controller.addressStatus == AddressStatus.creating) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back_ios)),
                          const Text(
                            'Add new address',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'assets/images/address.png',
                        height: displayHeight(context) * 0.2,
                        width: displayWidth(context),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AddressTextfield(
                        controller: nameController,
                        label: "Name",
                        hintText: "Enter name",
                      ),
                      AddressTextfield(
                        controller: addressLineController,
                        label: "Addess Line",
                        hintText: "Enter your address",
                      ),
                      AddressTextfield(
                        controller: cityController,
                        label: "City/Village",
                        hintText: "Enter city",
                      ),
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: AddressTextfield(
                                controller: stateController,
                                label: "State",
                                hintText: "Enter State",
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: AddressTextfield(
                                controller: pincodeController,
                                label: "Pincode",
                                hintText: "Enter Pincode",
                              )),
                        ],
                      ),
                      AddressTextfield(
                        controller: phoneNoController,
                        label: "Phone no.",
                        hintText: "Your Phone no.",
                        prefix: const Text("+91 "),
                      ),
                      AddressTextfield(
                        controller: landmarkController,
                        label: "Landmark",
                        hintText: "Enter Landmark",
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
