package com.rishu.socialshare.models;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "videos")
public class Video {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String videoUrl;

    @NotBlank
    private String videoToken;

    @NotBlank
    private String thumbnailUrl;

    @NotBlank
    private String thumbnailToken;

    public Video() {

    }

    public Video(String videoUrl, String videoToken,
                 String thumbnailUrl, String thumbnailToken) {
        this.videoUrl = videoUrl;
        this.videoToken = videoToken;
        this.thumbnailUrl = thumbnailUrl;
        this.thumbnailToken = thumbnailToken;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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
