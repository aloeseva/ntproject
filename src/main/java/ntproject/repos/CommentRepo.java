package ntproject.repos;

import ntproject.domain.Comment;
import ntproject.domain.Message;
import ntproject.domain.User;
import ntproject.domain.dto.CommentDto;
import ntproject.domain.dto.MessageDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentRepo extends CrudRepository<Comment, Long> {
    @Query("select new ntproject.domain.dto.CommentDto(" +
            "   c, " +
            "   count(cl), " +
            "   sum(case when cl = :user then 1 else 0 end) > 0," +
            "   count(cdl), " +
            "   sum(case when cdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Comment c left join c.likes cl left join c.dislikes cdl " +
            "where c.message = :message " +
            "group by c " +
            "order by c.id "
    )
    Page<CommentDto> findByMessage(Pageable pageable, @Param("user") User user, @Param("message") Message message);

    @Query("select new ntproject.domain.dto.CommentDto(" +
            "   c, " +
            "   count(cl), " +
            "   sum(case when cl = :user then 1 else 0 end) > 0," +
            "   count(cdl), " +
            "   sum(case when cdl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Comment c left join c.likes cl left join c.dislikes cdl " +
            "where c.message = :message " +
            "group by c " +
            "order by c.id"
    )
    List<CommentDto> findTop(@Param("user") User user, @Param("message") Message message);

    @Query("select new ntproject.domain.dto.CommentDto(" +
            "   c, " +
            "   count(cl), " +
            "   count(cdl) " +
            ") " +
            "from Comment c left join c.likes cl left join c.dislikes cdl " +
            "where c.message = :message " +
            "group by c " +
            "order by c.id "
    )
    List<CommentDto> findTopAll(@Param("message") Message message);
}
