package ScubaTraining_Java;

/**
 * The significant differences between extending Thread class and implementing Runnable interface: ... When we extend Thread class, each of our thread creates unique object and associate with it.
 * When we implements Runnable, it shares the same object to multiple threads
 */

//public class MultithreadingDemo extends Thread{
    public class MultithreadingDemo  implements Runnable{
    public void run(){
        System.out.println("My thread is in running state.");
    }
    public static void main(String args[]){
        MultithreadingDemo obj=new MultithreadingDemo();

        Thread thread=new Thread(obj);
        thread.start();
    }
}

