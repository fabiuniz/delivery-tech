package $PACKAGE_BASE.service;

import $PACKAGE_BASE.dao.${MAIN_ENTITY}Repository;
import $PACKAGE_BASE.model.$MAIN_ENTITY;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ${MAIN_ENTITY}Service {

    private final ${MAIN_ENTITY}Repository repository;

    public ${MAIN_ENTITY}Service(${MAIN_ENTITY}Repository repository) {
        this.repository = repository;
    }

    public $MAIN_ENTITY criar($MAIN_ENTITY item) {
        return repository.save(item);
    }

    public List<$MAIN_ENTITY> listar() {
        return repository.findAll();
    }
}
