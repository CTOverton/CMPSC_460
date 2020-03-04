import java.util.ArrayList;
import java.util.Collections;

public class PriorityQueue<ValueType, PriorityType extends Comparable<? super PriorityType>> {

    private int size;
    private ArrayList<PriorityQueueItem<ValueType, PriorityType>> queue = new ArrayList<>();

    public PriorityQueue() {
        this.size = 0;
    }

    /** insert an element to the priority queue
     * @param value
     * @param priority
     */
    public void insert(ValueType value, PriorityType priority) {
        queue.add(new PriorityQueueItem<>(value, priority));
        Collections.sort(queue);
        size++;
    }

    /** remove the highest priority element
     * @return
     */
    public ValueType dequeue() {
        ValueType val = queue.get(0).getValue();
        queue.remove(0);
        size--;
        return val;
    }

    /** extract the highest priority element without removing it from the queue
     * @return
     */
    public ValueType headValue() {
        return queue.get(0).getValue();
    }

    /** get the highest priority
     * @return
     */
    public PriorityType headPriority() {
        return queue.get(0).getPriority();
    }

    /** get the size of the queue
     * @return
     */
    public int size() {
        return size;
    }
}