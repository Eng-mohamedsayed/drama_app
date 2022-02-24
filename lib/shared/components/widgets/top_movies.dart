import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TopMovie extends StatelessWidget {
  const TopMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaCubits, DramaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DramaCubits.get(context);
        if (cubit.allTopRatedMovie != null) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text('TOP RATED MOVIES',
                      style: TextStyle(
                          color: DefaultColors.titleColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cubit.movieByGenre!.results![0].posterPath == null
                                ? Container(
                                    width: 120,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: DefaultColors.secondColor,
                                      borderRadius: BorderRadius.circular(2),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          EvaIcons.filmOutline,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    width: 120,
                                    height: 180,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w200/${cubit.allTopRatedMovie!.results![index].posterPath.toString()}',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                cubit.movieByGenre!.results![index].title
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    height: 1.4,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  cubit
                                      .movieByGenre!.results![index].voteAverage
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                RatingBar(
                                    itemSize: 8,
                                    initialRating: cubit.movieByGenre!
                                            .results![index].voteAverage! /
                                        2,
                                    minRating: 1,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    ratingWidget: RatingWidget(
                                        full: const Icon(
                                          EvaIcons.star,
                                          color: DefaultColors.secondColor,
                                        ),
                                        half: const Icon(
                                          Icons.star_half,
                                          color: DefaultColors.secondColor,
                                        ),
                                        empty: const Icon(
                                          EvaIcons.starOutline,
                                          color: Colors.white,
                                        )),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    })
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: cubit.lengthOfMovieGenre,
                  ),
                )
              ]);
        } else {
          return Center(child: Container());
        }
      },
    );
  }
}
