package com.medico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.medico.backend.models.Bacterium;

@Repository
public interface IBacteriumRepository extends JpaRepository<Bacterium, Long> {

}
