(define (domain manito)
    (:requirements :strips)

    (:predicates 
        (en ?bloque ?donde)
        (pos ?garra ?donde)

        (libre ?quien)
        (apilado ?bloque)
        (dismover ?garra)
        (pinned ?garra)

        (torre ?debajo ?sobre)

        (pisog ?garra ?altura)
        (pisob ?bloque ?altura)

        (ocupado ?garra)
        (desocupado ?garra)
        
        (camino ?donde ?hasta)
        (alt ?al1 ?al2))


    (:action movehorizontal
        :parameters (?garra ?donde ?hasta)
        :precondition (and
            (pos ?garra ?donde)
            (camino ?donde ?hasta)
            (dismover ?garra)
        )
        :effect (and
            (pos ?garra ?hasta)
            (not (pos ?garra ?donde))
        )
    )

    (:action moverarriba
        :parameters (?garra ?alt ?alt2)
        :precondition (and
            (pisog ?garra ?alt)
            (alt ?alt ?alt2)
            (pinned ?garra)
        )
        :effect (and
            (pisog ?garra ?alt2)
            (not (pisog ?garra ?alt))
            (not (pinned ?garra))
            (dismover ?garra)
        )
    )

     (:action moverabajo
        :parameters (?garra ?alt ?alt2)
        :precondition (and
            (pisog ?garra ?alt)
            (alt ?alt ?alt2)
            (dismover ?garra)
        )
        :effect (and
            (pisog ?garra ?alt2)
            (not (pisog ?garra ?alt))
            (not (dismover ?garra))
            (pinned ?garra)
        )
    )

    (:action tomar
        :parameters (?garra ?bloque ?donde ?alt)
        :precondition (and
            (pos ?garra ?donde)
            (en ?bloque ?donde)
            (pisog ?garra ?alt)
            (pisob ?bloque ?alt)
            (desocupado ?garra)
            (libre ?bloque)
        )
        :effect (and
            (ocupado ?garra)
            (not (desocupado ?garra))
            (en ?bloque ?garra)
            (not (en ?bloque ?donde))
            (not (pisob ?bloque ?alt))
            (libre ?donde)
            (libre ?bloque)
        )
    )

    (:action soltar 
        :parameters (?garra ?bloque ?donde ?alt)
        :precondition (and
            (pos ?garra ?donde)
            (en ?bloque ?garra)
            (pisog ?garra ?alt)
            (ocupado ?garra)
            (libre ?donde)
        )
        :effect (and
            (not (ocupado ?garra))
            (desocupado ?garra)
            (not (en ?bloque ?garra))
            (en ?bloque ?donde)
            (pisob ?bloque ?alt)
            (not (libre ?donde))
        )
    )

    
    (:action desapilar
        :parameters (?garra ?bloque ?donde ?alt ?bloque2)
        :precondition (and
            (pos ?garra ?donde)
            (en ?bloque ?donde)
            (en ?bloque2 ?donde)

            (pisog ?garra ?alt)
            (pisob ?bloque ?alt)
            (pisob ?bloque2 ?alt)
            
            (desocupado ?garra)

            (libre ?bloque)
            (apilado ?bloque2)
            (torre ?bloque2 ?bloque)
            )
            
            :effect (and
            (not (torre ?bloque2 ?bloque))
            (not (libre ?bloque))
            (not (apilado ?bloque2))
            (libre ?bloque2)
            (ocupado ?garra)
            (not (desocupado ?garra))
            (en ?bloque ?garra)
            (not (en ?bloque ?donde))
            (not (pisob ?bloque ?alt))
            )
    )

    (:action apilar
        :parameters (?garra ?bloque ?bloque2 ?donde ?alt)
        :precondition (and
            (pos ?garra ?donde)
            (en ?bloque ?garra)
            (en ?bloque2 ?donde)

            (pisog ?garra ?alt)
            (pisob ?bloque2 ?alt)
            
            (ocupado ?garra)
            (libre ?bloque2)
            )
            
            :effect (and
            (torre ?bloque2 ?bloque)
            (libre ?bloque)
            (apilado ?bloque2)
            (not (libre ?bloque2))
            (not (ocupado ?garra))
            (desocupado ?garra)
            (not (en ?bloque ?garra))
            (en ?bloque ?donde)
            (pisob ?bloque ?alt)
            )
    )
)