(*
 * queue.c
 *class 1 : QueueNode
 *class 2 : Queue
 *class 3 : Main
 *)
--1. class QueueNode
class QueueNode {
    node : Object;
    next : QueueNode;

    init(i : Object, n : QueueNode) : QueueNode {
        {
            node <- i;
            next <- n;
            self;
        }
    };

    getNode() : Object { node };
    getNext() : QueueNode { next };
    
    setNext(n : QueueNode) : QueueNode {
        {
            next <- n;
            self;
        }
    };
};
--2. class QueueNode
class Queue {
    head : QueueNode; 
    tail : QueueNode;  

    init() : Queue {
        let voidNode : QueueNode in
        {
            head <- (new QueueNode).init(new Object, voidNode); 
            tail <- head;
            self;
        }
    };

    enqueue(i : Object) : Queue {
        let voidNode : QueueNode, 
            newNode : QueueNode <- (new QueueNode).init(i, voidNode) 
        in
        {
            tail.setNext(newNode);
            tail <- newNode;
            self;
        }
    };

    dequeue() : Object {
        if isvoid head.getNext() then
            new Object
        else
            {
                let old_head : QueueNode <- head.getNext(),
                    result : Object <- old_head.getNode() 
                in
                {
                    head <- old_head;
                    result;
                };
            }
        fi
    };

    front() : Object {
        if isvoid head.getNext() then
            new Object
        else
            head.getNext().getNode()
        fi
    };

    isEmpty() : Bool {
        isvoid head.getNext()
    };

    print() : Queue {
        let current : QueueNode <- head.getNext(),
            io : IO <- new IO 
        in
        {
            while not isvoid current loop
                {
                   	io.out_string(":".concat(current.getNode().type_name() ));

                    case current.getNode() of
                        i : Int => io.out_int(i);
                        s : String => io.out_string(s);
                        o : Object => io.out_string("<Object>"); 
                    esac;

                    io.out_string("\n");
                    current <- current.getNext();
                }
            pool;
            self;
        }
    };
};
--3. class Main
class Main {
    main() : Object {
        let q : Queue <- (new Queue).init(),
            io : IO <- new IO in
        {
            io.out_string("--- Queue Init Test ---\n");
            io.out_string("front (empty): ");
            io.out_string(q.front().type_name()); 
            io.out_string("\nisEmpty (empty): ");
            io.out_string(if q.isEmpty() then "True" else "False" fi);
            io.out_string("\n\n");

            io.out_string("--- Enqueue elements ---\n");
            q.enqueue("zhangsan");
            q.enqueue(10);
            q.enqueue("lisi");
            q.enqueue(20); 

            io.out_string("\nQueue Contents (head to tail):\n");
            q.print();
            io.out_string("\nisEmpty (not empty): ");
            io.out_string(if q.isEmpty() then "True" else "False" fi);
            io.out_string("\n\n");

            io.out_string("--- Dequeue elements ---\n");
            
            io.out_string("Test front (Expected: 'zhangsan'): ");
            let peek_item : Object <- q.front() in
            case peek_item of
                s : String => io.out_string(s);
                i : Int => io.out_int(i);
                o : Object => io.out_string(o.type_name());
            esac;
            io.out_string("\n");

            io.out_string("Test dequeue (Expected: 'zhangsan'): ");
            let deq_item1 : Object <- q.dequeue() in
            case deq_item1 of
                s : String => io.out_string(s);
                i : Int => io.out_int(i);
                o : Object => io.out_string(o.type_name());
            esac;
            io.out_string("\n");

            io.out_string("Test dequeue (Expected: '10'): ");
            let deq_item2 : Object <- q.dequeue() in
            case deq_item2 of
                s : String => io.out_string(s);
                i : Int => io.out_int(i);
                o : Object => io.out_string(o.type_name());
            esac;
            io.out_string("\n");

            io.out_string("\nQueue Contents after two dequeues:\n");
            q.print();
            self; 
        }
    };
};
