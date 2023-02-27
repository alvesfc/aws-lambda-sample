package org.sample.aws.lambda.javaAwsLambda.service;

import org.sample.aws.lambda.javaAwsLambda.model.LambdaModel;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Component
public class LambdaDAO  {

    public static final String TABLE = "lambdamodel";
    private final JdbcTemplate jdbcTemplate;

    public LambdaDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Transactional(rollbackFor = Exception.class)
    public LambdaModel save(LambdaModel model) {

        SimpleJdbcInsert simpleJdbcInsert =
                new SimpleJdbcInsert(Objects.requireNonNull(jdbcTemplate.getDataSource())).withTableName(TABLE)
                        .usingGeneratedKeyColumns("id");;

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("name", model.getName());
        parameters.put("message", model.getMessage());

        UUID id = simpleJdbcInsert.executeAndReturnKeyHolder(parameters).getKeyAs(UUID.class);

        assert id != null;
        model.setId(id.toString());

        return model;
    }
}


