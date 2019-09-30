package cn.own.mhics.common;

/**
 * 响应结果生成器
 * @author Mr.wang
 *
 */
public class ResultGenerator {
	
	private static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";
	private static final String DEFAULT_FAIL_MESSAGE = "FAIL";
	
	public static Result genSuccessResult() {
		Result result = new Result();
		result.setResultCode(Constants.RESULT_CODE_SUCCESS);
		result.setMessage(DEFAULT_SUCCESS_MESSAGE);
		return result;
	}

	public static Result genSuccessResult(Object data) {
		Result result = new Result();
		result.setResultCode(Constants.RESULT_CODE_SUCCESS);
		result.setMessage(DEFAULT_SUCCESS_MESSAGE);
		result.setData(data);
		return result;
	}
	
	public static Result getFailResult(String message) {
		Result result = new Result();
		result.setResultCode(Constants.RESULT_CODE_BAD_REQUEST);
		if(message == null || message.length()<1) {
			message = DEFAULT_FAIL_MESSAGE;
		}
		result.setMessage(message);
		return result;
	}

}
