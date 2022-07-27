import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/dashboard/cubit/search_comic_list_state.dart';
import 'package:marvel_app/utils/navigation_paths.dart';

import '../../../repository/comic_repository.dart';
import '../cubit/comic_cubit.dart';
import '../home/comic_list.dart';
import '../home/comic_list_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Page')),
      body: const Center(child: SearchScreen()
          /*
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate(NavigationPaths.dashboardModulePath),
          child: Text('Navigate to home Page'),
        ),*/
          ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // SearchScreen({Key? key}) : super(key: key);

  TextEditingController queryController = TextEditingController();
  String _query = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: TextField(
                  controller: queryController,
                  onChanged: _handleChangedQuery,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black87, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    hintText: 'Search for a comic book',
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  primary: Colors.black),
              onPressed: () {},
              child: const Text('Cancel'),
            ),
          ],
        ),
        Expanded(child: ComicListScreen(widget:SearchComicListWidget(query: _query,))),
      ],
    );
  }

  void _handleChangedQuery(String query){
    setState(() {
      _query = query;
    });
    Modular.get<ComicCubit>().searchComics(query);
  }
}

class SearchComicListWidget extends StatelessWidget {
  SearchComicListWidget({Key? key, required String query}) : super(key: key);
  String query = "";

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<ComicCubit, ComicState>(builder: (context, state) {
          /*
          if (state is SearchComicListInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () =>
                    Modular.to.navigate(NavigationPaths.dashboardModulePath),
                child: Text('Navigate to home Page'),
              ),
            );
          } else if (state is SearchComicListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchComicListError) {
            return Center(child: Text(state.message));
          } else
          */ if (state is SearchComicListLoaded) {
            if (state.comicList != null) {
              return ComicList(comics: state.comicList);
            } else {
              return Center(child: Text("No results :(")); // TODO List is empty
            }
          } else {
            return Container(
               child: ElevatedButton(
                onPressed: () =>
                    Modular.to.navigate(NavigationPaths.dashboardModulePath),
                child: const Text('Navigate to home Page'),
              ),
            );
          }
        });
  }
}
