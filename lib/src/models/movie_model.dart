

class Movies {

  List<Movie> items = new List();

  Movies();

  Movies.fromJsonList( List<dynamic> jsonList ){

    if ( jsonList == null ) return;

    for ( var item in jsonList ) {
      final movie = new Movie.fromJson(item);
      items.add( movie );
    }
  }
}

class Movie {
    String uniqueId;
    bool adult;
    String backdrop_path;
    List<int> genre_ids;
    int id;
    String original_language;
    String original_title;
    String overview;
    double popularity;
    String poster_path;
    String release_date;
    String title;
    bool video;
    double vote_average;
    int vote_count;

    Movie({
      this.adult,
      this.backdrop_path,
      this.genre_ids,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count
    });

    factory Movie.fromJson(Map<String, dynamic> json) {
        return Movie(
            adult             : json['adult'],
            backdrop_path     : json['backdrop_path'],
            genre_ids         : json['genre_ids'] != null ? new List<int>.from(json['genre_ids']) : null,
            id                : json['id'],
            original_language : json['original_language'],
            original_title    : json['original_title'],
            overview          : json['overview'],
            popularity        : json['popularity'] / 1,
            poster_path       : json['poster_path'],
            release_date      : json['release_date'],
            title             : json['title'],
            video             : json['video'],
            vote_average      : json['vote_average'] / 1,
            vote_count        : json['vote_count'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['adult']             = this.adult;
        data['backdrop_path']     = this.backdrop_path;
        data['id']                = this.id;
        data['original_language'] = this.original_language;
        data['original_title']    = this.original_title;
        data['overview']          = this.overview;
        data['popularity']        = this.popularity;
        data['poster_path']       = this.poster_path;
        data['release_date']      = this.release_date;
        data['title']             = this.title;
        data['video']             = this.video;
        data['vote_average']      = this.vote_average;
        data['vote_count']        = this.vote_count;
        if (this.genre_ids != null) {
            data['genre_ids']     = this.genre_ids;
        }
        return data;
    }

    getPosterImg(){

      final noAvalible = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png';

       if (poster_path == null) {
         return noAvalible;
       } else {
         return 'https://image.tmdb.org/t/p/w500/$poster_path';
       }
    } // getPosterImg

    getBackdropPath(){
      final noAvalible = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png';

      if (backdrop_path == null) {
        return noAvalible;
      } else {
        return 'https://image.tmdb.org/t/p/w500$backdrop_path';
      }

    } // getBackdropPath

}
