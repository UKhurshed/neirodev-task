import 'package:flutter/material.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/age/widgets/agify_button.dart';
import 'package:neirodev/screens/age/widgets/user_info.dart';
import 'package:neirodev/screens/widgets/common_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AgeView()),
    );
  }
}

class AgeView extends StatefulWidget {
  const AgeView({super.key});

  @override
  State<AgeView> createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.appWidth * 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.appHeight * 80.h),
            Center(
                child: Image.asset('assets/png/age_icon.png',
                    height: context.appHeight * 150.h)),
            SizedBox(height: context.appHeight * 50.h),
            CommonTextField(
                controller: nameController,
                hint: AppLocalizations.of(context)!.enterYourName),
            SizedBox(height: context.appHeight * 20.h),
            AgifyButton(nameController: nameController),
            SizedBox(height: context.appHeight * 35.h),
            const UserInfo()
          ],
        ),
      ),
    );
  }
}
