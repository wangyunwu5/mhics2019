package cn.own.mhics.entity;

import java.util.List;

public class Pipes {
	private List<Pipe> pipe;
	private List<DiaoChaPipe> dcpipe;
	
	public List<Pipe> getPipe() {
		return pipe;
	}
	public void setPipe(List<Pipe> pipe) {
		this.pipe = pipe;
	}
	public List<DiaoChaPipe> getDcpipe() {
		return dcpipe;
	}
	public void setDcpipe(List<DiaoChaPipe> dcpipe) {
		this.dcpipe = dcpipe;
	}
	
}
