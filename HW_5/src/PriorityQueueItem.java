public class PriorityQueueItem<ValueType, PriorityType extends Comparable<? super PriorityType>> implements Comparable<Object> {
    private ValueType value;
    private PriorityType priority;

    public PriorityQueueItem(ValueType value, PriorityType priority) {
        this.value = value;
        this.priority = priority;
    }

    public ValueType getValue() {
        return value;
    }

    public void setValue(ValueType value) {
        this.value = value;
    }

    public PriorityType getPriority() {
        return priority;
    }

    public void setPriority(PriorityType priority) {
        this.priority = priority;
    }

    @Override
    public int compareTo(Object o) {
        return ((PriorityQueueItem) o).getPriority().compareTo(priority);
    }
}
