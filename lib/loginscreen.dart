import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_app_1/sharedpreference.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FnameController = TextEditingController();
  final LnameController = TextEditingController();
  final MnameController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final pincodeController = TextEditingController();

  final List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Maharashtra",
    "Madhya Pradesh",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];
  final List<String> exams = [
    "Jain Pathavali Part 1",
    "Jain Pathavali Part 2",
    "Jain Pathavali Part 3",
    "Jain Pathavali Part 4",
    "Jain Pathavali Part 5",
    "Jain Pathavali Part 6",
    "Jain Pathavali Part 7",
    "Jain Pathavali Part 8",
  ];
  String? gender;
  DateTime? selectedDate;
  String? selectedExam;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            Center(
              child: Text(
                "Register Your Self",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: FnameController,
              decoration: InputDecoration(labelText: "First Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: MnameController,
              decoration: InputDecoration(labelText: "Middle Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: LnameController,
              decoration: InputDecoration(labelText: "Last Name"),
            ),
            SizedBox(height: 10),
            Text("Select Gender"),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("Male"),
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),

                Expanded(
                  child: RadioListTile(
                    title: Text("Female"),
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            /// STATE AUTOCOMPLETE FIELD
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }

                return states.where(
                  (state) => state.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  ),
                );
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
                          (state) =>
                              state.toLowerCase().contains(value.toLowerCase()),
                          orElse: () => value,
                        );

                        controller.text = match;
                        stateController.text = match;

                        focusNode.unfocus(); // close dropdown
                      },

                      decoration: InputDecoration(labelText: "State"),
                    );
                  },
            ),

            SizedBox(height: 10),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: "City Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pincodeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // only numbers
                LengthLimitingTextInputFormatter(6), // max 10 digits
              ],
              decoration: InputDecoration(labelText: "Pin Code"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // only numbers
                LengthLimitingTextInputFormatter(10), // max 10 digits
              ],
              
              decoration: InputDecoration(labelText: "Mobile Number"),
            ), SizedBox(height: 5),

    Text(
      "Note: Mobile number is same as WhatsApp number.",
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    ),
            SizedBox(height: 10),
            TextField(
              controller: dobController,
              readOnly: true,
              onTap: () {
                selectDate(context);
              },
              decoration: InputDecoration(
                labelText: "Date Of Birth",
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedExam,
                    hint: Text("Select Exam"),
                    items: exams.map((exam) {
                      return DropdownMenuItem(value: exam, child: Text(exam));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedExam = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (FnameController.text.isEmpty ||
                        MnameController.text.isEmpty ||
                        LnameController.text.isEmpty ||
                        mobileController.text.isEmpty ||
                        cityController.text.isEmpty ||
                        dobController.text.isEmpty ||
                        gender == null ||
                        pincodeController.text.isEmpty ||
                        selectedExam == null ||
                        stateController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all details")),
                      );
                      return;
                    }

                    await Sharedpreference.saveLogin(
                      FnameController.text,
                      mobileController.text,
                    );
                  },
                  child: Text("Register"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      FnameController.clear();
                      MnameController.clear();
                      LnameController.clear();
                      mobileController.clear();
                      cityController.clear();
                      dobController.clear();
                      gender = null;
                      pincodeController.clear();
                      selectedExam = null;
                      stateController.clear();
                    });
                  },
                  child: Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dobController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }
}
