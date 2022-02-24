import 'package:drama/cubit/cubits.dart';
import 'package:drama/cubit/states.dart';
import 'package:drama/shared/styles/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonList extends StatelessWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaCubits, DramaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DramaCubits.get(context);
        if (cubit.allMoviePerson != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text('TRENDING PERSON ON THIS WEAK',
                    style: TextStyle(
                        color: DefaultColors.titleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 130,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.lengthOfPersons,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        padding: const EdgeInsets.only(right: 8, top: 10),
                        child: Column(
                          children: [
                            cubit.allMoviePerson!.results![index].profilePath ==
                                    null
                                ? Container(
                                    width: 70,
                                    height: 70,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: DefaultColors.secondColor),
                                    child: const Icon(
                                      FontAwesomeIcons.userAlt,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w200/${cubit.allMoviePerson!.results![index].profilePath.toString()}',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cubit.allMoviePerson!.results![index].name
                                  .toString(),
                              maxLines: 2,
                              style: const TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Trending for ' +
                                  cubit.allMoviePerson!.results![index]
                                      .knownForDepartment
                                      .toString(),
                              style: const TextStyle(
                                  color: DefaultColors.titleColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 7),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        } else {
          return Center(child: Container());
        }
      },
    );
  }
}
