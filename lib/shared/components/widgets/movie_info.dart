import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieInfo extends StatefulWidget {
  int? id;
  MovieInfo({Key? key, @required this.id}) : super(key: key);

  @override
  State<MovieInfo> createState() => _MovieInfoState(id);
}

class _MovieInfoState extends State<MovieInfo> {
  int? id;
  _MovieInfoState(this.id);
  @override
  void initState() {
    // TODO: implement initState
    DramaCubits.get(context).getMoviesDetails(id: id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaCubits, DramaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DramaCubits.get(context);
  if(state is DramaGetMovieDetailsLoadingStates || cubit.allMovieDetails!=null)
        { 
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BUDGET',
                        style: TextStyle(
                            color: DefaultColors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cubit.allMovieDetails!.budget.toString() + "\$",
                        style: const TextStyle(
                            color: DefaultColors.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DURATION',
                        style: TextStyle(
                            color: DefaultColors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cubit.allMovieDetails!.runtime.toString() + " min",
                        style: const TextStyle(
                            color: DefaultColors.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'RELEASE DATE',
                        style: TextStyle(
                            color: DefaultColors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cubit.allMovieDetails!.releaseDate.toString(),
                        style: const TextStyle(
                            color: DefaultColors.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "GENRES",
                    style: TextStyle(
                        color: DefaultColors.titleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.only(top: 5),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.allMovieDetails!.genres!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: Text(
                              cubit.allMovieDetails!.genres![index].name
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );}else
        {
                        return const Center(
            child: CircularProgressIndicator(),
          );


        }
      },
    );
  }
}
