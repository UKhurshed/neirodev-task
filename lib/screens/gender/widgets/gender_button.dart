import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/gender/bloc/get_gender_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({super.key, required this.genderController});

  final TextEditingController genderController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: context.appHeight * 50.h,
          width: context.appWidth * 200.w,
          child: BlocConsumer<GetGenderBloc, GetGenderState>(
            listener: (context, state) {
              if (state is GetGenderFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.errorMessage,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    backgroundColor: Colors.red));
              }
            },
            builder: (context, state) {
              if (state is GetGenderProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              return OutlinedButton(
                  onPressed: () {
                    if (genderController.text.isNotEmpty) {
                      BlocProvider.of<GetGenderBloc>(context)
                          .add(GetGender(name: genderController.text));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFFF4444)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  child:  Text(AppLocalizations.of(context)!.guessGender,
                      style: const TextStyle(fontSize: 16, color: Colors.white)));
            },
          )),
    );
  }
}