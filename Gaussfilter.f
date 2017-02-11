c-----*----------------------------------------------------6---------7--
      subroutine guassfilter_2(n,m,x,y)
c     M-term Guassian-Type Filter
c     Input variables: n, x(n), m
c        m: the term number used to running mean
c           it must be an odd number.
c     Output variables: y(n),z(n-m-1)
c        y: the filtered series of x.
c     Work parameters and array: c, cgm and ck(-(m-1)/2:(m-1)/2)
c        c: a tunable parameter, generally, c>2.0.
c      cgm: variance of Guassian distribution.
c     By Dr. LI Jianping, April 6, 2001.
      dimension x(n),y(n)
      dimension xw((-(m-1)/2+1):(n+(m-1)/2)),ck(-(m-1)/2:(m-1)/2) !work array
      undef=-9.99e33
      pi=3.1415926
      c=2.15
      nl=(m-1)/2
      cgm=float(nl)/c
      x1=x(1)
      xn=x(n)
      if(x(1).eq.undef)x1=x(2)
      if(x(n).eq.undef)xn=x(n-1)
      do i=-nl+1,1
        xw(i)=x1
      enddo
      do i=2,n-1
        xw(i)=x(i)
      enddo
      do i=n,n+nl
        xw(i)=xn
      enddo
      c1=1./(cgm*sqrt(2.*pi))
      ck(0)=c1
      do 10 i=1,nl
        ck(i)=c1*exp(-i*i/(2.*cgm*cgm))
        ck(-i)=ck(i)
  10  continue
      do 20 i=1,n
        y(i)=0.
        do j=-nl,nl
          y(i)=y(i)+ck(j)*xw(i+j)
        enddo
  20  continue
      if(x(1).eq.undef)y(1)=undef
      if(x(n).eq.undef)y(n)=undef
      return
      end