package com.medico.backend.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.medico.backend.models.Patient;

public interface IPatientDAO extends JpaRepository<Patient, Long> {
    
}
