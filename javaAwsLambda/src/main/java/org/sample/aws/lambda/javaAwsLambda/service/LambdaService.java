package org.sample.aws.lambda.javaAwsLambda.service;

import org.sample.aws.lambda.javaAwsLambda.model.LambdaModel;
import org.springframework.stereotype.Service;



@Service
public class LambdaService {
    private final LambdaDAO lambdaDAO;

    public LambdaService(LambdaDAO lambdaDAO) {
        this.lambdaDAO = lambdaDAO;
    }

    public LambdaModel create(LambdaModel model) {
        return lambdaDAO.save(model);
    }
}
