import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CastScreen extends StatefulWidget {
  int? id;
  CastScreen({Key? key, @required this.id}) : super(key: key);

  @override
  State<CastScreen> createState() => _CastsState(id!);
}

class _CastsState extends State<CastScreen> {
  int? id;
  _CastsState(this.id);
  @override
  void initState() {
    // TODO: implement initState
    DramaCubits.get(context).getMoviesCast(id: id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaCubits, DramaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DramaCubits.get(context);
    if(state is! DramaGetMovieDetailsLoadingStates){
        return 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "CASTS",
                style: TextStyle(
                    color: DefaultColors.titleColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 140,
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cubit.lengthOfMovieCast,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    width: 100,
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w300/' +
                                          cubit.allMovieCast!.cast![index]
                                              .profilePath
                                              .toString(),
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            cubit.allMovieCast!.cast![index].name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            cubit.allMovieCast!.cast![index].character
                                .toString(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                height: 1.4,
                                color: DefaultColors.titleColor,
                                fontSize: 7,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );}else { return const Center(child: CircularProgressIndicator(color: DefaultColors.secondColor,),);}
      },
    );
  }
}
