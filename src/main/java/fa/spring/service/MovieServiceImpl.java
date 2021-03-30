package fa.spring.service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fa.spring.model.Movie;
import fa.spring.model.Schedule;
import fa.spring.model.ScheduleSeat;
import fa.spring.model.Seat;
import fa.spring.model.ShowDate;
import fa.spring.repository.MovieRepository;

@Service
public class MovieServiceImpl implements MovieService {

	
	private static final Logger log = LoggerFactory.getLogger(MovieServiceImpl.class);

    @Autowired
    private MovieRepository movieRepository;
    
    @Autowired
    private MovieService movieService;
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private SeatService seatService;
    @Autowired
    private ScheduleSeatService scheduleSeatService;
    @Autowired
    private ShowDateService showDateService;

    @Override
    public List<Movie> getMovieBySearchKey(String searchKey) {
        return movieRepository.findAllBySearchKey(searchKey);
    }
    
    @Override
	public Movie findByMovieId(String movieId) {
		// TODO Auto-generated method stub
		return movieRepository.findByMovieId(movieId);
    }
    
    @Override
    @Transactional
	public Page<Movie> getAllMovieBySearchKey(String searchKey, Pageable pageable) {
		if(searchKey != null)
			return movieRepository.findByMovieNameEnglishContainingOrMovieNameVNContaining(searchKey,searchKey, pageable);
		return movieRepository.findAll(pageable);
	}

	@Override
    @Transactional
	public boolean saveMovie(Movie movie) {
		String uniqueID;
		do {
			uniqueID = UUID.randomUUID().toString().replace("-", "").substring(0, 10);
			System.out.println("Result: " +movieRepository.existsById(uniqueID));
		} while (movieRepository.existsById(uniqueID));
		movie.setMovieId(uniqueID);
		// save movie_date
		long getDiff = (movie.getToDate().getTime() - movie.getFromDate().getTime());
		long getDaysDiff = getDiff / (24 * 60 * 60 * 1000);
		 Set<ShowDate> showDates = new HashSet<ShowDate>();
		for(int i = 0; i <= getDaysDiff; i++) {
			 ShowDate showDate = new ShowDate();
			
			 Date dt = movie.getFromDate();
			 Calendar c = Calendar.getInstance(); 
			 c.setTime(dt); 
			 c.add(Calendar.DATE, i);
			 dt = c.getTime();
			 ShowDate listDate = showDateService.findByShowDate(dt);
			 if (listDate != null) {
				 showDates.add(listDate);
				 movie.setShowDates(showDates);
			}else {
				movie.setShowDates(showDates);
				 showDate.setShowDate(dt);
				 String dayName = getDayName(dt.getDay());
				 showDate.setDateName(dayName);
				 showDates.add(showDate);
				 showDateService.save(showDate);
			}
		}
		// insert schedule_seat
		for (ShowDate showDate : showDates) {
			int showDateId = showDate.getShowDateId();
			Set<Schedule> schedules = movie.getSchedules();
			int cinemaRoomId = movie.getCinemaRoomId();
			List<Seat> seats = seatService.findByCinemaRoom(cinemaRoomId);
			for (Schedule schedule : schedules) {
				for (Seat seat : seats) {
					ScheduleSeat scheduleSeat = new ScheduleSeat();
					scheduleSeat.setSeatId(seat.getSeatId());
					scheduleSeat.setSeatRow(seat.getSeatRow());
					scheduleSeat.setSeatType(seat.getSeatType());
					scheduleSeat.setSeatColumn(seat.getSeatColumn());
					scheduleSeat.setScheduleId(schedule.getScheduleId());
					scheduleSeat.setMovieId(movie.getMovieId());
					scheduleSeat.setShowDateId(showDateId);
					scheduleSeat.setSeatStatus(1);
					log.debug("message" + scheduleSeat);
					scheduleSeatService.save(scheduleSeat);
				}
			}
		}

		//movie
		movie = movieRepository.save(movie);
		Set<Schedule> schedules = movieService.findByMovieId(uniqueID).getSchedules();
		schedules.forEach((item)->{
			item.setStatus(0);
			scheduleService.save(item);
			
		});
	return movie.getMovieId()!=null;
	}

