import inspect
from mpmath import fp

def newton(f, df, x0, xtol=1e-12, rtol=1e-14, M=100):
    """NEWTON    Calculo de raices polo metodo de Newton multidimensional.
    """
    v = [vector(RDF,x0)]
    for k in range(M):
        dfx = matrix(RDF,df(*v[k]))
        if rank(dfx) < len(x0):
            raise RuntimeError('A matriz xacobiana non ten rango maximo.')
        r = (v[k] - dfx\vector(RDF,f(*v[k])));
        v.append(r)
        # test de parada
        if norm(r - v[k]) < xtol or norm(vector(RDF,f(*r))) < rtol:
            return r, k+2, v
    raise RuntimeError('Excedeuse o numero maximo de iteracions.')
	
def debuxa_newton(f, df, x0, d):
    """DEBUXA_NEWTON     Debuxo dos iterantes do metodo de Newton.
    """
    #iterantes
    r,k,v = newton(f, df, x0)
    # graficas
    args = [(x,d[0],d[1]), (y,d[2],d[3])]
    kwds = {'contours': [0], 'fill': False}
    h1 = contour_plot(f(x,y)[0], *args, cmap=['blue'],  **kwds)
    h2 = contour_plot(f(x,y)[1], *args, cmap=['green'], **kwds)
    h3 = point(v, marker='o', size=50, color='red')+line(v, color='red')
    show(h1+h2+h3)