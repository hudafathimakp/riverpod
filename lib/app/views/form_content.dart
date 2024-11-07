// widgets/form_content.dart
import 'package:flutter/material.dart';
import 'package:screl_flutter_project/app/widgets/add_new_widget.dart';
import 'package:screl_flutter_project/app/widgets/constants.dart';
import 'package:screl_flutter_project/app/widgets/custom_toggle.dart';

class FormContent extends StatefulWidget {
  const FormContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormContentState createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController fromNameController = TextEditingController();
  final TextEditingController fromEmailController = TextEditingController();
  bool runOncePerCustomer = false;
  bool customerAudience = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Create New Email Campaign",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text("Fill out these details to build your broadcast"),
            const SizedBox(height: kPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AddTextFieldWidget(
                  label: "Campaign Subject",
                  hintText: "Enter Subject",
                ),
                const SizedBox(height: kSpacing),
                AddTextFieldWidget(
                  height: size.height * 0.1,
                  maxLengthLimit: 4,
                  minLines: 4,
                  label: "Preview text",
                  hintText: "Enter text here...",
                ),
                const SizedBox(height: kPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddTextFieldWidget(
                      width: size.width * 0.33,
                      label: "From Name",
                      hintText: "From Anne",
                    ),
                    AddTextFieldWidget(
                      width: size.width * 0.33,
                      label: "From Email",
                      hintText: "Anne@examble.com",
                    ),
                  ],
                ),
                const SizedBox(height: kPadding),
                const SizedBox(width: double.infinity, child: Divider()),
                 CustomToggle(
                  label: "Run only once per customer",
                  onChanged: (bool value) {
                    setState(() {
                        runOncePerCustomer = value;
                    });
                  },
                ),
               
                
                CustomToggle(
                  label: "Customer audience",
                  onChanged: (bool value) {
                    setState(() {
                      customerAudience = value;
                    });
                  },
                ),
              
                const SizedBox(height: kPadding),
                const SizedBox(width: double.infinity, child: Divider()),
                const SizedBox(height: kPadding),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: kSecondaryColor, fontSize: 16),
                    children: [
                      TextSpan(text: "You can set up a "),
                      TextSpan(
                        text: "Custom domain or current Email",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: " to change this.",
                          style:
                              TextStyle(color: kSecondaryColor, fontSize: 16)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
