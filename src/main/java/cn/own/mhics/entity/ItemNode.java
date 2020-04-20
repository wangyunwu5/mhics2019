package cn.own.mhics.entity;

import java.util.Arrays;

public class ItemNode {
	
	public newnode newNode;
	public Item[] item;
	public newnode getNewNode() {
		return newNode;
	}
	public void setNewNode(newnode newNode) {
		this.newNode = newNode;
	}
	public Item[] getItem() {
		return item;
	}
	public void setItem(Item[] item) {
		this.item = item;
	}
	@Override
	public String toString() {
		return "ItemNode [newNode=" + newNode + ", item=" + Arrays.toString(item) + "]";
	} 

	
}
