import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/dashboard/cubit/comic_cubit.dart';
import '../../../repository/comic_repository.dart';
import '../cubit/comic_list_state.dart';
import 'comic_card.dart';
import 'package:marvel_app/utils/navigation_paths.dart';

import 'package:provider/provider.dart';

class ComicListWidget extends StatelessWidget {
  ComicListWidget({Key? key}) : super(key: key);
  final _comicRepository = Modular.get<ComicRepository>();
  // final cubit  = Modular.get<ComicCubit>();

  @override
  Widget build(BuildContext context) {
    Modular.get<ComicCubit>().getComicList();
    return BlocProvider(
        create: (context) => Modular.get<ComicCubit>(), child: ComicList());
  }
}

class ComicList extends StatelessWidget {
  ComicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicCubit, ComicState>(
      builder: (context, state) {
        if (state is ComicListInitial) {
          return Container();
        } else if (state is ComicListLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ComicListError) {
          return Center(child: Text(state.message));
        } else if (state is ComicListLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: state.comic.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.all(6.0),
                  height: 150,
                  child: Material(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: InkWell(
                          onTap: _onItemClicked,
                          child: ComicCard(
                            comic: state.comic[index],
                          ))));
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _onItemClicked() {
    () => Modular.to.navigate(
        '${NavigationPaths.dashboardModulePath}${NavigationPaths.searchPagePath}');
  }
}
