package co.toyslove.service;

import java.util.List;

import co.toyslove.entity.Client;

public interface ClientService {

	Client findById(String id);

	Client saveClient(Client client);

	List<Client> findAll();

}
