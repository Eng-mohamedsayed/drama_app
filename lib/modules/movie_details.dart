import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/models/get_movie_by_genre.dart';
import 'package:drama/models/movie.dart';
import 'package:drama/models/movie_details.dart';
import 'package:drama/models/video.dart';
import 'package:drama/shared/components/widgets/cast_screen.dart';
import 'package:drama/shared/components/widgets/movie_info.dart';
import 'package:drama/shared/components/widgets/similar_movie.dart';
import 'package:drama/shared/components/widgets/video_player.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetialScreen extends StatefulWidget {
  MovieByGenre? movieModel;
  int? index;
  MovieDetialScreen({Key? key, @required this.movieModel, @required this.index})
      : super(key: key);

  @override
  State<MovieDetialScreen> createState() =>
      _MovieDetialsState(movieModel!, index!);
}

class _MovieDetialsState extends State<MovieDetialScreen> {
  MovieByGenre? movieModel;
  int? index;
  _MovieDetialsState(this.movieModel, this.index);
  @override
  void initState() {
   
    DramaCubits.get(context).getVideos(id: movieModel!.results![index!].id!);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaCubits, DramaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DramaCubits.get(context);
        return Scaffold(
          backgroundColor: DefaultColors.mainColor,
          body: Builder(builder: (context) {

            if(state is! DramaGetVideoLoadingStates||cubit.videoModel != null || state is! DramaGetMovieCastLoadingStates|| state is! DramaGetMovieDetailsLoadingStates||state is! DramaGetSimilarMovieLoadingStates|| movieModel!=null && cubit.lengthOfMovieCast>0 || cubit.lengthOfMovieSimilar>0 ||cubit.allMovieDetails!=null||cubit.allSimilarMovie!=null||cubit.allMovieCast!=null)
            {
              return SliverFab(
                floatingPosition: const FloatingPosition(right: 20.0),
                floatingWidget: 
                state is! DramaGetVideoLoadingStates && cubit.videoModel != null? buildVideoWidget(cubit.videoModel!): buildVideoWidgetNo(),
                expandedHeight: 200,
                slivers: [
                  SliverAppBar(
                    backgroundColor: DefaultColors.mainColor,
                    expandedHeight: 200,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        movieModel!.results![index!].title!.length > 40
                            ? movieModel!.results![index!].title!
                                    .toString()
                                    .substring(0, 37) +
                                "..."
                            : movieModel!.results![index!].title.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      background: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/original/' +
                                          movieModel!
                                              .results![index!].backdropPath
                                              .toString()),
                                )),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.0)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.9),
                                    Colors.black.withOpacity(0.0),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(0.0),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              movieModel!.results![index!].voteAverage
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            RatingBar(
                                itemSize: 10,
                                initialRating:
                                    movieModel!.results![index!].voteAverage! /
                                        2,
                                minRating: 1,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'OVERVIEW',
                          style: TextStyle(
                              color: DefaultColors.titleColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          movieModel!.results![index!].overview.toString(),
                          style: const TextStyle(
                              color: Colors.white, height: 1.5, fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MovieInfo(id: movieModel!.results![index!].id),
                      CastScreen(id: movieModel!.results![index!].id),
                      SimilarMovie(id: movieModel!.results![index!].id)
                    ])),
                  ),
                ],
              );
       
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
            
           
       
          }),
        );
      },
    );
  }

  Widget buildVideoWidget(VideoModel model) {
    return FloatingActionButton(
        backgroundColor: DefaultColors.secondColor,
        child: const Icon(Icons.play_arrow),
        onPressed: () 
        {
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=>VideoPlayerScreen(controller:YoutubePlayerController(initialVideoId:model.results![0].key!,flags: YoutubePlayerFlags(autoPlay: true,) ))));
        }
        
        );
  }

    Widget buildVideoWidgetNo() {
    return FloatingActionButton(
        backgroundColor: DefaultColors.secondColor,
        child: const Icon(Icons.play_arrow),
        onPressed: () 
        {
 
        }
        
        );
  }
}
