(define (problem goal-green-red-blue)
    (:domain manito)

    (:objects
        greenb
        garra
        xygarra xygreen
        zgreen zgarra
        )
    (:init
        (en greenb xygreen)
        
        (pisob greenb zgreen)

        (libre greenb)
        
        (pos garra xygarra)
        (pisog garra zgarra)

        (camino xygreen xygarra)
        (camino xygarra  xygreen)

        (alt zgarra zgreen)
        (alt zgreen zgarra)

        (dismover garra)

        (desocupado garra)
    )
    (:goal 
        (and 
            (en greenb garra)
            (pos garra xygarra)
        )
    )
)