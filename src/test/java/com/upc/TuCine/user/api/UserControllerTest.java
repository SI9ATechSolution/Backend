package com.upc.TuCine.user.api; // Agrega la declaración de paquete

import com.upc.TuCine.security.domain.service.communication.RegisterRequest;
import com.upc.TuCine.user.domain.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

class UserControllerTest {

    @InjectMocks
    private UserController userController;

    @Mock
    private UserService userService;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);
    }

    @SuppressWarnings("unchecked")
    @Test
    public void testRegisterUser() {
        // Mock data
        RegisterRequest request = new RegisterRequest();
        request.setEmail("medrano182903@gmail.com");
        request.setPassword("123456789");

        // Mock the service to return a response entity
        ResponseEntity<?> expectedResponse = ResponseEntity.ok().build();
        when(userService.register(request)).thenReturn(expectedResponse);

        // Call the controller method
        ResponseEntity<?> response = userController.registerUser(request);

        // Check the response
        assertEquals(HttpStatus.OK, response.getStatusCode());
    }

}
