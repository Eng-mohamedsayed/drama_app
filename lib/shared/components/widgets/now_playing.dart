import 'package:drama/models/movie_playing.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_indicator/page_indicator.dart';

class NowPlaying extends StatelessWidget {
  MoviePlaying? moviePlayingModel;
  var length;
  NowPlaying(this.moviePlayingModel, this.length);
  @override
  Widget build(BuildContext context) {
    // if (moviePlayingModel != null) {
      return Container(
        height: 220,
        child: PageIndicatorContainer(
          indicatorSpace: 8,
          shape: IndicatorShape.circle(size: 6),
          padding: const EdgeInsets.all(5),
          indicatorColor: DefaultColors.titleColor,
          indicatorSelectorColor: DefaultColors.secondColor,
          align: IndicatorAlign.bottom,
          child: PageView.builder(
          
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original/${moviePlayingModel!.results![index].backdropPath.toString()}'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            DefaultColors.mainColor.withOpacity(1.0),
                            DefaultColors.mainColor.withOpacity(0.0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0.0, 0.9]),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Icon(
                        FontAwesomeIcons.playCircle,
                        size: 40,
                        color: DefaultColors.secondColor,
                      )),
                  Positioned(
                      bottom: 30,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              moviePlayingModel!.results![index].title
                                  .toString(),
                              style: const TextStyle(
                                  height: 1.5,
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ],
              );
            },
            itemCount: length,
          ),
          length: length,
        ),
      );
    // } else {
    //   return const Center(
    //     child: CircularProgressIndicator(
    //       color: DefaultColors.secondColor,
    //     ),
    //   );
    // }
  }
}
