import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/modules/home_layout.dart';
import 'package:drama/shared/network/remote/bloc_observer.dart';
import 'package:drama/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => DramaCubits()
               
                ..getPopularMovies()
                ..getNowPlayingMovies()
                ..getAllGenres()
                ..getAllPerson()..getAllTopRatedMovie()..getMoviesDetails(id: 38))
        ],
        child: BlocConsumer<DramaCubits, DramaStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
          ),
        ));
  }
}
