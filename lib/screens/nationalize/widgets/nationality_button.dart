import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/nationalize/bloc/get_nationalize_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NationalityButton extends StatelessWidget {
  const NationalityButton({super.key, required this.nationalityController});

  final TextEditingController nationalityController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: context.appHeight * 50.h,
          width: context.appWidth * 250.w,
          child: BlocConsumer<GetNationalizeBloc, GetNationalizeState>(
            listener: (context, state) {
              if (state is GetNationalizeFailure) {
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
              if (state is GetNationalizeProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              return OutlinedButton(
                  onPressed: () {
                    if (nationalityController.text.isNotEmpty) {
                      BlocProvider.of<GetNationalizeBloc>(context).add(
                          GetNationalize(name: nationalityController.text));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFFF4444)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  child: Text(
                      AppLocalizations.of(context)!.guessYourNationality,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)));
            },
          )),
    );
  }
}
