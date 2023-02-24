package org.sample.aws.lambda.javaAwsLambda.service;

import org.sample.aws.lambda.javaAwsLambda.model.LambdaModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LambdaRepository extends CrudRepository<LambdaModel, String> {
}
