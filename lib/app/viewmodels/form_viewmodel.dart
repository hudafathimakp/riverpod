import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_flutter_project/app/model/form_steps_model.dart';
import 'package:screl_flutter_project/app/views/form_content.dart';

final formViewModelProvider = ChangeNotifierProvider((ref) => FormViewModel());

class FormViewModel extends ChangeNotifier {
  final List<FormStepsModel> formSteps = [
    const FormStepsModel(
      title: "Create New Campaign",
      label: "Fill out these details and get your campaign ready",
      status: FormStatus.pending,
      formWidget: FormContent(),
    ),
    const FormStepsModel(
      title: "Add Campaign Details",
      label: "Enter the details of your campaign",
      status: FormStatus.pending,
      formWidget: SizedBox(
          height: 650,
          child: Center(
              child: Text(
            " This is step 2",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ))),
    ),
    const FormStepsModel(
      title: "Create New Campaign",
      label: "Fill out these details and get your campaign ready",
      status: FormStatus.pending,
      formWidget: FormContent(), // Replace with actual form content
    ),
    const FormStepsModel(
      title: "Add Campaign Details",
      label: "Enter the details of your campaign",
      status: FormStatus.pending,
      formWidget: SizedBox(
          height: 650,
          child: Center(
              child: Text(
            " This is step 4",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ))),
    ),
    const FormStepsModel(
      title: "Create New Campaign",
      label: "Fill out these details and get your campaign ready",
      status: FormStatus.pending,
      formWidget: SizedBox(
          height: 650,
          child: Center(
              child: Text(
            " This is step 5",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ))),
    ),

    // Additional steps can be added here.
  ];

  int currentStep = 0;

  void goToNextStep() {
    if (isCurrentFormValid()) {
      currentStep = (currentStep + 1) % formSteps.length;
      notifyListeners();
    }
  }

  bool isCurrentFormValid() {
    // Implement validation for current form
    return true;
  }

  void saveDraft(Map<String, dynamic> formData) {
    // Save to local storage (implement logic in local storage service)
  }

  Map<String, dynamic> loadDraft() {
    // Load from local storage (implement logic in local storage service)
    return {};
  }
}
