import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_app_1/sharedpreference.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final ageController = TextEditingController();
  final stateController = TextEditingController();

  final List<String> states = [
    "Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh",
    "Goa","Gujarat","Haryana","Himachal Pradesh","Jharkhand",
    "Karnataka","Kerala","Maharashtra","Madhya Pradesh","Manipur",
    "Meghalaya","Mizoram","Nagaland","Odisha","Punjab",
    "Rajasthan","Sikkim","Tamil Nadu","Telangana",
    "Uttar Pradesh","Uttarakhand","West Bengal"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            SizedBox(height: 30),

            Text(
              "Logged In",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Full Name"),
            ),

            SizedBox(height: 10),

            /// STATE AUTOCOMPLETE FIELD
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {

                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }

                return states.where((state) =>
                    state.toLowerCase().contains(
                        textEditingValue.text.toLowerCase()));
              },

              onSelected: (String selection) {
                stateController.text = selection;
              },

              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {

                controller.text = stateController.text;

                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                   onSubmitted: (value) {
        /// find first matching state and fill textbox
        final match = states.firstWhere(
          (state) => state.toLowerCase().contains(value.toLowerCase()),
          orElse: () => value,
        );

        controller.text = match;
        stateController.text = match;

        focusNode.unfocus(); // close dropdown
      },
     

                  decoration: InputDecoration(
                    labelText: "State",
                  ),
                );
              },
            ),

            SizedBox(height: 10),

            TextField(
              controller: mobileController,
           keyboardType: TextInputType.number,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly, // only numbers
    LengthLimitingTextInputFormatter(10),   // max 10 digits
  ],
              decoration: InputDecoration(labelText: "Mobile Number"),
            ),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Age"),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {

                if(nameController.text.isEmpty ||
                   mobileController.text.isEmpty ||
                   ageController.text.isEmpty ||
                   stateController.text.isEmpty){

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please fill all details"))
                  );
                  return;
                }

                await Sharedpreference.saveLogin(
                  nameController.text,
                  mobileController.text,
                );

              },
              child: Text("Login"),
            )

          ],
        ),
      ),
    );
  }
}