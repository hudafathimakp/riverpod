import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_flutter_project/app/widgets/constants.dart';
import '../viewmodels/form_viewmodel.dart';
import 'sidebar_widget.dart';
import '../widgets/custom_button.dart';

class CampaignFormPage extends ConsumerWidget {
  const CampaignFormPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formViewModel = ref.watch(formViewModelProvider);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgColor,
      body: Row(
        children: [
          const Expanded(
            flex: 2,
            child: SidebarWidget(),
          ),
          const SizedBox(
              height: double.infinity,
              child: VerticalDivider(
                color: Colors.black,
              )),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                formViewModel.formSteps[formViewModel.currentStep].formWidget,
                Padding(
                  padding: const EdgeInsets.all(kSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        width: size.width * 0.15,
                        isOutlined: true,
                        label: "Save Draft",
                        onPressed: () {
                          // Handle draft saving
                        },
                      ),
                      CustomButton(
                        width: size.width * 0.35,
                        label: "Next Step",
                        onPressed: formViewModel.goToNextStep,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
