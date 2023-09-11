package com.medico.backend.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Patient")

public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private Long id;

    @Column
    @Getter
    @Setter
    Character sex;

    @Column
    @Getter
    @Setter
    double weight;

    @Column
    @Getter
    @Setter
    int age;

    @Column
    @Getter
    @Setter
    Boolean creatinine;

    @Column
    @Getter
    @Setter
    Boolean hemodialisis;

      @Column
    @Getter
    @Setter
    Boolean capd;

      @Column
    @Getter
    @Setter
    Boolean crrt;

    
    @Getter
    @Setter
    Long infection_location_id;

   @ManyToOne()
    @JoinColumn(name  = "infectionlocation_id")
    private InfectionLocation infectionLocation_id;
}
