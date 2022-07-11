import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AddAddressScreen/components/address_textfield.dart';
import 'package:shopybee/view/Ui_blocks/authTextField.dart';
import 'package:shopybee/view/Ui_blocks/primaryButton.dart';

class AddAddressScreen extends StatelessWidget {
  TextEditingController addressLineController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Add new address',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/address.png'),
              SizedBox(
                height: 30,
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
                prefix: Text("+91 "),
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
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? SizedBox()
          : PrimaryButton(
              text: "Save Address",
              height: 45,
              width: displayWidth(context) * 0.95),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
