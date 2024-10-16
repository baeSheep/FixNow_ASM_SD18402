package com.fixnow.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fixnow.model.Booking;

import jakarta.transaction.Transactional;

public interface BookingDao extends JpaRepository<Booking, String>{
	List<Booking> findByBookingID(String bookingID);
	@Transactional
	@Modifying
	@Query("DELETE FROM Booking b WHERE b.bookingID = :bookingID AND b.user.userID = :userID")
	void deleteBookingByBookingIDAndUserID(@Param("bookingID") String bookingID, @Param("userID") Integer userID);

	List<Booking> findByUser_UserID(Integer userID);
	}
