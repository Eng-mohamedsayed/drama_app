import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/models/get_movie_by_genre.dart';
import 'package:drama/shared/components/widgets/genre_movie.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreListScreen extends StatefulWidget {
  GenreListScreen({Key? key}) : super(key: key);

  @override
  State<GenreListScreen> createState() => _GenreListScreenState();
} 



class _GenreListScreenState extends State<GenreListScreen>
    with SingleTickerProviderStateMixin {
      List<String>? id;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaCubits, DramaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DramaCubits.get(context);
        if(cubit.movieByGenre!=null || cubit.allMovieGenre!=null)
        {
            return Container(
            height: 307,
            child: DefaultTabController(
                length: cubit.lengthOfAllGenre,
                child: Scaffold(
                  backgroundColor: DefaultColors.mainColor,
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: AppBar(
                      backgroundColor: DefaultColors.mainColor,
                      bottom: TabBar(
                        tabs: cubit.allMovieGenre!.genres!.map((e) {
                        
                          return Container(
                            padding: const EdgeInsets.only(bottom: 15, top: 10),
                            child: Text(
                              e.name!.toUpperCase().toString(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        indicatorColor: DefaultColors.secondColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3,
                        unselectedLabelColor: DefaultColors.titleColor,
                        labelColor: Colors.white,
                        isScrollable: true,
                      ),
                    ),
                  ),
                  body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: cubit.allMovieGenre!.genres!.map((e) {
                      return GenreMovies(genreID:e.id.toString());
                    }).toList(),
                  ),
                )),
          );
    
    
        }else{
         return   Center(child: Container());
        }
         
      },
    );
  }
}


/* 
Column(
                children: const <Widget>[
                  Material(
                      color: Colors.indigo,
                      child: TabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.directions_car)),
                          Tab(icon: Icon(Icons.directions_transit)),
                          Tab(icon: Icon(Icons.directions_bike)),
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        Icon(Icons.directions_car),
                        Icon(Icons.directions_transit),
                        Icon(Icons.directions_bike),
                      ],
                    ),
                  )
                ],
              )

*/
