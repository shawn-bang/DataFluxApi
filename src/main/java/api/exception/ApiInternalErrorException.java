package api.exception;

/**
 * 业务异常处理父类
 * @author shawn
 * 2017-12-10 16:00:00
 */
public class ApiInternalErrorException extends RuntimeException {

    public ApiInternalErrorException(String message) {
        super(message);
    }

}
