package ntproject.domain.dto;

import ntproject.domain.Comment;
import ntproject.domain.Message;
import ntproject.domain.User;
import ntproject.domain.util.CommentHelper;

public class CommentDto {
    private Long id;
    private String text;
    private User author;
    private Message message;
    private Long likes;
    private Boolean meLiked;
    private Long dislikes;
    private Boolean meDisliked;


    public CommentDto(Comment comment, Long likes, Boolean meLiked, Long dislikes, Boolean meDisliked) {
        this.id = comment.getId();
        this.text = comment.getText();
        this.author = comment.getAuthor();
        this.message = comment.getMessage();
        this.likes = likes;
        this.meLiked = meLiked;
        this.dislikes = dislikes;
        this.meDisliked = meDisliked;
    }

    public CommentDto(Comment comment, Long likes, Long dislikes) {
        this.id = comment.getId();
        this.text = comment.getText();
        this.author = comment.getAuthor();
        this.message = comment.getMessage();
        this.likes = likes;
        this.meLiked = false;
        this.dislikes = dislikes;
        this.meDisliked = false;
    }

    public String getAuthorName() {
        return CommentHelper.getAuthorName(author);
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public User getAuthor() {
        return author;
    }

    public Message getMessage() {
        return message;
    }

    public Long getLikes() {
        return likes;
    }

    public Boolean getMeLiked() {
        return meLiked;
    }

    public Long getDislikes() {
        return dislikes;
    }

    public Boolean getMeDisliked() {
        return meDisliked;
    }

    @Override
    public String toString() {
        return "CommentDto{" +
                "id=" + id +
                ", author=" + author +
                ", likes=" + likes +
                ", meLiked=" + meLiked +
                ", dislikes=" + dislikes +
                ", meDisliked=" + meDisliked +
                '}';
    }
}
