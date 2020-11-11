

class Cast {
  List<Actor> actors = new List();
  Cast();
  Cast.fromJsonList( List<dynamic> jsonList ){
    if ( jsonList == null ) return;
    jsonList.forEach( (item) => actors.add( Actor.fromJson( item ) ) );
  }
}


class Actor {
  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
    castId      : json["cast_id"],
    character   : json["character"],
    creditId    : json["credit_id"],
    gender      : json["gender"],
    id          : json["id"],
    name        : json["name"],
    order       : json["order"],
    profilePath : json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "cast_id"     : castId,
    "character"   : character,
    "credit_id"   : creditId,
    "gender"      : gender,
    "id"          : id,
    "name"        : name,
    "order"       : order,
    "profile_path": profilePath,
  };



  getPhoto(){

    final noAvalible = 'https://bizraise.pro/wp-content/uploads/2014/09/no-avatar-300x300.png';

    if (profilePath == null) {
      return noAvalible;
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  } // getPosterImg


}

