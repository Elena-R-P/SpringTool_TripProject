package com.ponomareva.tripproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ponomareva.tripproject.models.Trip;
import com.ponomareva.tripproject.repositories.TripRepository;

@Service
public class TripService {
	private final TripRepository tripRepository;
	public TripService(TripRepository tripRepository) {
		this.tripRepository = tripRepository;
	}
	
	public Trip findTripById(Long id) {
    	Optional<Trip> trip = tripRepository.findById(id);
    	
    	if(trip.isPresent()) {
            return trip.get();
    	} else {
    	    return null;
    	}
    }
	public List<Trip> findAllTrips(){
		return tripRepository.findAll();
	}
	public void deleteTrip(Long id) {
		tripRepository.deleteById(id);
	}
	public Trip saveTrip(Trip t) {
		return tripRepository.save(t);
	}
	
}
