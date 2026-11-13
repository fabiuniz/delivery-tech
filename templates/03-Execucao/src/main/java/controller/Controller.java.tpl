package $PACKAGE_BASE.controller;

import $PACKAGE_BASE.model.$MAIN_ENTITY;
import $PACKAGE_BASE.service.${MAIN_ENTITY}Service;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/$ENDPOINT_NAME")
public class ${MAIN_ENTITY}Controller {

    private final ${MAIN_ENTITY}Service service;

    public ${MAIN_ENTITY}Controller(${MAIN_ENTITY}Service service) {
        this.service = service;
    }

    @PostMapping
    public ResponseEntity<$MAIN_ENTITY> criar(@RequestBody $MAIN_ENTITY item) {
        return ResponseEntity.status(201).body(service.criar(item));
    }

    @GetMapping
    public ResponseEntity<List<$MAIN_ENTITY>> listar() {
        return ResponseEntity.ok(service.listar());
    }
}