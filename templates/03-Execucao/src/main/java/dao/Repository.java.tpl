package $PACKAGE_BASE.dao;

import $PACKAGE_BASE.model.$MAIN_ENTITY;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ${MAIN_ENTITY}Repository extends JpaRepository<$MAIN_ENTITY, Long> {
}
