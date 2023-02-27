package org.sample.aws.lambda.javaAwsLambda;

import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.sample.aws.lambda.javaAwsLambda.handler.PostHandler;
import org.sample.aws.lambda.javaAwsLambda.service.LambdaDAO;
import org.sample.aws.lambda.javaAwsLambda.service.LambdaService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.cloud.function.context.FunctionRegistration;
import org.springframework.cloud.function.context.FunctionType;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.function.Function;


@SpringBootConfiguration
public class JavaAwsLambdaApplication implements ApplicationContextInitializer<GenericApplicationContext> {
    public static void main(String[] args) {
        SpringApplication.run(JavaAwsLambdaApplication.class, args);
    }

    public Function<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> create() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        DataSourceBuilder<?> dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("org.postgresql.Driver");
        dataSourceBuilder.url(System.getenv("SPRING_DATASOURCE_URL"));
        dataSourceBuilder.username(System.getenv("SPRING_DATASOURCE_USERNAME"));
        dataSourceBuilder.password(System.getenv("SPRING_DATASOURCE_PASSWORD"));

        LambdaDAO lambdaDAO = new LambdaDAO(new JdbcTemplate(dataSourceBuilder.build()));
        LambdaService lambdaService = new LambdaService(lambdaDAO);

        return value -> new PostHandler(lambdaService,objectMapper).apply(value);
    }

    @Override
    public void initialize(GenericApplicationContext context) {

       //                        .type(FunctionTypeUtils.functionType(APIGatewayProxyRequestEvent.class, APIGatewayProxyResponseEvent.class)));
        context.registerBean("handleRequest", FunctionRegistration.class,
                () -> new FunctionRegistration<Function<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent>>(create())
                        .type(FunctionType.from(APIGatewayProxyRequestEvent.class)
                                .to(APIGatewayProxyResponseEvent.class))
        );
    }
}
