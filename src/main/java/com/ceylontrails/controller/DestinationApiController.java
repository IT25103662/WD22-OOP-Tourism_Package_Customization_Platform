package com.ceylontrails.controller;

import com.ceylontrails.model.Destination;
import com.ceylontrails.service.DestinationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/destinations")
public class DestinationApiController {

    @Autowired
    private DestinationService service;

    @GetMapping
    public List<Destination> getAll() { return service.getAllDestinations(); }

    @PostMapping
    public Destination add(@RequestBody Destination dest) {
        service.saveDestination(dest); return dest;
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) { service.deleteDestination(id); }

    @PutMapping("/{id}")
    public void update(@PathVariable String id, @RequestBody Destination dest) {
        service.updateDestination(id, dest);
    }
}
