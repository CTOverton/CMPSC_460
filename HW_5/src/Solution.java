import java.util.Random;

public class Solution {
    public static void main(String[] args)
    {
        PriorityQueue<String, Integer> testQueue = new PriorityQueue<>();
        Random random = new Random();

        int items = 100;

        System.out.println("Inserting " + items + " items to priority queue...\n");
        for (int i = 0; i < items; i++) {
            testQueue.insert("Item " + i, random.nextInt());
        }

        System.out.println("Highest priority element: " + testQueue.headValue());
        System.out.println("Highest priority: " + testQueue.headPriority());
        System.out.println("Queue size: " + testQueue.size());
        System.out.println();

        System.out.println("Dequeuing: " + testQueue.dequeue());
        System.out.println();

        System.out.println("Highest priority element: " + testQueue.headValue());
        System.out.println("Highest priority: " + testQueue.headPriority());
        System.out.println("Queue size: " + testQueue.size());
        System.out.println();

        System.out.println("Done");
    }
}
