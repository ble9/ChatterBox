import 'package:ChatterBox/model/featuredmoviemodel.dart';
import 'package:ChatterBox/model/genremodel.dart';
import 'package:ChatterBox/services/api.dart';
import 'package:ChatterBox/widgets/homepagefeaturedwidget.dart';
import 'package:ChatterBox/widgets/movie_container.dart';
import 'package:ChatterBox/widgets/section_container.dart';
import 'package:flutter/material.dart';


class NetflixScreen extends StatefulWidget {
  static const routeName = '/MShomeScreen';

  @override
  _NetflixScreenState createState() => _NetflixScreenState();
}

class _NetflixScreenState extends State<NetflixScreen> {
  Future<List<FeaturedMovieModel>> featuredMovies;
  Future<List<GenreModel>> genreList;
  Api _api;
  @override
  void initState() {
    super.initState();
    _api = Api();
    featuredMovies = _api.getFeaturedMovies();
    genreList = _api.getGenreList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, .2),
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.black), onPressed: () {})
          ],
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black), onPressed: () {}),
          title: Text(
            "Netflix",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: FutureBuilder<List<FeaturedMovieModel>>(
                  future: featuredMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return HomePageFeaturedWidget(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0),
                height: 61,
                child: FutureBuilder<List<GenreModel>>(
                  future: genreList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, id) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color.fromRGBO(143, 148, 251, 1),
                              boxShadow: [
                                BoxShadow(
                                  color:  Color.fromRGBO(143, 148, 251, .6),
                                  blurRadius: 2.5,
                                )
                              ],
                            ),
                            // width: MediaQuery.of(context).size.width / 2.5,
                            constraints: BoxConstraints(minWidth: 150),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 5.0,
                            ),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              "${snapshot.data[id].name}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.white),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SectionContainer(
                sectionTitle: "My List",
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: FutureBuilder<List<FeaturedMovieModel>>(
                    future: featuredMovies,
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, id) {
                            return MovieContainer(snapshot: snapshot.data[id]);
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SectionContainer(
                sectionTitle: "Popular on Netflix",
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: FutureBuilder<List<FeaturedMovieModel>>(
                    future: featuredMovies,
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, id) {
                            return MovieContainer(snapshot: snapshot.data[id]);
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
