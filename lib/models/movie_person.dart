class MoviePerson {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MoviePerson({this.page, this.results, this.totalPages, this.totalResults});

  MoviePerson.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Results {
  int? id;
  int? gender;
  String? knownForDepartment;
  List<KnownFor>? knownFor;
  String? profilePath;
  String? name;
  bool? adult;
  double? popularity;
  String? mediaType;

  Results(
      {this.id,
      this.gender,
      this.knownForDepartment,
      this.knownFor,
      this.profilePath,
      this.name,
      this.adult,
      this.popularity,
      this.mediaType});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(KnownFor.fromJson(v));
      });
    }
    profilePath = json['profile_path'];
    name = json['name'];
    adult = json['adult'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }
}

class KnownFor {
  bool? video;
  double? voteAverage;
  double? popularity;
  String? overview;
  String? releaseDate;
  double? id;
  bool? adult;
  String? backdropPath;
  String? mediaType;
  List<int>? genreIds;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  double? voteCount;
  String? originalName;
  String? name;
  String? firstAirDate;

  KnownFor(
      {this.video,
      this.voteAverage,
      this.popularity,
      this.overview,
      this.releaseDate,
      this.id,
      this.adult,
      this.backdropPath,
      this.mediaType,
      this.genreIds,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.voteCount,
      this.originalName,
    
      this.name,
      this.firstAirDate});

  KnownFor.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    voteAverage = json['vote_average'];
    popularity = json['popularity'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    id = double.parse(json['id'].toString());
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteCount = double.parse(json['vote_count'].toString());
    originalName = json['original_name'];
    name = json['name'];
    firstAirDate = json['first_air_date'];
  }
}
