import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/add_address_screen_controller.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AddAddressScreen/components/address_textfield.dart';
import 'package:shopybee/view/Ui_blocks/primaryButton.dart';

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

  final String userId = FirebaseAuth.instance.currentUser!.uid;

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
    final controller = Provider.of<AddAddressScreenController>(context);

    final dataProvider =
        Provider.of<UserDetailProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: (controller.getLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Add new address',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
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
              ),
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? const SizedBox()
          : PrimaryButton(
              callBack: () async {
                if (_formKey.currentState!.validate()) {
                  logger.fine('New Address form validated');
                  controller.startLoading();
                  // await dataProvider.createNewAddress(
                  //     userId,
                  //     AddressModel(
                  //         city: cityController.text,
                  //         id: '',
                  //         name: nameController.text,
                  //         phone: phoneNoController.text,
                  //         state: stateController.text,
                  //         pincode: pincodeController.text,
                  //         addressLine: addressLineController.text,
                  //         landmark: landmarkController.text));
                  controller.stopLoading();
                }
              },
              text: "Save Address",
              height: 45,
              width: displayWidth(context) * 0.95),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
