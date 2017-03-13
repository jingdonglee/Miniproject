"""
这个版本实现的是C函数调用
"""

cdef extern from "math.h":
    float cosf(float theta)
    float sinf(float theta)
    float acosf(float theta)

cdef float _great_circle(float lon1,float lat1,float lon2,float lat2):
    cdef float radius=3956.0
    cdef float pi=3.14159265
    cdef float x=pi/180.0
    cdef float a,b,theta,c

    a=(90-lat1)*(x)
    b=(90-lat2)*(x)
    theta=(lon2-lon1)*(x)
    c=acosf((cosf(a)*cosf(b))+(sinf(a)*sinf(b)*cosf(theta)))

    return radius*c

def great_circle(float lon1,float lat1,float lon2,float lat2,int num):
    cdef int i
    cdef float x
    for i from 0<=i<num:
        x=_great_circle(lon1,lat1,lon2,lat2)
    return x