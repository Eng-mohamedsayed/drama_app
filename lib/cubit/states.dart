

abstract class DramaStates {}

class DramaInitialStates extends DramaStates{}

// ********************* Get All Movies *******************//
class DramaGetMovieLoadingStates extends DramaStates {}

class DramaGetMovieSuccessStates extends DramaStates {}

class DramaGetMovieErrorStates extends DramaStates {}


// ********************* Get Now Playing Movies *******************//


class DramaGetMovieNowPlayingLoadingStates extends DramaStates {}

class DramaGetMovieMovieNowPlayingSuccessStates extends DramaStates {}

class DramaGetMovieMovieNowPlayingErrorStates extends DramaStates {}



// ********************* Get Movies By Genres *******************//

class DramaGetMovieByGenresLoadingStates extends DramaStates {}

class DramaGetMovieByGenresSuccessStates extends DramaStates {}

class DramaGetMovieByGenresErrorStates extends DramaStates {}


// ********************* Get All Genres *******************//


class DramaGetGenresLoadingStates extends DramaStates {}

class DramaGetGenresSuccessStates extends DramaStates {}

class DramaGetGenresErrorStates extends DramaStates {}



// ********************* Get All Persons *******************//

class DramaGetPersonsLoadingStates extends DramaStates {}

class DramaGetPersonsSuccessStates extends DramaStates {}

class DramaGetPersonsErrorStates extends DramaStates {}



// ********************* Get All Persons *******************//

class DramaGetTopRatedMovieLoadingStates extends DramaStates {}

class DramaGetTopRatedMovieSuccessStates extends DramaStates {}

class DramaGetTopRatedMovieErrorStates extends DramaStates {}



// ********************* Get Movie Details *******************//

class DramaGetMovieDetailsLoadingStates extends DramaStates {}

class DramaGetMovieDetailsSuccessStates extends DramaStates {}

class DramaGetMovieDetailsErrorStates extends DramaStates {}


// ********************* Get Movie Cast *******************//

class DramaGetMovieCastLoadingStates extends DramaStates {}

class DramaGetMovieCastSuccessStates extends DramaStates {}

class DramaGetMovieCastErrorStates extends DramaStates {}



// ********************* Get Similar Movie *******************//

class DramaGetSimilarMovieLoadingStates extends DramaStates {}

class DramaGetSimilarMovieSuccessStates extends DramaStates {}

class DramaGetSimilarMovieErrorStates extends DramaStates {}



// ********************* Get Videos *******************//

class DramaGetVideoLoadingStates extends DramaStates {}

class DramaGetVideoSuccessStates extends DramaStates {}

class DramaGetVideoErrorStates extends DramaStates {}
