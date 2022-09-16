def criterio_hessiana(f, x0, y0, rtol=1e-14):
    """CRITERIO_HESSIANA    Calculo do criterio da hessiana.
    """
    if not isinstance(f, sage.symbolic.expression.Expression):
        raise RuntimeError('F debe ser unha expresion simbolica.')
    if len(f.args()) != 2:
        raise RuntimeError('A funcion non ten dous argumentos '+\
        'escalares!')
    if abs(diff(f)(x0,y0)) > rtol:
        raise RuntimeError('A funcion non presenta un punto critico '+\
        'en ('+str(x0)+', '+str(y0)+') con tolerancia rtol='+str(rtol)+\
        '; cambie o argumento rtol ou o punto indicado.')
    H = f.hessian()(x0,y0)
    detH = det(H)
    if abs(detH) < rtol:
        print('abs(det(H))='+str(abs(detH))+', e menor que a '+\
        'tolerancia rtol='+str(rtol)+'; o criterio non decide.')
    elif detH > 0:
        if H[0][0] > 0:
            print('H[0][0]='+str(H[0][0])+', det(H)='+str(detH)+\
            '; o punto e un minimo local.')
        else:
            print('H[0][0]='+str(H[0][0])+', det(H)='+str(detH)+\
            '; o punto e un maximo local.')
    else:
        print('det(H)='+str(detH)+'; o punto e un punto de sela.')

def descenso(f, df, x0, xtol=1e-10, rtol=1e-12, M=100):
    """DESCENSO    Calculo de minimos polo metodo do descenso.
    """
    v = [vector(RDF,x0)]
    for k in range(M):
        z = -vector(RDF,df(*v[k]))
        if norm(z) < xtol:
            print('Gradiente nulo, posible minimo.')
            return v[k],k+1,v
        z = z/norm(z)
        #pos:0     1         2     3
        a = [None, 0.,       None, 1.]
        g = [None, n(f(*v[k])), None, n(f(*(v[k]+a[3]*z)))]
        while g[1] <= g[3]:
            a[3] = a[3]/2
            g[3] = n(f(*(v[k]+a[3]*z)))
            if a[3] < xtol:
                print('Sen mellora, posible minimo.')
                return v[k],k+1,v
        a[2] = a[3]/2
        g[2] = n(f(*(v[k]+a[2]*z)))
        #pos:   0     1                 2                        3
        h    = [None, (g[2]-g[1])/a[2], (g[3]-g[2])/(a[3]-a[2]), None]
        h[3] = (h[2]-h[1])/a[3]
        a[0] = (a[2]-h[1]/h[3])/2
        g[0] = n(f(*(v[k]+a[0]*z)))
        p = g.index(min(g))
        v.append(vector(RDF,v[k]+a[p]*z))
        if abs(g[1]-g[p]) < rtol:
            print('Valor entre iterantes moi proximo, posible minimo.')
            return v[k+1],k+1,v
    raise RuntimeError('Excedeuse o numero maximo de iteracions.')
