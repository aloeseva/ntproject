package ntproject.domain.dto;

import ntproject.domain.Comment;
import ntproject.domain.Message;
import ntproject.domain.User;
import ntproject.domain.util.MessageHelper;

import java.util.Set;

public class MessageDto {
    private final Long id;
    private final String text;
    private final String tag;
    private final User author;
    private final Set<Comment> comments;
    private final Long likes;
    private final Boolean meLiked;
    private final Long dislikes;
    private final Boolean meDisliked;
    private final String date;

    public MessageDto(Message message, Long likes, Boolean meLiked, Long dislikes, Boolean meDisliked) {
        this.id = message.getId();
        this.text = message.getText();
        this.tag = message.getTag();
        this.author = message.getAuthor();
        this.comments = message.getComments();
        this.date = message.getDate();
        this.likes = likes;
        this.meLiked = meLiked;
        this.dislikes = dislikes;
        this.meDisliked = meDisliked;
    }

    public MessageDto(Message message, Long likes, Long dislikes) {
        this.id = message.getId();
        this.text = message.getText();
        this.tag = message.getTag();
        this.author = message.getAuthor();
        this.comments = message.getComments();
        this.date = message.getDate();
        this.likes = likes;
        this.meLiked = false;
        this.dislikes = dislikes;
        this.meDisliked = false;
    }

    public String getAuthorName() {
        return MessageHelper.getAuthorName(author);
    }

    public int getSize() {
        return comments.size();
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public String getTag() {
        return tag;
    }

    public User getAuthor() {
        return author;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public String getDate() {
        return date;
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
        return "MessageDto{" +
                "id=" + id +
                ", author=" + author +
                ", likes=" + likes +
                ", meLiked=" + meLiked +
                ", dislikes=" + dislikes +
                ", meDisliked=" + meDisliked +
                '}';
    }
}
