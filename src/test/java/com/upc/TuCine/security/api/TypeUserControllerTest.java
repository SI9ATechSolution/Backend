package com.upc.TuCine.security.api;

import com.upc.TuCine.security.api.TypeUserController;
import com.upc.TuCine.security.domain.service.TypeUserService;
import com.upc.TuCine.security.resource.TypeUserDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

public class TypeUserControllerTest {

    @InjectMocks
    private TypeUserController typeUserController;

    @Mock
    private TypeUserService typeUserService;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testGetAllTypeUsers() {
        // Mock data
        TypeUserDto user1 = new TypeUserDto();
        user1.setId(1);
        user1.setName("CINEPHILE");

        TypeUserDto user2 = new TypeUserDto();
        user2.setId(2);
        user2.setName("BUSINESS");

        List<TypeUserDto> typeUserList = Arrays.asList(user1, user2);

        // Mock the service to return the list
        when(typeUserService.getAllTypeUsers()).thenReturn(typeUserList);

        // Call the controller method
        ResponseEntity<List<TypeUserDto>> response = typeUserController.getAllTypeUsers();

        // Check the response
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(typeUserList, response.getBody());
    }
}
