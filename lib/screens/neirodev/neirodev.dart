import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:neirodev/core/routes/app_route.dart';
import 'package:neirodev/core/routes/route_names.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';
import 'package:neirodev/screens/gender/bloc/get_gender_bloc.dart';
import 'package:neirodev/screens/neirodev/bottom_navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Neirodev extends StatelessWidget {
  const Neirodev({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I.get<GetAgeBloc>()),
        BlocProvider(create: (context) => GetIt.I.get<GetGenderBloc>()),
      ],
      child: Scaffold(
        body: SafeArea(child: child),
        bottomNavigationBar: const AppBottomNavigation(),
      ),
    );
  }
}

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: state,
              onTap: (value) {
                context.read<BottomNavigationCubit>().itemTapped(value);
                switch (value) {
                  case 0:
                    AppRouter.router.goNamed(RouteNames.age);
                    break;
                  case 1:
                    AppRouter.router.goNamed(RouteNames.gender);
                    break;
                  case 2:
                    AppRouter.router.goNamed(RouteNames.nationalize);
                    break;
                  default:
                    AppRouter.router.goNamed(RouteNames.age);
                    break;
                }
              },
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month_sharp), label: 'Возраст'),
                BottomNavigationBarItem(icon: Icon(Icons.male), label: 'Пол'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: 'Национальность')
              ]);
        },
      ),
    );
  }
}
