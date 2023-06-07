import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgifyButton extends StatelessWidget {
  const AgifyButton({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: context.appHeight * 50.h,
          width: context.appWidth * 200.w,
          child: BlocConsumer<GetAgeBloc, GetAgeState>(
            listener: (context, state) {
              if (state is GetAgeFailure) {
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
              if (state is GetAgeProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              return OutlinedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      BlocProvider.of<GetAgeBloc>(context)
                          .add(GetAge(name: nameController.text));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFFF4444)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  child:  Text(AppLocalizations.of(context)!.guessAge,
                      style: const TextStyle(fontSize: 16, color: Colors.white)));
            },
          )),
    );
  }
}
