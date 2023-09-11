package com.medico.backend.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.medico.backend.models.Results;

public interface IResultsDAO extends JpaRepository<Results, Long> {

}
