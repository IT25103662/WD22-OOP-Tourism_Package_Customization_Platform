package com.ceylontrails.controller;

import com.ceylontrails.model.PackageReview;
import com.ceylontrails.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class ReviewApiController {

    @Autowired
    private ReviewService service;

    @GetMapping
    public List<PackageReview> getAll() { return service.getAllReviews(); }

    @PostMapping
    public PackageReview add(@RequestBody PackageReview r) {
        service.saveReview(r); return r;
    }

    @PutMapping("/{id}")
    public void update(@PathVariable String id, @RequestBody PackageReview r) {
        service.updateReview(id, r);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) { service.deleteReview(id); }
}
