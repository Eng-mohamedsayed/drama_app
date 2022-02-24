// ignore_for_file: avoid_print

import 'package:drama/cubit/states.dart';
import 'package:drama/models/cast.dart';
import 'package:drama/models/get_movie_by_genre.dart';
import 'package:drama/models/movie_details.dart';
import 'package:drama/models/movie_genre.dart';
import 'package:drama/models/movie_person.dart';
import 'package:drama/models/movie_playing.dart';
import 'package:drama/models/movie_similar.dart';
import 'package:drama/models/movie_top_rated.dart';
import 'package:drama/models/video.dart';
import 'package:drama/shared/components/constants.dart';
import 'package:drama/shared/components/widgets/now_playing.dart';
import 'package:drama/shared/components/widgets/similar_movie.dart';
import 'package:drama/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DramaCubits extends Cubit<DramaStates> {
  DramaCubits() : super(DramaInitialStates());

  static DramaCubits get(context) => BlocProvider.of(context);

  MovieTopRated? topRated;
  List<MovieTopRated>? topRatedMovies = [];

  void getPopularMovies() {
    emit(DramaGetMovieLoadingStates());

    DioHelper.getData(url: movieTopRated, query: {
      'api_key': apiKey,
    }).then((value) {
      topRated = MovieTopRated.fromJson(value.data);

      emit(DramaGetMovieSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetMovieErrorStates());
    });
  }


    MoviePlaying? movieNowPlaying;

    var length=0;

  void getNowPlayingMovies() {
    emit(DramaGetMovieNowPlayingLoadingStates());

    DioHelper.getData(url: moviePlaying, query: {
      'api_key': apiKey,
    }).then((value) {
      movieNowPlaying = MoviePlaying.fromJson(value.data);
         length  = movieNowPlaying!.results!.getRange(0, 5).length;


      emit(DramaGetMovieMovieNowPlayingSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetMovieMovieNowPlayingErrorStates());
    });
  }



MovieByGenre? movieByGenre;
  var lengthOfMovieGenre=0;

 
  void getMoviesByGenre({required String id}) {
    emit(DramaGetMovieByGenresLoadingStates());

    DioHelper.getData(url: allMovies, query: {
      'api_key': apiKey,
       'with_genres': id
    }).then((value) {
      movieByGenre = MovieByGenre.fromJson(value.data);
      lengthOfMovieGenre = movieByGenre!.results!.getRange(0, 5).length;
      print(movieByGenre!.results![0].title);

      emit(DramaGetMovieByGenresSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetMovieByGenresErrorStates());
    });
  }




  MovieGenre? allMovieGenre;
  var lengthOfAllGenre = 0;
  

  void getAllGenres() {
    emit(DramaGetGenresLoadingStates());

    DioHelper.getData(url: movieGenre, query: {
      'api_key': apiKey,
    }).then((value) {
      allMovieGenre = MovieGenre.fromJson(value.data);
      lengthOfAllGenre = allMovieGenre!.genres!.length;

      emit(DramaGetGenresSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetGenresErrorStates());
    });
  }


  MoviePerson? allMoviePerson;
  var lengthOfPersons = 0;
  
  void getAllPerson() {
    emit(DramaGetPersonsLoadingStates());

    DioHelper.getData(url: moviePerson, query: {
      'api_key': apiKey,
    }).then((value) {
      allMoviePerson = MoviePerson.fromJson(value.data);
      lengthOfPersons = allMoviePerson!.results!.length;

      emit(DramaGetPersonsSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetPersonsErrorStates());
    });
  }



   MovieTopRated? allTopRatedMovie;
  var lengthOfTopRatedMovie = 0;

  void getAllTopRatedMovie() {
    emit(DramaGetTopRatedMovieLoadingStates());

    DioHelper.getData(url: movieTopRated, query: {
      'api_key': apiKey,
    }).then((value) {
      allTopRatedMovie = MovieTopRated.fromJson(value.data);
      lengthOfTopRatedMovie = allTopRatedMovie!.results!.length;

      emit(DramaGetTopRatedMovieSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetTopRatedMovieErrorStates());
    });
  }



MovieDetails? allMovieDetails;

  void getMoviesDetails({required int id}) {
    emit(DramaGetMovieDetailsLoadingStates());

    DioHelper.getData(
        url: movieDetails+"/$id",
        query: {'api_key': apiKey}).then((value) {
      allMovieDetails = MovieDetails.fromJson(value.data);

      emit(DramaGetMovieDetailsSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetMovieDetailsErrorStates());
    });
  }




 MovieCast? allMovieCast;
int lengthOfMovieCast=0;
  void getMoviesCast({required int id}) {
    emit(DramaGetMovieCastLoadingStates());

    DioHelper.getData(url: movieDetails + "/$id"+"/credits", query: {'api_key': apiKey})
        .then((value) {
      allMovieCast = MovieCast.fromJson(value.data);
      lengthOfMovieCast = allMovieCast!.cast!.length;
 
      emit(DramaGetMovieCastSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetMovieCastErrorStates());
    });
  }


   MovieSimilar? allSimilarMovie;
  int lengthOfMovieSimilar = 0;
  void getMoviesSimilar({required int id}) {
    emit(DramaGetMovieDetailsLoadingStates());

    DioHelper.getData(
        url: movieDetails + "/$id" + "/similar",
        query: {'api_key': apiKey}).then((value) {
      allSimilarMovie = MovieSimilar.fromJson(value.data);
      //lengthOfMovieSimilar = allMovieCast!.cast!.length;

      emit(DramaGetMovieDetailsSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetMovieDetailsErrorStates());
    });
  }


  VideoModel? videoModel;
  void getVideos({required int id}) {
    emit(DramaGetVideoLoadingStates());

    DioHelper.getData(
        url: movieDetails + "/$id" + "/videos",
        query: {'api_key': apiKey}).then((value) {
      videoModel = VideoModel.fromJson(value.data);

      print(videoModel!.results![0].key);
      
    

      emit(DramaGetVideoSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(DramaGetVideoErrorStates());
    });
  }






}
