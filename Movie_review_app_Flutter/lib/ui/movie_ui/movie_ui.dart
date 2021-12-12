import '../../model/movie.dart';
import 'package:flutter/material.dart';
class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key? key, required this.thumbnail}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            const Icon(Icons.play_circle_outline,size:100,
                color:Colors.white),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors:[Color(0x00f5f5f5),Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 80,
        ),

      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster:movie.images[0].toString()),
          const SizedBox(width: 16,),
          Expanded(
            child: MovieDetailsHeader(movie:movie),
          )
        ],
      ),
    );
  }
}




class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            image:DecorationImage(image:NetworkImage(poster),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${movie.year}.${movie.genre}".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.cyan,
          ),),
        Text(movie.title,style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 32,
        ),),
        Text.rich(TextSpan(style:TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
            children: <TextSpan>[
              TextSpan(
                  text: movie.plot,
                  style:TextStyle(
                    fontSize: 15,
                  )
              ),
              TextSpan(
                  text:"More...",
                  style: TextStyle(
                    color: Colors.indigo,

                  )
              ),
            ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Column(
        children: <Widget>[
          MovieField(field:"Cast",value:movie.actors),
          MovieField(field:"Directors",value: movie.director),
          MovieField(field: "Awards", value: movie.awards),
          MovieField(field: "Language", value: movie.language),
          MovieField(field: "Country",value:movie.country),
          MovieField(field: "ImdbRating", value: movie.imdbRating),
        ],
      ),
    );
  }
}
class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field: ",style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),),
        Expanded(
          child: Text(value,style: TextStyle(
            color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300,
          ),),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      child: Container(
        height: 0.5,
        color: Colors.black,

      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieExtraPosters({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text("More Movie Posters".toUpperCase(),
            style: TextStyle(
              fontSize: 14,color:Colors.black,fontWeight: FontWeight.w400,
            ),),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index) => SizedBox(width: 8,),
            itemCount: posters.length,
            itemBuilder:(context,index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width /4 ,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(image:NetworkImage(posters[index]),
                        fit: BoxFit.cover)
                ),
              ),
            ) ,
          ),),
      ],
    );
  }
}