package com.practice.spring;

public class Queue {
	
	int queue[] = new int[5];
	int size;
	int front;
	int rear;

	public void enQueue(int data){
		
		if(!isFull()){
			queue[rear] = data;
			rear = (rear+1)%5;
			size = size+1;
		}else{
			System.out.println("Queue is full");
		}	
		
	}
	
	public void deQueue(){
		int data = queue[front];
		
		if(!isEmpty()){
			front = (front+1)%5;
			size=size-1;
		}else{
			System.out.println("Queue is empty");
		}
		
	}
	
	public void show(){
		
		System.out.print("Elements : ");
		
		for(int i=0; i<size; i++){
			System.out.print(queue[(front+i)%5]+ " " );
		}
		
		System.out.println();
		
		for(int n : queue){
			System.out.print(n+ " " );
		}
	}
	
	public int getsize(){
		
		return size;
	}
	
	public boolean isEmpty(){
		
		return getsize()==0;
	}
	
	public boolean isFull(){
		return getsize()==5;
	}
}

