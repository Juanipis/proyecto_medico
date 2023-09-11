package com.medico.backend.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.medico.backend.models.Antibiotics;

public interface IAntibioticsDAO extends JpaRepository<Antibiotics, Long> {

}
