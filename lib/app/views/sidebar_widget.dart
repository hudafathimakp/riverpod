
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_flutter_project/app/widgets/constants.dart';

import '../viewmodels/form_viewmodel.dart';

class SidebarWidget extends ConsumerWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formViewModel = ref.watch(formViewModelProvider);

    
    final stepData = [
      {
        "title": "Create New Campaign",
        "subtitle": "Fill Out these details and get your campaign ready"
      },
      {
        "title": "Create Segment",
        "subtitle": "Get full Control over your audience"
      },
      {
        "title": "Bidding Strategy",
        "subtitle": "Optimize your campaign reach with adsense"
      },
      {"title": "Site Links", "subtitle": "Setup your customer journey flow"},
      {
        "title": "Review Campaign",
        "subtitle": "Double check your campaign is ready to go!"
      },
    ];

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: stepData.length,
            itemBuilder: (context, index) {
              final step = stepData[index];
              final isActive = index == formViewModel.currentStep;

              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: isActive ? Colors.orange : kSecondaryColor,
                        width: 2.0),
                  ),
                  child: CircleAvatar(
                    backgroundColor:
                        isActive ? Colors.orange : Colors.transparent,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isActive ? Colors.white : kSecondaryColor,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  step["title"]!,
                  style: TextStyle(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                subtitle: Text(step["subtitle"]!),
              );
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Need Help?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Text(
              "Get to Know how your campaign\n can reach a wider audience",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black)),
                child: const Text("Contact Us"),
              ),
            )
          ],
        ),
      ],
    );
  }
}
