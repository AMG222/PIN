;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain Robots
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (domain robots)
  (:requirements :strips :typing :equality :durative-actions)
  (:types person robot location furniture item arm)
  (:predicates (atr ?r - robot ?l -location) (at ?x - (either person furniture) ?l - location)
              (served ?p - person)(camino ?l0 -location ?l1 - location)
			  (canmove ?r -robot ?l - location)(arm ?a - arm ?i - item) (robot ?r - robot ?a - arm))
  (:functions (distance ?l0 -location ?l1 - location)(speed ?r - robot)(peso ?i - item)
  			  (battery ?r - robot)(total_energy)(capacity ?r - robot)(recharge_velocity))

 (:durative-action move
	     :parameters (?r - robot ?lo - location ?ld - location)
	     :duration (= ?duration (/ (distance ?lo ?ld) (speed ?r)))
		 :condition (and (at start (atr ?r ?lo))
		 			(at start (> (battery ?r) (* (speed ?r)(distance ?lo ?ld))))
		 			(over all (camino ?lo ?ld))
					(over all (canmove ?r ?ld))
					)
           :effect
	            (and (at start (not (atr ?r ?lo)))
				(at end (atr ?r ?ld))
				(at end (increase total_energy (* (speed ?r)(distance ?lo ?ld))))
				(at end (decrease (battery ?r) (* (speed ?r)(distance ?lo ?ld))))
				)
 )

 (:durative-action recharge
	:parameters (?r1 - robot ?r2 - robot ?l -location)
		 :duration (= ?duration (/ (- (capacity ?r1) (battery ?r1)) (recharge_velocity ?r1)))
	     :condition (and (at start (< (battery ?r1) (/ (capacity ?r1) 2)))
		 			(over all (atr ?r1 ?l))
		 			(over all (at RE ?l))
					(over all (not(atr ?r2 ?l)))
					)
    	 :effect
	     (and (at end (assign (battery ?r1) (capacity ?r1)))
		 )
)
 (:durative-action take-cup
	     :parameters (?r - robot ?l -location ?a - arm)
		 :duration (= ?duration 2)
	     :condition (and (at start (arm ?a empty))
		 (at start (> (battery ?r) 50))
		 			(over all (atr ?r ?l))
		 			(over all (at CS ?l))
					(over all (robot ?r ?a)))
    	 :effect
	     (and (at start (not(arm ?a empty)))
		 (at end (arm ?a cup))
		 (at end (increase total_energy 50))
		 (at end (decrease (battery ?r) 50))
		 )
)

(:durative-action fill-cup
	     :parameters (?r - robot ?l -location ?a - arm)
		 :duration (= ?duration 2)
	     :condition (and (at start (arm ?a cup))
		 (at start (> (battery ?r) 50))
		 			(over all (atr ?r ?l))
					(over all (at TM ?l))
					(over all (robot ?r ?a)))
    	     :effect
	     (and (at start (not(arm ?a cup)))
		 (at end (arm ?a tea))
		 (at end (increase total_energy 50))
		 (at end (decrease (battery ?r) 50))
		 )
)

(:durative-action share-cup
	     :parameters (?r1 - robot ?r2 -robot ?i1 - item ?i2 - item ?l - location ?a1 - arm ?a2 - arm)
	     :duration (= ?duration (+ (peso ?i1) (peso ?i2)))
		 :condition (and (at start (arm ?a2 ?i2))
		 			(at start (arm ?a1 ?i1))
					(at start (> (battery ?r1) 50))
					(at start (> (battery ?r2) 50))
					(over all (not(= ?r1 ?r2)))
					(over all (atr ?r1 ?l))
		 			(over all (atr ?r2 ?l))
					(over all (robot ?r1 ?a1))
					(over all (robot ?r2 ?a2)))
    	     :effect
	     (and (at start (not(arm ?a1 ?i1)))
		 (at start (not(arm ?a2 ?i2)))
		 (at end (arm ?a1 ?i2))
		 (at end (arm ?a2 ?i1))
		 (at end (increase total_energy 100))
		 (at end (decrease (battery ?r1) 50))
		 (at end (decrease (battery ?r2) 50))
		 )
)

(:durative-action good-service
	     :parameters (?r - robot ?p - person ?l - location ?a - arm)
	     :duration (= ?duration 1)
		 :condition (and
		 (over all (atr ?r ?l))
		 (over all (at ?p ?l))
		 (over all (robot ?r ?a))
		 (at start (arm ?a tea)))
    	     :effect
	     (and 
		 (at end (not(arm ?a tea)))
		 (at end (arm ?a empty))
		 (at end (served ?p)))
 )
)