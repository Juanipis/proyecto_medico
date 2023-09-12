package com.medico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.medico.backend.models.Antibiotic;

public interface IAntibioticRepository extends JpaRepository<Antibiotic, Long> {

}
