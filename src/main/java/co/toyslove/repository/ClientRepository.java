package co.toyslove.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import co.toyslove.entity.Client;

public interface ClientRepository extends JpaRepository<Client, String>{
	
	Optional<Client> findByDocumentAndPassword(String document,String password);
}
