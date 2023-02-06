package org.sample.aws.lambda.javaAwsLambda.handler;

import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.sample.aws.lambda.javaAwsLambda.model.LambdaModel;
import org.sample.aws.lambda.javaAwsLambda.service.LambdaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.function.Function;

@Component
public class PostHandler implements Function<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {
    private final ObjectMapper objectMapper;
    private final LambdaService lambdaService;
    private final Logger logger = LoggerFactory.getLogger(PostHandler.class);

    public PostHandler(LambdaService lambdaService, ObjectMapper objetMapper) {
        this.lambdaService = lambdaService;
        this.objectMapper = objetMapper;
    }

    @Override
    public APIGatewayProxyResponseEvent apply(APIGatewayProxyRequestEvent input) {
        try {
            logger.info("Input Body : " + input.getBody());
            var model = objectMapper.readValue(input.getBody(), LambdaModel.class);
            var savedUnicorn = lambdaService.create(model);
            return new APIGatewayProxyResponseEvent().withStatusCode(200).withBody(objectMapper.writeValueAsString(savedUnicorn));
        } catch (Exception e) {
            logger.error("Error creating model", e);
            return new APIGatewayProxyResponseEvent().withStatusCode(500).withBody("Error creating model");
        }
    }
}
