package com.rishu.socialshare.payload.request;

import jakarta.validation.constraints.NotBlank;

public class VideoRequest {

    @NotBlank
    private String videoUrl;

    @NotBlank
    private String videoToken;


    @NotBlank
    private String thumbnailUrl;

    @NotBlank
    private String thumbnailToken;


    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getVideoToken() {
        return videoToken;
    }

    public void setVideoToken(String videoToken) {
        this.videoToken = videoToken;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getThumbnailToken() {
        return thumbnailToken;
    }

    public void setThumbnailToken(String thumbnailToken) {
        this.thumbnailToken = thumbnailToken;
    }

}
