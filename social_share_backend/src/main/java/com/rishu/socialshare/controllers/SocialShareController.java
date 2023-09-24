package com.rishu.socialshare.controllers;

import com.rishu.socialshare.models.Video;
import com.rishu.socialshare.payload.request.VideoRequest;
import com.rishu.socialshare.repository.VideoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Validated
public class SocialShareController {


    @Autowired
    VideoRepository videoRepository;

    @GetMapping("/")
    public String home() {
        return "Welcome to Social Share";
    }

    @GetMapping("/videos")
    public List<Video> getAllVideos() {
        return videoRepository.findAll();
    }

    @PostMapping("/videos")
    public Video createVideo(@RequestBody VideoRequest videoRequest) {
        return videoRepository.save(new Video(videoRequest.getVideoUrl(), videoRequest.getVideoToken(),
                videoRequest.getThumbnailUrl(), videoRequest.getThumbnailToken()));
    }

    @DeleteMapping("/videos")
    public String deleteAllVideos() {
        videoRepository.deleteAll();
        return "Deleted all videos";
    }

}
