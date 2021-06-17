package ntproject.controller;


import ntproject.domain.Comment;
import ntproject.domain.Message;
import ntproject.domain.User;
import ntproject.domain.dto.CommentDto;
import ntproject.domain.dto.MessageComment;
import ntproject.domain.dto.MessageDto;
import ntproject.repos.CommentRepo;
import ntproject.repos.MessageRepo;
import ntproject.service.CommentService;
import ntproject.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.io.IOException;
import java.util.*;

@Controller
public class MessageController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private MessageService messageService;

    @Autowired
    private CommentRepo commentRepo;

    @Autowired
    private CommentService commentService;

    @GetMapping("/")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
            @AuthenticationPrincipal User user
    ) {
        Page<MessageDto> page = messageService.friendsMessageList(pageable, user, filter);
        boolean isPage = page != null;
        List<MessageComment> comments = new ArrayList<>();

        if (isPage) {

            for (MessageDto m :
                    page.getContent()) {
                comments(user, comments, m);
            }
        }

        model.addAttribute("comments", comments);
        model.addAttribute("page", page);
        model.addAttribute("isPage", isPage);
        model.addAttribute("url", "/");
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam(required = false, defaultValue = "") String filter,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) throws IOException {
        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            model.addAttribute("message", null);
            Date date = new Date();
            message.setPostDate(date);
            messageRepo.save(message);
        }

        Page<MessageDto> page = messageService.friendsMessageList(pageable, user, filter);
        boolean isPage = page != null;
        List<MessageComment> comments = new ArrayList<>();

        if (isPage) {

            for (MessageDto m :
                    page.getContent()) {
                comments(user, comments, m);
            }
        }

        model.addAttribute("comments", comments);
        model.addAttribute("isPage", true);
        model.addAttribute("page", page);

        return "main";
    }

    private void comments(@AuthenticationPrincipal User user, List<MessageComment> comments, MessageDto m) {
        Long id = m.getId();
        List<CommentDto> commentList;
        MessageComment comment = new MessageComment();
        int size;

        commentList = commentService.commentList(messageService.findById(id), user);

        if (commentList == null) {
            size = 0;
        } else {
            size = commentList.size();
        }
        if (size != 0) {
            comment.setSize(size);
            comment.setComments(size > 3 ? commentList.subList(0, 3) : commentList);
            comment.setId(id);
            comment.setExist(true);
        } else {
            comment.setId(id);
            comment.setExist(false);
        }
        comments.add(comment);
    }

    @PostMapping("/messages/{message}/comment")
    public String addComment(
            @AuthenticationPrincipal User user,
            @Valid Comment comment,
            BindingResult bindingResult,
            @PathVariable Message message,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) throws IOException {
        comment.setAuthor(user);
        comment.setMessage(message);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("comment", comment);
        } else {
            model.addAttribute("comment", null);
            commentRepo.save(comment);
        }

        Page<CommentDto> page = commentService.messageCommentList(pageable, message, user);

        model.addAttribute("isPage", true);
        model.addAttribute("page", page);
        model.addAttribute("message", messageRepo.findByMessage(user, message));

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .forEach(redirectAttributes::addAttribute);

        return "redirect:" + components.getPath();
    }

    @GetMapping("/messages/{message}/comment")
    public String commentPage(
            @AuthenticationPrincipal User user,
            @PathVariable Message message,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<CommentDto> page = commentService.messageCommentList(pageable, message, user);
        boolean isPage = page != null;

        model.addAttribute("isPage", isPage);
        model.addAttribute("message", messageRepo.findByMessage(user, message));
        model.addAttribute("page", page);
        model.addAttribute("url", "/messages/" + message.getId() + "/comment");

        return "comment";
    }

    @GetMapping("/top")
    public String top(
            Model model,
            @AuthenticationPrincipal User user
    ) {
        List<MessageDto> messages = messageService.topMessagesList(user);
        boolean isPage = messages != null;
        List<MessageComment> comments = new ArrayList<>();

        if (isPage) {
            for (MessageDto m :
                    messages) {
                comments(user, comments, m);
            }
        }

        model.addAttribute("comments", comments);
        model.addAttribute("messages", messages);
        model.addAttribute("isPage", isPage);
        return "top";
    }

    @GetMapping("/user-messages/{author}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @RequestParam(required = false, defaultValue = "") String filter,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<MessageDto> page = messageService.messageListForUser(pageable, currentUser, author, filter);
        boolean isPage = page != null;
        List<MessageComment> comments = new ArrayList<>();

        if (isPage) {
            for (MessageDto m :
                    page.getContent()) {
                comments(currentUser, comments, m);
            }
        }

        model.addAttribute("comments", comments);
        model.addAttribute("userChannel", author);
        model.addAttribute("isPage", true);
        model.addAttribute("subscriptionsCount", author.getSubscriptions().size());
        model.addAttribute("subscribersCount", author.getSubscribers().size());
        model.addAttribute("isSubscriber", author.getSubscribers().contains(currentUser));
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url", "/user-messages/" + author.getId());

        return "userMessages";
    }

    @GetMapping("/messages/delete/{user}/{message}")
    public String deleteMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {

        if (message.getAuthor().equals(currentUser) || currentUser.isAdmin()) {
            messageService.deleteMessage(message);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .forEach(redirectAttributes::addAttribute);

        return "redirect:" + components.getPath();
    }

    @GetMapping("/messages/comDelete/{user}/{comment}")
    public String deleteComment(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @PathVariable Comment comment,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {

        if (comment.getAuthor().equals(currentUser) || currentUser.isAdmin()) {
            messageService.deleteComment(comment);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .forEach(redirectAttributes::addAttribute);

        return "redirect:" + components.getPath();
    }

    @PostMapping("/user-messages/{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Message message,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag
    ) {

        if (message.getAuthor().equals(currentUser)) {
            if (!StringUtils.isEmpty(text)) {
                message.setText(text);
            }

            if (!StringUtils.isEmpty(tag)) {
                message.setTag(tag);
            }

            messageRepo.save(message);
        }

        return "redirect:/user-messages/" + user;
    }

    @GetMapping("/messages/{message}/like")
    public String like(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = message.getLikes();
        Set<User> dislikes = message.getDislikes();

        return getString(currentUser, message, null, redirectAttributes, referer, likes, dislikes);
    }

    @GetMapping("/messages/{message}/dislike")
    public String dislike(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = message.getLikes();
        Set<User> dislikes = message.getDislikes();

        return getString(currentUser, message, null, redirectAttributes, referer, dislikes, likes);
    }

    @GetMapping("/messages/{comment}/comLike")
    public String likeComment(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Comment comment,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = comment.getLikes();
        Set<User> dislikes = comment.getDislikes();

        return getString(currentUser, null, comment, redirectAttributes, referer, likes, dislikes);
    }

    @GetMapping("/messages/{comment}/comDislike")
    public String dislikeComment(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Comment comment,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = comment.getLikes();
        Set<User> dislikes = comment.getDislikes();

        return getString(currentUser, null, comment, redirectAttributes, referer, dislikes, likes);
    }

    private String getString(@AuthenticationPrincipal User currentUser, @PathVariable Message message, @PathVariable Comment comment, RedirectAttributes redirectAttributes, @RequestHeader(required = false) String referer, Set<User> likes, Set<User> dislikes) {
        if (!likes.contains(currentUser) && !dislikes.contains(currentUser)) {
            likes.add(currentUser);
        } else {
            if (dislikes.contains(currentUser)) {
                dislikes.remove(currentUser);
                likes.add(currentUser);
            } else {
                likes.remove(currentUser);
            }
        }

        if (comment == null) {
            messageRepo.save(message);
        } else {
            commentRepo.save(comment);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .forEach(redirectAttributes::addAttribute);

        return "redirect:" + components.getPath();
    }
}
