package ntproject.service;


import ntproject.domain.Message;
import ntproject.domain.User;
import ntproject.domain.dto.MessageDto;
import ntproject.repos.MessageRepo;
import ntproject.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class MessageService {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private UserRepo userRepo;

    public Page<MessageDto> messageList(Pageable pageable, String filter, User user) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findByTag(filter, pageable, user);
        } else {
            return messageRepo.findAll(pageable, user);
        }
    }

    public Page<MessageDto> friendsMessageList(Pageable pageable, User currentUser, String filter) {
        if (currentUser != null) {
            if (userRepo.findByUsername(currentUser.getUsername()).getSubscriptions().size() != 0) {
                List<Long> id = new ArrayList<>();
                userRepo.findByUsername(currentUser.getUsername()).getSubscriptions().forEach(user -> {
                    user.getMessages().stream().map(Message::getId).forEach(id::add);
                    if (userRepo.findByUsername(currentUser.getUsername()).getMessages().size() != 0){
                        userRepo.findByUsername(currentUser.getUsername()).getMessages().stream().map(Message::getId).forEach(id::add);
                    }
                });
                if (filter != null && !filter.isEmpty()) {
                    return messageRepo.findMessageByAuthorAndTag(pageable, userRepo.findByUsername(currentUser.getUsername()), id, filter);
                } else {
                    return messageRepo.findMessageByAuthor(pageable, userRepo.findByUsername(currentUser.getUsername()), id);
                }
            } else {
                if (filter != null && !filter.isEmpty()) {
                    return messageRepo.findByUserAndTag(pageable, currentUser, currentUser, filter);
                } else {
                    return messageRepo.findByUser(pageable, currentUser, currentUser);
                }
            }
        }
        return null;
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author, String filter) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findByUserAndTag(pageable, author, currentUser, filter);
        } else {
            return messageRepo.findByUser(pageable, author, currentUser);
        }
    }

    public Message findById(Long id) {
        return messageRepo.findById(id).isPresent() ? messageRepo.findById(id).get() : null;
    }

    public List<MessageDto> topMessagesList(User currentUser) {
        Date date = new Date();
        //                .sorted(Comparator.comparingInt(o -> o.getLikes().size()))
        List<Message> messages = (List<Message>) ((List<Message>) messageRepo.findAll()).stream()
                .filter(c -> c.getPostDate().compareTo(new Date(date.getTime() - 24 * 3600 * 1000L)) >= 0)
                .sorted((Comparator) (o1, o2) -> {

                    Integer x1 = ((Message) o1).getLikes().size();
                    Integer x2 = ((Message) o2).getLikes().size();
                    int sComp = x1.compareTo(x2);

                    if (sComp != 0) {
                        return sComp;
                    }

                    Integer y1 = ((Message) o1).getComments().size();
                    Integer y2 = ((Message) o2).getComments().size();
                    return y1.compareTo(y2);
                })
                .collect(Collectors.toList());

        int size = messages.size();
        if (size > 20) {
           messages = messages.subList(size - 20, size);
        }
        List<Long> id = messages.stream().map(Message::getId).collect(Collectors.toList());
        if (id.size() == 0) {
            return null;
        } else {
            List<MessageDto> m = new ArrayList<>(messageRepo.findTopAll(id));
            if (currentUser != null) {
                m = new ArrayList<>(messageRepo.findTop(currentUser, id));
            }

            return (List<MessageDto>) m.stream()
                    .sorted((Comparator) (o1, o2) -> {

                        Long x1 = ((MessageDto) o1).getLikes();
                        Long x2 = ((MessageDto) o2).getLikes();
                        int sComp = x2.compareTo(x1);

                        if (sComp != 0) {
                            return sComp;
                        }

                        Integer y1 = ((MessageDto) o1).getSize();
                        Integer y2 = ((MessageDto) o2).getSize();
                        return y2.compareTo(y1);
                    })
                    .collect(Collectors.toList());
        }
//        return id.size() == 0 ? null : messageRepo.findTop(currentUser, id).stream().sorted(Comparator.comparingInt(o -> Math.toIntExact(o.getLikes())))
//                .collect(Collectors.toList());
    }
}
