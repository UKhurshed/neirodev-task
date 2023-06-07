import 'package:flutter/material.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/nationalize/widgets/nationality_button.dart';
import 'package:neirodev/screens/nationalize/widgets/nationalize_info.dart';
import 'package:neirodev/screens/widgets/common_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NationalizeScreen extends StatelessWidget {
  const NationalizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NationalizeView()),
    );
  }
}

class NationalizeView extends StatefulWidget {
  const NationalizeView({super.key});

  @override
  State<NationalizeView> createState() => _NationalizeViewState();
}

class _NationalizeViewState extends State<NationalizeView> {
  final TextEditingController nationalityController = TextEditingController();

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
                child: Image.asset('assets/png/nationality_icon.png',
                    height: context.appHeight * 150.h)),
            SizedBox(height: context.appHeight * 50.h),
            CommonTextField(
                controller: nationalityController,
                hint: AppLocalizations.of(context)!.enterYourName),
            SizedBox(height: context.appHeight * 20.h),
            NationalityButton(nationalityController: nationalityController),
            SizedBox(height: context.appHeight * 35.h),
            const NationalizeInfo()
          ],
        ),
      ),
    );
  }
}
