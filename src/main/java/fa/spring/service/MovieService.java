package fa.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.spring.model.Movie;

public interface MovieService {
	Movie findByMovieId(String movieId);

    List<Movie> getMovieBySearchKey(String searchKey);
    
    Page<Movie> getAllMovieBySearchKey(String searchKey, Pageable pageable);
    
    boolean saveMovie(Movie movie);
    
    Optional<Movie> getMovieByMovieID(String movieID);
    
    void updateMovie(Movie movie);
    
    void deleteMovie(String movieID);
    
    // Get movie show index
    List<Movie> findByOrderByFromDateAsc();
    
  //check exits schedule in table movie_schedule
    Object findByScheduleId(int scheduleId, String movie_id);
    

}
