//
//  GCD.swift
//  
//
//  Created by Zhang, Wanming on 5/9/22.
//

import Foundation

/**
 * GCD operates on dispatch queues through a class called DispatchQueue. You submits units of work to this queue and GCD will execute them in a FIFO order (first in first out), guaranteeing the first order submitted is the first one started.
 * Dispatch queues are thread safe which means that they can be accessed from multiple threads simultaneously.
 * Queues can be either serial or concurrent.
 * Serial queues guarantee that only one task runs at any given time. First tasks has to finish before next task can start.
 * Concurrent queues allow multiple tasks to run at the same time. The queue guarantees tasks start in the order you add them. Tasks can finish in any order.
 */


let aQueue = DispatchQueue(label: "aQueue") // default is a serial queue

// Q: what will print in the next code snippet

aQueue.async {
    print("1")
    aQueue.sync {
        print("2")
        aQueue.async {
            print("3")
        }
    }
}

aQueue.async {
    print("4")
}

aQueue.async {
    print("5")
}

// A: myQueue is a serial queue, sync on a serial queue will result in dead-lock, this code snippet will only print "1"

let anotherQueue = DispatchQueue(label: "anotherQueue", attributes: .concurrent)

anotherQueue.async {
    print("1")
    anotherQueue.sync {
        print("2")
        anotherQueue.async {
            print("3")
        }
    }
}

anotherQueue.async {
    print("4")
}

anotherQueue.async {
    print("5")
}

// Another queue is a concurrent queue, will print out print 1 4 5 2 3
