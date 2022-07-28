import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/utils/strings.dart';
import '../comic_list/comic_list.dart';
import 'bloc/comic_search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Modular.get<ComicSearchBloc>(),
        child: const SearchScreen());
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: BlocListener<ComicSearchBloc, ComicSearchState>(
                  listener: (context, state) {
                    if (_query != queryController.text) {
                      queryController.text = _query;
                      queryController.selection =
                          TextSelection.collapsed(offset: _query.length);
                    }
                  },
                  child: TextField(
                    controller: queryController,
                    onChanged: (text) => _handleChangedQuery(text),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      hintText: StringResource.search_hint,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  primary: Colors.black),
              onPressed: () => _clearTitle(),
              child: const Text(StringResource.cancel),
            ),
          ],
        ),
        const Expanded(child: SearchComicListWidget()),
      ],
    );
  }

  void _clearTitle() {
    setState(() {
      queryController.text = StringResource.empty_string;
    });
  }

  void _handleChangedQuery(String query) {
    setState(() {
      _query = query;
    });
  }

  @override
  void initState() {
    super.initState();
    queryController.addListener(_changed);
  }

  @override
  void dispose() {
    queryController.removeListener(_changed);
    super.dispose();
  }

  _changed() {
    if (queryController.text.isNotEmpty) {
      ReadContext(context)
          .read<ComicSearchBloc>()
          .add(OnTitleChanged(queryController.text));
    }
  }
}

class SearchComicListWidget extends StatelessWidget {
  const SearchComicListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicSearchBloc, ComicSearchState>(
        builder: (context, state) {
      if (state is ComicSearchInitial) {
        return Center(
          child: SizedBox(
            height: 400,
            width: 300,
            child: Column(
              children: const [
                Text(
                  StringResource.search_page_initial_text,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
                Divider(
                  height: 30,
                ),
                Icon(Icons.book, size: 150)
              ],
            ),
          ),
        );
      } else if (state is ComicSearchLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ComicSearchLoaded) {
        if (state.comicList.isNotEmpty) {
          return ComicList(comics: state.comicList);
        } else {
          return const Center(
              child: Text(
            StringResource.no_results,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          ));
        }
      } else if (state is ComicSearchError) {
        return const Center(child: Text(StringResource.error_occured));
      } else {
        return Container();
      }
    });
  }
}
