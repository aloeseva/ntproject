package ntproject.domain;

import ntproject.domain.util.CommentHelper;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill the message")
    @Length(max = 2048, message = "Message too long (more than 2kB)")
    private String text;

    @Column(name = "post_date")
    private Date postDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "message_id")
    private Message message;

    @ManyToMany
    @JoinTable(
            name = "comment_likes",
            joinColumns = {@JoinColumn(name = "comment_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")}
    )
    private Set<User> likes = new HashSet<>();

    @ManyToMany
    @JoinTable(
            name = "comment_dislikes",
            joinColumns = {@JoinColumn(name = "comment_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")}
    )
    private Set<User> dislikes = new HashSet<>();

    public Comment() {
    }

    public Comment(String text, User user) {
        this.author = user;
        this.text = text;
    }

    public String getDate() {
        Date date = new Date();
        String res = "только что";

        if (postDate != null) {
            long time = (date.getTime() - postDate.getTime()) / 1000;

            if (time > 59) {
                long tmpTime = (time % 3600) / 60;
                long timeMod = tmpTime % 10;
                if (timeMod == 1) {
                    res = tmpTime + " минута назад";
                }
                if (timeMod > 1 && timeMod < 5) {
                    res = tmpTime + " минуты назад";
                }

                if (timeMod == 0 || timeMod >= 5) {
                    res = tmpTime + " минут назад";
                }

                tmpTime = (time % 86400) / 3600;
                if (tmpTime >= 1) {
                    if (tmpTime == 1) {
                        res = "час назад";
                    }

                    if (tmpTime == 2) {
                        res = "два часа назад";
                    }

                    if (tmpTime == 3) {
                        res = "три часа назад";
                    }

                    if (tmpTime == 4) {
                        res = "четыре часа назад";
                    }

                    if (tmpTime > 4) {
                        tmpTime = (time % 86400) / 900;
                        time = postDate.getTime() / 1000;
                        long hours = (time % 86400) / 3600;
                        long minutes = (time % 3600) / 60;

                        if (tmpTime < 24) {
                            if (minutes < 10) {
                                res = "сегодня в " + hours + ":0" + minutes;
                            } else {
                                res = "сегодня в " + hours + ":" + minutes;
                            }
                        }

                        if (tmpTime > 24 && tmpTime < 48) {
                            if (minutes < 10) {
                                res = "вчера в " + hours + ":0" + minutes;
                            } else {
                                res = "вчера в " + hours + ":" + minutes;
                            }
                        }

                        if (tmpTime > 48) {
                            String[] dateString =
                                    DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL)
                                            .withLocale(new Locale("ru"))
                                            .format(LocalDate.of(postDate.getYear(), postDate.getMonth(), postDate.getDay())).split(" ");
                            String day = dateString[0];
                            String month = dateString[1];
                            if (minutes < 10) {
                                res = day + " " + month + " в " + hours + ":0" + minutes;
                            } else {
                                res = day + " " + month + " в " + hours + ":" + minutes;
                            }
                        }
                    }
                }
            }
        } else {
            res = "n/a";
        }

        return res;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getAuthorName() {
        return CommentHelper.getAuthorName(author);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public Set<User> getLikes() {
        return likes;
    }

    public void setLikes(Set<User> likes) {
        this.likes = likes;
    }

    public Set<User> getDislikes() {
        return dislikes;
    }

    public void setDislikes(Set<User> dislikes) {
        this.dislikes = dislikes;
    }
}
