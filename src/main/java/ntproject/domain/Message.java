package ntproject.domain;

import ntproject.domain.util.MessageHelper;
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
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Пожалуйста заполните сообщение")
    @Length(max = 2048, message = "Сообщение слишком длинное (больше 2048 символов)")
    private String text;
    @Length(max = 255, message = "Сообщение слишком длинное (больше 255 символов)")
    private String tag;

    @Column(name = "post_date")
    private Date postDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ManyToMany
    @JoinTable(
            name = "message_likes",
            joinColumns = {@JoinColumn(name = "message_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")}
    )
    private Set<User> likes = new HashSet<>();

    @ManyToMany
    @JoinTable(
            name = "message_dislikes",
            joinColumns = {@JoinColumn(name = "message_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")}
    )
    private Set<User> dislikes = new HashSet<>();

    @OneToMany(mappedBy = "message", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private Set<Comment> comments;

    public Message() {
    }

    public Message(String text, String tag, User user) {
        this.author = user;
        this.text = text;
        this.tag = tag;
    }

    public String getAuthorName() {
        return MessageHelper.getAuthorName(author);
    }

    public String getDate() {
        Date date = new Date();
        String res = "только что";

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
            if (time >= 3600) {
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

                if (time > 18000) {
                    int yearDiff = date.getYear() - postDate.getYear();
                    int dayDiff = date.getDate() - postDate.getDate();
                    int monthDiff = date.getMonth() - postDate.getMonth();

                    tmpTime = time / 86400;
                    long hours = postDate.getHours();
                    long minutes = postDate.getMinutes();;

                    if (yearDiff == 0 && dayDiff == 0 && monthDiff == 0) {
                        if (minutes < 10) {
                            res = "сегодня в " + hours + ":0" + minutes;
                        } else {
                            res = "сегодня в " + hours + ":" + minutes;
                        }
                    }

                    if (yearDiff == 0 && dayDiff == 1 && monthDiff == 0) {
                        if (minutes < 10) {
                            res = "вчера в " + hours + ":0" + minutes;
                        } else {
                            res = "вчера в " + hours + ":" + minutes;
                        }
                    }

                    if (yearDiff == 0 && dayDiff > 1 && monthDiff == 0 || tmpTime > 2) {
                        String[] dateString =
                                DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL)
                                        .withLocale(new Locale("ru"))
                                        .format(LocalDate.of(1900 + postDate.getYear(), postDate.getMonth() + 1, postDate.getDate())).split(" ");
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

        return res;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
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

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

//    public String getFilename() {
//        return filename;
//    }

//    public void setFilename(String filename) {
//        this.filename = filename;
//    }

}
