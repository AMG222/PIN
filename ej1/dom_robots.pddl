;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain Robots
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (domain robots)
  (:requirements :strips :typing :equality)
  (:types person robot location furniture item arm)
  (:predicates (atr ?r - robot ?l -location) (at ?x - (either person furniture) ?l - location)
              (served ?p - person)(camino ?l0 -location ?l1 - location)
			  (canmove ?r -robot ?l - location)(arm ?a - arm ?i - item) (robot ?r - robot ?a - arm))

 (:action move
	     :parameters (?r - robot ?lo - location ?ld - location)
	     :precondition (and (atr ?r ?lo)(camino ?lo ?ld)(canmove ?r ?ld))
           :effect
	            (and (not (atr ?r ?lo)) (atr ?r ?ld))
 )

 (:action take-cup
	     :parameters (?r - robot ?l -location ?a - arm)
	     :precondition (and (atr ?r ?l)(at CS ?l)(robot ?r ?a)(arm ?a empty))
    	    :effect
	     (and (not(arm ?a empty))(arm ?a cup))
 )

(:action fill-cup
	     :parameters (?r - robot ?l -location ?a - arm)
	     :precondition (and (atr ?r ?l)(at TM ?l)(robot ?r ?a)(arm ?a cup))
    	     :effect
	     (and (arm ?a tea) (not(arm ?a cup)))
)

(:action share-cup
	     :parameters (?r1 - robot ?r2 -robot ?i1 - item ?i2 - item ?l - location ?a1 - arm ?a2 - arm)
	     :precondition (and (atr ?r1 ?l)(atr ?r2 ?l)(robot ?r1 ?a1)(arm ?a1 ?i1)(robot ?r2 ?a2)(arm ?a2 ?i2))
    	     :effect
	     (and (not(arm ?a1 ?i1)) (arm ?a1 ?i2)  (not(arm ?a2 ?i2)) (arm ?a2 ?i1))
 )

(:action good-service
	     :parameters (?r - robot ?p - person ?l - location ?a - arm)
	     :precondition (and(atr ?r ?l)(at ?p ?l) (robot ?r ?a)(arm ?a tea))
    	     :effect
	     (and (not(arm ?a tea)) (arm ?a empty) (served ?p))
 )
)