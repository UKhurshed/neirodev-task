import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';

class AgifyButton extends StatelessWidget {
  const AgifyButton({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: context.appHeight * 50.h,
          width: context.appWidth * 200.w,
          child: BlocBuilder<GetAgeBloc, GetAgeState>(
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
                  child: const Text('Угадайте возраст',
                      style: TextStyle(fontSize: 16, color: Colors.white)));
            },
          )),
    );
  }
}