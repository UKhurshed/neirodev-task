import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/gender/bloc/get_gender_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenderInfo extends StatelessWidget {
  const GenderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGenderBloc, GetGenderState>(
      builder: (context, state) {
        var gender = '';
        var probability = 0.0;
        if (state is GetGenderSuccess) {
          if (state.genderModel.gender == 'male') {
            gender = AppLocalizations.of(context)!.male;
          } else {
            gender = AppLocalizations.of(context)!.female;
          }
          probability = state.genderModel.probability * 100;
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '${AppLocalizations.of(context)!.gender}: ',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: gender,
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
                  text: '${AppLocalizations.of(context)!.probability}: ',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '${probability.toInt()}%',
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500))
            ]),
          ),
          SizedBox(height: context.appHeight * 30.h),
        ]);
      },
    );
  }
}
