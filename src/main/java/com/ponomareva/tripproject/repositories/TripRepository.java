package com.ponomareva.tripproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ponomareva.tripproject.models.Trip;

@Repository
public interface TripRepository extends CrudRepository<Trip, Long>{
	
	List<Trip> findAll();
	
	void deleteById(Long id);
	
	Trip save(Trip x);
	
	Optional<Trip> findById(Long id);
}
