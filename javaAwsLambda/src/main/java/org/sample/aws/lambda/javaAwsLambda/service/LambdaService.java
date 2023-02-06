package org.sample.aws.lambda.javaAwsLambda.service;

import org.sample.aws.lambda.javaAwsLambda.model.LambdaModel;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class LambdaService {
    public LambdaModel create(LambdaModel model) {
        model.setId(UUID.randomUUID().toString());
        return model;
    }
}
