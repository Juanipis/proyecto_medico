package com.medico.backend.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
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
  Double creatinine;

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
  @ManyToOne()
  @JoinColumn(name = "infectionlocation_id", referencedColumnName = "id")
  private InfectionLocation infectionLocation;

  @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL)
  private List<Results> results;
}
