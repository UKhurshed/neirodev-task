import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAgeBloc, GetAgeState>(
      builder: (context, state) {
        var age = '';
        var name = '';
        if (state is GetAgeSuccess) {
          age = state.ageModel.age.toString();
          name = state.ageModel.name;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '${AppLocalizations.of(context)!.age}: ',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: age,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ]),
            ),
            SizedBox(height: context.appHeight * 12.h),
            RichText(
              text: TextSpan(children: [
                 TextSpan(
                    text: '${AppLocalizations.of(context)!.name}: ',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: name,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ]),
            ),
            SizedBox(height: context.appHeight * 30.h),
          ],
        );
      },
    );
  }
}
