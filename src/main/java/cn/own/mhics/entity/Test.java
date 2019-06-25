package cn.own.mhics.entity;

import java.util.Date;

public class Test {
	
	private String testName;
	
	private Date testTime;

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public Date getTestTime() {
		return testTime;
	}

	public void setTestTime(Date testTime) {
		this.testTime = testTime;
	}

	@Override
	public String toString() {
		return "Test [testName=" + testName + ", testTime=" + testTime + "]";
	}
	

}
