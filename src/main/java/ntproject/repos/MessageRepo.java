package ntproject.repos;

import ntproject.domain.Message;
import ntproject.domain.User;
import ntproject.domain.dto.MessageDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Set;

public interface MessageRepo extends CrudRepository<Message, Long> {
    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "group by m")
    Page<MessageDto> findAll(Pageable pageable, @Param("user") User user);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m.tag = :tag " +
            "group by m")
    Page<MessageDto> findByTag(@Param("tag") String tag, Pageable pageable, @Param("user") User user);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m.author = :author " +
            "group by m")
    Page<MessageDto> findByUser(Pageable pageable, @Param("author") User author, @Param("user") User user);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m.author = :author and " +
            "      m.tag = :tag " +
            "group by m")
    Page<MessageDto> findByUserAndTag(Pageable pageable, @Param("author") User author, @Param("user") User user, @Param("tag") String tag);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m.id IN :ids " +
            "group by m")
    Page<MessageDto> findMessageByAuthor(Pageable pageable, @Param("user") User user, @Param("ids") List<Long> ids);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m.id IN :ids " +
            "group by m")
    List<MessageDto> findTop(@Param("user") User user, @Param("ids") List<Long> ids);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m = :message " +
            "group by m")
    MessageDto findByMessage(@Param("user") User user, @Param("message") Message message);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   count(mdl) " +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m.id IN :ids " +
            "group by m")
    List<MessageDto> findTopAll(@Param("ids") List<Long> ids);

    @Query("select new ntproject.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0," +
            "   count(mdl), " +
            "   sum(case when mdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml left join m.dislikes mdl " +
            "where m.id IN :ids and " +
            "      m.tag = :tag " +
            "group by m")
    Page<MessageDto> findMessageByAuthorAndTag(Pageable pageable, @Param("user") User user, @Param("ids") List<Long> ids, @Param("tag") String tag);

}
