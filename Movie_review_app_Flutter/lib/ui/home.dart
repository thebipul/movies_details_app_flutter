import '../model/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import '../util/hexcolor.dart';

import 'movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  MovieListView({Key? key}) : super(key: key);

  final List<Movie> movielist = Movie.getMovies();

  final List movies = [
    "Titanic",
    "Blade runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I am Legend",
    "300",
    "Thw Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Vikingggggs"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movielist.length,
          itemBuilder: (BuildContext context, int index){
            return Stack(
                children:<Widget>[
                  movieCard(movielist[index], context),
                  Positioned(
                      top: 10.0,
                      child: movieImage(movielist[index].images[0])),

                ]);
            // return Card(
            //   elevation:4.5,
            //   color:Colors.white,
            //   child:ListTile(
            //     leading:CircleAvatar(
            //       child:Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           // color:Colors.blue
            //           image: DecorationImage(
            //               image: NetworkImage(movielist[index].images[2]),
            //           fit:BoxFit.cover,
            //         ),),
            //         child:null,
            //       ),
            //     ),
            //     trailing:Text("..."),
            //     title: Text(movielist[index].title),
            //     subtitle: Text("${movielist[index].title}"),
            //     onTap: (){
            //       Navigator.push(context, MaterialPageRoute(
            //           builder: (context) => MovieListViewDetails(movieName:movielist[index].title,
            //           movie: movielist[index],)));
            //
            //     },
            //     // onTap: () => debugPrint("Movie name: ${movies[index]}"),
            //
            //   ),
            // );
          }),
    );
  }
  Widget movieCard(Movie movie, BuildContext context){
    return InkWell(
      child:Container(
        margin: EdgeInsets.only(left: 60.0),
        width:MediaQuery.of(context).size.width,
        height:120.0,
        child: Card(
          color:Colors.black45,
          child:Padding(
            padding: const EdgeInsets.only(top:8.0,
                bottom:8.0,
                left:54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:<Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(movie.title,style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color:Colors.white,
                          ),),
                        ),
                        Text("Rating: ${movie.imdbRating} / 10",
                          style: mainTextStyle(),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Released: ${movie.released}", style: mainTextStyle(),),
                        Text(movie.runtime,style: mainTextStyle(),),
                        Text(movie.rated, style: mainTextStyle(),),
                      ],
                    )

                  ]

              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MovieListViewDetails(movieName:movie.title,
              movie: movie,)))
      },
    );
  }
  TextStyle mainTextStyle(){
    return const TextStyle(
      fontSize: 15.0,
      color:Colors.grey,
    );
  }
  Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image:NetworkImage(imageUrl ),
            fit: BoxFit.cover
        ),
      ),
    );
  }

}

//New route
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetails({Key? key, required this.movieName, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Details"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          HorizontalLine(),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieExtraPosters(posters:movie.images,),

        ],
      ),
      // body:Center(
      //   child: Container(
      //     child: RaisedButton(
      //         child:Text("Go Back ${this.movie.director}"),
      //         onPressed:(){
      //           Navigator.pop(context);
      //
      //         }),
      //   ),
      // )
    );
  }
}

