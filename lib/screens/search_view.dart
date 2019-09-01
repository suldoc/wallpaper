import 'package:flutter/material.dart';

class AlcoholDataSearch extends SearchDelegate<String> {
  final List<String> alcohols;
  List<String> filteredAlcohols = [];
  AlcoholDataSearch({this.alcohols});

   @override
   ThemeData appBarTheme(BuildContext context) {
     assert(context != null);
     final ThemeData theme = Theme.of(context).copyWith(
         hintColor: Theme.of(context).accentColor,
         primaryColor: Theme.of(context).primaryColor,
         textTheme: TextTheme(
           title: TextStyle(
               color: Theme.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 16),
         ));
     assert(theme != null);
     return theme;
   }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).accentColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == '') {
      return Container(
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              'Enter a wallpaper to search.',
              style: TextStyle(color: Theme.of(context).accentColor),
            )
          ],
        )),
      );
    } else {
      filteredAlcohols = [];
      getFilteredList(alcohols);
      if (filteredAlcohols.length == 0) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.sentiment_dissatisfied,
                  size: 50,
                  color: Theme.of(context).accentColor,
                ),
              ),
              Text(
                'No results found',
                style: TextStyle(color: Theme.of(context).accentColor),
              )
            ],
          )),
        );
      } else {
        return Container(
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            itemCount: filteredAlcohols.length == null
                ? 0
                : filteredAlcohols.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.wallpaper,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  filteredAlcohols[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  close(context, filteredAlcohols[index]);
                },
              );
            },
          ),
        );
      }
    }
  }

  List<String> getFilteredList(List<String> wallpaper) {
    for (int i = 0; i < wallpaper.length; i++) {
      if (wallpaper[i].toLowerCase().startsWith(query)) {
        filteredAlcohols.add(wallpaper[i]);
      }
    }
    return filteredAlcohols;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container(
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              'Enter a wallpaper to search.',
              style: TextStyle(color: Theme.of(context).accentColor),
            )
          ],
        )),
      );
    } else {
      filteredAlcohols = [];
      getFilteredList(alcohols);
      if (filteredAlcohols.length == 0) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.sentiment_dissatisfied,
                  size: 50,
                  color: Theme.of(context).accentColor,
                ),
              ),
              Text(
                'No results found',
                style: TextStyle(color: Theme.of(context).accentColor),
              )
            ],
          )),
        );
      } else {
        return Container(
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            itemCount: filteredAlcohols.length == null
                ? 0
                : filteredAlcohols.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.wallpaper,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  filteredAlcohols[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  close(context, filteredAlcohols[index]);
                },
              );
            },
          ),
        );
      }
    }
  }
}
