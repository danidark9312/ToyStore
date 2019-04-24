package co.toyslove.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import co.toyslove.entity.Client;

public interface ClientRepository extends JpaRepository<Client, String>{
	
}
