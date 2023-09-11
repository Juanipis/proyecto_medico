package com.medico.backend.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.medico.backend.models.Bacterium;

public interface IBacteriumDAO extends JpaRepository<Bacterium, Long> {

}
