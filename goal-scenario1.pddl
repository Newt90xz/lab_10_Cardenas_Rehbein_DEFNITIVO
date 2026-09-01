(define (problem goal-green-red-blue)
    (:domain manito)

    (:objects
        greenb
        garra
        xygarra xybloque
        arr aba
        )
    (:init
        (en greenb xybloque)
        
        (pisob greenb aba)

        (libre greenb)
        
        (pos garra xygarra)
        (pisog garra arr)

        (camino xybloque xygarra)
        (camino xygarra  xybloque)

        (alt arr aba)
        (alt aba arr)

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