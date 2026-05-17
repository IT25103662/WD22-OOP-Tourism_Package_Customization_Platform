package com.ceylontrails.controller;

import com.ceylontrails.model.ServiceProvider;
import com.ceylontrails.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/providers")
public class ProviderApiController {

    @Autowired
    private ProviderService service;

    @GetMapping
    public List<ServiceProvider> getAll() { return service.getAllProviders(); }

    @PostMapping
    public ServiceProvider add(@RequestBody ServiceProvider p) {
        service.saveProvider(p); return p;
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) { service.deleteProvider(id); }

    @PutMapping("/{id}/status")
    public void updateStatus(@PathVariable String id, @RequestParam boolean status) {
        service.updateProviderStatus(id, status);
    }

    @PutMapping("/{id}")
    public void update(@PathVariable String id, @RequestBody ServiceProvider p) {
        service.updateProvider(id, p);
    }
}
