package ntproject.service;

import ntproject.domain.Message;
import ntproject.domain.User;
import ntproject.domain.dto.CommentDto;
import ntproject.repos.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepo commentRepo;

    public List<CommentDto> commentList(Message message, User currentUser) {
        if (message.getComments() == null) {
            return null;
        }

        List<CommentDto> comments;
        if (currentUser != null) {
            comments = commentRepo.findTop(currentUser, message);
        } else {
            comments = commentRepo.findTopAll(message);
        }
        return comments;
    }

    public Page<CommentDto> messageCommentList(Pageable pageable, Message message, User currentUser) {
        return commentRepo.findByMessage(pageable, currentUser, message);
    }
}
