package com.medico.backend.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.medico.backend.models.InfectionLocation;

public interface IInfectionLocationDAO extends JpaRepository<InfectionLocation, Long>{
    
}
