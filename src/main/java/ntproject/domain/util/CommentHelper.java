package ntproject.domain.util;


import ntproject.domain.User;

public abstract class CommentHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}
