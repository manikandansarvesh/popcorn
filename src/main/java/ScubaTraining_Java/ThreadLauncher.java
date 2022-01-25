package ScubaTraining_Java;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.IntStream;
public class ThreadLauncher{
    public static void main(String[] args) {
        ExecutorService service = Executors.newFixedThreadPool(10);
        IntStream.range(0, 10).forEach(i -> service.submit(new Task(i)));
    }
}
final class Task
        implements Runnable
{
    private int taskId;

    public  Task(int id)
    {
        this.taskId = id;
    }

    @Override
    public synchronized void  run(){
        System.out.println("Task ID : " + this.taskId + " performed by "
                + Thread.currentThread().getName());
    }
}




