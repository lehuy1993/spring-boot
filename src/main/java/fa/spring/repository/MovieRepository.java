package fa.spring.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fa.spring.model.Movie;

public interface MovieRepository extends JpaRepository<Movie, String> {

    @Query( nativeQuery = true, value ="SELECT * FROM Movie WHERE movie_name_english "
            + "LIKE %?1% OR movie_name_vn LIKE %?1% ORDER BY movie_name_english ASC, movie_name_vn ASC")
    List<Movie> findAllBySearchKey(String searchKey);
    // Get movie show index
    List<Movie> findByOrderByFromDateAsc();
    Movie findByMovieId(String movieId);

    Page<Movie> findByMovieNameEnglishContainingOrMovieNameVNContaining(String searchkey1,String searchKey2,Pageable pageable);
    
    //check exits schedule in table movie_schedule
    @Query(nativeQuery = true, value = "SELECT movie_id, schedule_id FROM movie_schedule WHERE schedule_id = ? AND movie_id <> ?")
    Object findByScheduleId(int scheduleId, String movie_id);
    

}
