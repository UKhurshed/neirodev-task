import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.appWidth * 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.appHeight * 50.h,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Введите имя',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCFCFCF)),
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          SizedBox(height: context.appHeight * 20.h),
          SizedBox(
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
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFFF4444)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                      child: const Text('Угадайте возраст',
                          style: TextStyle(fontSize: 16, color: Colors.white)));
                },
              )),
          SizedBox(height: context.appHeight * 35.h),
          BlocBuilder<GetAgeBloc, GetAgeState>(
            builder: (context, state) {
              var age = '';
              if (state is GetAgeSuccess) {
                age = state.ageModel.age.toString();
              }
              return Text('Age: $age');
            },
          )
        ],
      ),
    );
  }
}
