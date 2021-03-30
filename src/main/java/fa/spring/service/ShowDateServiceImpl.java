package fa.spring.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.ShowDate;
import fa.spring.repository.ShowDateRepository;

@Service
public class ShowDateServiceImpl  implements ShowDateService{

	@Autowired
	private ShowDateRepository showDateRepository;
	
	@Override
	public List<ShowDate> getAll(LocalDate dateCurrent) {
		// TODO Auto-generated method stub
		return  showDateRepository.getAll(dateCurrent);
	}
	@Override
	public ShowDate findByShowDateId(int id) {
		// TODO Auto-generated method stub
		return showDateRepository.getOne(id);
	}
	@Override
	public void save(ShowDate showDate) {
		// TODO Auto-generated method stub
		 showDateRepository.save(showDate);
	}
	@Override
	public ShowDate findByShowDate(Date showDate) {
		// TODO Auto-generated method stub
		return showDateRepository.findByShowDate(showDate);
	}

}
