package co.toyslove.service;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import static org.mockito.Mockito.when;

import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.*;

import co.toyslove.entity.Client;
import co.toyslove.repository.ClientRepository;

@RunWith(MockitoJUnitRunner.class)
public class ClientServicesTest {
	
	
	ClientService clientService;
	
	@Mock
	ClientRepository repository;
	
	@Before
	public void setup() {
		this.clientService  = new ClientServicesImpl();
	}
	
	@Test
	public void getClientByIdTestMustReturnOK() {
		when(repository.findById(any(String.class))).thenReturn(Optional.of(getClientTest()));
		Optional<Client> findById = repository.findById("1037626409");
		assertEquals(findById.get().getDocument(), "1037626409");
		
	}

	private Client getClientTest() {
		Client client = new Client();
		client.setDocument("1037626409");
		client.setName("Daniel");
		client.setLastName("Gutierre");
		client.setAddress("Cr46AA #45Csur 12");
		client.setAddressAppend("Apto 201");
		client.setPhone("3016637232");
		return client;
	}

}
