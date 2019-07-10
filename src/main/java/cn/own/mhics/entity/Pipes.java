package cn.own.mhics.entity;

import java.util.List;

public class Pipes {
	private List<Pipe> pipe;
	private List<DiaoChaPipe> dcpipe;
	
	public List<Pipe> getPipe() {
		System.out.println("pipe数据为"+pipe);
		return pipe;
	}
	public void setPipe(List<Pipe> pipe) {
		if(pipe.size()>0) {
			this.pipe = pipe;
		}
		else
			this.pipe = null;
	}
	public List<DiaoChaPipe> getDcpipe() {
		System.out.println("dcpipe数据为"+dcpipe);
		return dcpipe;
	}
	public void setDcpipe(List<DiaoChaPipe> dcpipe) {
		if(dcpipe.size()>0)
			this.dcpipe = dcpipe;
		else
			this.dcpipe = null;
	}
	
}
