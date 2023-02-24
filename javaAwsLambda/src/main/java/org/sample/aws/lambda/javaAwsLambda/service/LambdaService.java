package org.sample.aws.lambda.javaAwsLambda.service;

import org.sample.aws.lambda.javaAwsLambda.model.LambdaModel;
import org.springframework.stereotype.Service;

@Service
public class LambdaService {

    private final LambdaRepository lambdaRepository;

    public LambdaService(LambdaRepository lambdaRepository) {
        this.lambdaRepository = lambdaRepository;
    }

    public LambdaModel create(LambdaModel model) {
        return lambdaRepository.save(model);
    }
}
