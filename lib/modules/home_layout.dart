import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/shared/components/widgets/genre_list.dart';
import 'package:drama/shared/components/widgets/loading_widget.dart';
import 'package:drama/shared/components/widgets/now_playing.dart';
import 'package:drama/shared/components/widgets/person.dart';
import 'package:drama/shared/components/widgets/top_movies.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaCubits, DramaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DramaCubits.get(context);
        return Scaffold(
            backgroundColor: DefaultColors.mainColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: DefaultColors.mainColor,
              leading: const Icon(EvaIcons.menu2Outline),
              centerTitle: true,
              title: const Text('Drama Cave'),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      EvaIcons.search,
                      color: Colors.white,
                    ))
              ],
            ),
            body: cubit.movieNowPlaying != null ||
                    state is! DramaGetMovieNowPlayingLoadingStates ||
                    cubit.movieByGenre != null ||
                    cubit.allMovieGenre != null ||
                    cubit.allMoviePerson != null ||
                    cubit.allTopRatedMovie != null
                ? ListView(
                    children: [
                      NowPlaying(cubit.movieNowPlaying, cubit.length),
                      GenreListScreen(),
                      const PersonList(),
                      const TopMovie()
                    ],
                  )
                : Container(
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: DefaultColors.secondColor,
                      ),
                    ),
                  ));
      },
    );
  }
}
