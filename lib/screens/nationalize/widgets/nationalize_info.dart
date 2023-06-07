import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neirodev/core/extensions/screen_size.dart';
import 'package:neirodev/screens/nationalize/bloc/get_nationalize_bloc.dart';

class NationalizeInfo extends StatelessWidget {
  const NationalizeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNationalizeBloc, GetNationalizeState>(
      builder: (context, state) {
        List<Widget> natWidgets = [];
        if (state is GetNationalizeSuccess) {
          natWidgets.addAll(state.genderModel.country
              .map((value) => Padding(
            padding:
            EdgeInsets.symmetric(vertical: context.appHeight * 5.h),
            child: Row(children: [
              CountryFlag.fromCountryCode(value.countryId,
                  height: context.appHeight * 30.h,
                  width: context.appWidth * 30.w),
              SizedBox(width: context.appWidth * 4.w),
              const Text('-'),
              SizedBox(width: context.appWidth * 4.w),
              Text(
                '${(value.probability * 100).toInt()}%',
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ))
              .toList());
        }
        return Padding(
          padding: EdgeInsets.only(left: context.appWidth * 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: natWidgets,
          ),
        );
      },
    );
  }
}