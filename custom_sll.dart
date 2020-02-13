class CustomSLL<T> {
  Node head;
 int getLength() {
    int l = 0;
    Node temp = head;
    while (temp != null) {
      l++;
      temp = temp.next;
    }
    return l;
  }

  bool isEmpty() {
    return head == null ? true : false;
  }

  void addFirst(T data) {
    Node temp = head;
    Node newData = Node(data);
    newData.next = temp;
    head = newData;
  }

  void addLast(T data) {
    Node temp = head;
    while (temp.next != null) {
      temp = temp.next;
    }
    Node newNode = Node(data);
    temp.next = newNode;
  }

  void insert(int index, T data) {
    if (index < 0 || index > getLength()) {
      print("IndexOutOfBoundException");
      return;
    }
    Node temp = head;
    if (index == 0) {
      Node newData = Node(data);
      newData.next = temp;
      head = newData;
      return;
    }
    for (int i = 1; i < index; i++) {
      temp = temp.next;
    }
    Node nextTemp = temp.next;
    Node newData = Node(data);
    temp.next = newData;
    newData.next = nextTemp;
  }

  T getData(int index) {
    Node temp = head;
    if (index < 0 || index >= getLength()) return null;
    for (int i = 0; i < index; i++) {
      temp = temp.next;
    }
    return temp.data;
  }

  void replace(int index,T data){
    if (index < 0 || index >= getLength()) {
      print("IndexOutOfBoundException");
      return;
    }
    Node temp = head;
    if (index == 0) {
      head.data = data;
      return;
    }
    for (int i = 1; i < index; i++) {
      temp = temp.next;
    }
    temp.next.data = data;
  }

  void add(T data) {
    if (head == null) {
      head = Node(data);
      return;
    }
    Node newNode = Node(data);
    Node last = head;
    while (last.next != null) {
      last = last.next;
    }
    last.next = newNode;
    return;
  }

  void addAll(List<T> listData){
   for(T data in listData){
     add(data);
   }
  }

  void display() {
    Node temp = head;
    while (temp != null) {
      print(temp.data.toString());
      temp = temp.next;
    }
  }

  void forEach(void action(T entry)) {
    if (head == null) return;
    Node temp = head;
    while (temp != null) {
      action(temp.data);
      temp = temp.next;
    }
  }

  void remove() {
    Node temp = head, prev;
    while (temp.next != null) {
      prev = temp;
      temp = temp.next;
    }
    temp = null;
    prev.next = null;
  }

  void delete(int index) {
    if (index < 0 || index >= getLength()) {
      print('IndexOutOfBoundException');
      return;
    }
    Node temp = head, prev;
    for (int i = 0; i < index; i++) {
      prev = temp;
      temp = temp.next;
    }
    if (index == 0) {
      head = temp.next;
      return;
    }
    prev.next = temp.next;
    temp = null;
  }

  void clear() {
    if (head == null) return;
    while (head.next != null) {
      head.data = null;
      head = head.next;
    }
    head.data = null;
    head = head.next;
  }
}

class Node<T> {
  T data;
  Node next;

  Node(T data) {
    this.data = data;
    this.next = null;
  }
}
