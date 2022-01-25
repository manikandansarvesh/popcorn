package ScubaTraining_Java;

 class ThreadExample extends Thread{


    String name;
    Thread t;
    ThreadExample (String threadname){
        name = threadname;
        t = new Thread(this, name);
        System.out.println("New thread: " + t);
        t.start();
    }
    public void run() {
        try {
            for(int i = 5; i > 0; i--) {
                System.out.println(name + ": " + i);
                Thread.sleep(1000);
            }
        }catch (InterruptedException e) {
            System.out.println(name + "Interrupted");
        }
        System.out.println(name + " exiting.");
    }
}
public class MultiThread {
    public static void main(String args[]) {
        new ThreadExample("One");
        new ThreadExample("Two");
        new ThreadExample("Three");
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            System.out.println("Main thread Interrupted");
        }
        System.out.println("Main thread exiting.");
    }
}




