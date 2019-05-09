package co.toyslove.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Client;
import co.toyslove.repository.ClientRepository;

@Service
public class ClientServicesImpl implements ClientService {

	@Autowired
	ClientRepository clientRepository;

	public Client findById(String id) {
		return clientRepository.findById(id).orElse(null);
	}
	
	public Client saveClient(Client client) {
		return clientRepository.save(client);
	}
	
	public List<Client> findAll() {
		return clientRepository.findAll();
	}
	
	public Client findByDocumentAndPassword(Client client) {
		return clientRepository.findByDocumentAndPassword(client.getDocument(),client.getPassword()).orElse(null);
	}

}
