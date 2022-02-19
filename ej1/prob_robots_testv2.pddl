;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Prob Robots (Se ha añadido un comensal(Marta) en la misma habitación que otro.
;;Se ha añadido el robot 3
;;Se da la capacidad de moverse a la habitación 1, 3 y hall al robot 3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (problem probrobot)
(:domain robots)

(:objects R1 R2 R3 - robot ;;Se añade otro robot
          Juan Pedro Marta - person ;;Marta se añade
          room1 room2 room3 room4 hall - location
          TM CS - furniture
          cup tea empty - item
          armR3L armR3R armR2L armR2R armR1L armR1R - arm ;;Se añaden los brazos del robot 3         
)

(:init 
(atr R1 room1)
(atr R2 room3)
(atr R3 room3) ;;Robot 3 se encuentra en la habitación 3

(at Juan room2)
(at Marta room2);;Marta se añade en la room2
(at Pedro room3) 
(at TM room1)
(at CS room3)

(camino room1 room2)
(camino room1 hall)

(camino room2 room1)
(camino room2 hall)

(camino room3 room4)
(camino room3 hall) 

(camino room4 room3)
(camino room4 hall)

(camino hall room1)
(camino hall room2)
(camino hall room3)
(camino hall room4)

(canmove R1 room1)
(canmove R1 room2)
(canmove R1 hall)
(canmove R2 room3)
(canmove R2 room4)
(canmove R2 hall)
(canmove R3 room1);;Añadimos la posibilidad del robot 3 de moverse a la habitación 1, 3 y al hall
(canmove R3 room3)
(canmove R3 hall)

(arm armR1R empty)
(arm armR1L empty)
(arm armR2R empty)
(arm armR2L empty)
(arm armR3R empty);;Añadimos el brazo del robot 3
(arm armR3L empty)

(robot R1 armR1R)
(robot R1 armR1L)
(robot R2 armR2R)
(robot R2 armR2L)
(robot R3 armR3R)
(robot R3 armR3L);;Añadimos el brazo del robot 3
)

(:goal (and (served Juan)(served Pedro)(served Marta))) ;;se añade Marta
)