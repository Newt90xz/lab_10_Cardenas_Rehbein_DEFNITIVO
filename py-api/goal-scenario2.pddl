(define (problem goal2)
    (:domain manito)

    (:objects
        greenb blueb
        garra
        xygarra xygreen xyblue
        zgreen zgarra zblue
        )
    (:init
        (en greenb xygreen)
        (en blueb xyblue)

        (pisob greenb zgreen)
        (pisob blueb zblue)

        (libre greenb)
        (libre blueb)
        
        (pos garra xygarra)
        (pisog garra zgarra)

        (camino xygreen xygarra)
        (camino xygarra  xygreen)
        
        (camino xygarra  xyblue)
        (camino xyblue xygarra)

        (camino xygreen  xyblue)
        (camino xyblue xygreen)

        (alt zgarra zgreen)
        (alt zgreen zgarra)
        
        (alt zblue zgarra)
        (alt zgarra zblue)

        (dismover garra)

        (desocupado garra)
    )
    (:goal 
        (and 
            (torre greenb blueb)
        )
    )
)