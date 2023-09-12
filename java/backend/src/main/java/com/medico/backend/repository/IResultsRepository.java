package com.medico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.medico.backend.models.Results;

@Repository
public interface IResultsRepository extends JpaRepository<Results, Long> {

}
