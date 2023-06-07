import 'package:flutter/material.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/gender/widgets/gender_button.dart';
import 'package:neirodev/screens/gender/widgets/gender_info.dart';
import 'package:neirodev/screens/widgets/common_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: GenderView()),
    );
  }
}

class GenderView extends StatefulWidget {
  const GenderView({super.key});

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  final TextEditingController genderController = TextEditingController();

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
                child: Image.asset('assets/png/gender_icon.png',
                    height: context.appHeight * 150.h)),
            SizedBox(height: context.appHeight * 50.h),
            CommonTextField(controller: genderController, hint: AppLocalizations.of(context)!.enterYourName),
            SizedBox(height: context.appHeight * 20.h),
            GenderButton(genderController: genderController),
            SizedBox(height: context.appHeight * 35.h),
            const GenderInfo(),
          ],
        ),
      ),
    );
  }
}