	@Override
    @Transactional
	public Optional<Movie> getMovieByMovieID(String movieID) {
		return movieRepository.findById(movieID);
	}

	@Override
    @Transactional
	public void updateMovie(Movie movie) {
		// save movie_date
		long getDiff = (movie.getToDate().getTime() - movie.getFromDate().getTime());
		long getDaysDiff = getDiff / (24 * 60 * 60 * 1000);
		 Set<ShowDate> showDates = new HashSet<ShowDate>();
		for(int i = 0; i <= getDaysDiff; i++) {
			 ShowDate showDate = new ShowDate();
			 Date dt = movie.getFromDate();
			 Calendar c = Calendar.getInstance(); 
			 c.setTime(dt); 
			 c.add(Calendar.DATE, i);
			 dt = c.getTime();
			 ShowDate listDate = showDateService.findByShowDate(dt);
			 if (listDate != null) {
				 showDates.add(listDate);
				 movie.setShowDates(showDates);
			}else {
				movie.setShowDates(showDates);
				 showDate.setShowDate(dt);
				 String dayName = getDayName(dt.getDay());
				 showDate.setDateName(dayName);
				 showDates.add(showDate);
				 showDateService.save(showDate);
			}
		}
		// insert schedule_seat
				scheduleSeatService.deleteByMovieId(movie.getMovieId());
				for (ShowDate showDate : showDates) {
					int showDateId = showDate.getShowDateId();
					Set<Schedule> schedules = movie.getSchedules();
					int cinemaRoomId = movie.getCinemaRoomId();
					List<Seat> seats = seatService.findByCinemaRoom(cinemaRoomId);
					for (Schedule schedule : schedules) {
						for (Seat seat : seats) {
							ScheduleSeat scheduleSeat = new ScheduleSeat();
							scheduleSeat.setSeatId(seat.getSeatId());
							scheduleSeat.setSeatRow(seat.getSeatRow());
							scheduleSeat.setSeatType(seat.getSeatType());
							scheduleSeat.setSeatColumn(seat.getSeatColumn());
							scheduleSeat.setScheduleId(schedule.getScheduleId());
							scheduleSeat.setMovieId(movie.getMovieId());
							scheduleSeat.setShowDateId(showDateId);
							scheduleSeat.setSeatStatus(1);
							log.debug("message" + scheduleSeat);
							scheduleSeatService.save(scheduleSeat);
						}
					}
				}
		movieRepository.save(movie);

		// check exits scheduleId in table movie_schedule
		  String movieId = movie.getMovieId();
		  Set<Schedule> schedules = movieService.findByMovieId(movieId).getSchedules();
		  schedules.forEach((item)->{
		  item.setStatus(0); scheduleService.save(item);
		  });
	
	}

	@Override
	public void deleteMovie(String movieID) {
		Set<Schedule> schedules = movieService.findByMovieId(movieID).getSchedules();
		schedules.forEach((item)->{
			item.setStatus(1);
			scheduleService.save(item);
			
		});
		movieRepository.deleteById(movieID);
		
	}
	
	@SuppressWarnings("unused")
	private static String getDayName(int dayofWeek) {

		String dayName = null;
		switch (dayofWeek) {
		case 0:
			dayName = "Sun";
			break;
		case 1:
			dayName = "Mon";
			break;
		case 2:
			dayName = "Tue";
			break;
		case 3:
			dayName = "Wed";
			break;
		case 4:
			dayName = "Thu";
			break;
		case 5:
			dayName = "Fri";
			break;
		case 6:
			dayName = "Sat";
			break;
		}
		return dayName;
	}

	@Override
	public  List<Movie> findByOrderByFromDateAsc(){
		// TODO Auto-generated method stub
		return movieRepository.findByOrderByFromDateAsc();
	}

	@Override
	public  Object findByScheduleId(int scheduleId, String movie_id) {
		// TODO Auto-generated method stub
		return movieRepository.findByScheduleId(scheduleId, movie_id);
	}


}
