Exercise 3.38
Peter - Paul - Mary: 45
Peter - Mary - Paul: 35
Paul - Peter - Mary: 45
Paul - Mary - Peter: 50
Mary - Peter - Paul: 40
Mary - Paul - Peter: 40

Exercise 3.39
121, 101, 100

Exercise 3.40
100, 1000, 10 000, 100 000, 1 000 000
Is changed to: 1 000 000

Exercise 3.41
Yes, actions cannot occur concurrenty and therefore guarantee serialized behaviour

Exercise 3.42
Yes this is safe, the other operations do not impact the state: they are readonly. This is therefore more efficient as on average less time operations are blocked

Exercise 3.44
He is not correct, the difference here is that a specific order is guaranteed: withdraw and then deposit. As long as there is no other process doing it the otherway around, a deadlock is impossible.
