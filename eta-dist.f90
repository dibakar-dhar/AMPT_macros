		integer i,j,N,mul(110000),c,cu,dndpt(990000)
		real rap(110000,1000), pt(110000,1000)
		real o,f,avmul,sqav,avsq
		real error,error1
		real le,re,step,run,a(990000)
		real dpt(990000),dpta(990000)

		open(unit=1,file="2tev.dat")
		N= 100000  ! enter no. of events
		o=0  ! calculating nultiplicity
		f=0  ! calculating square of multiplicity
		do i=1,N
		  read(1,*) nev, mul(i)
		  o=o+mul(i)
          f=f+(mul(i)*mul(i))
		  do j=1,mul(i)
		    read(1,*) temp, rap(i,j), pt(i,j)
		  enddo
		enddo
		
		avmul=o/N  ! average multiplicity
		sqav=f/N   ! average of the square of multiplicity
		avsq=(avmul*avmul) ! average multiplicity
		error=sqrt(sqav-avsq)/sqrt(real(N)) ! calculating error per event
		error1=sqrt(sqav-avsq) ! calculation over all error
		write(*,*) "================================================="
		write(*,*) "Sqrt(Avg. Mul.: )",sqav, avsq
		write(*,*) "================================================="
		write(*,*) "Total No. of event: ",N
		write(*,*) "Total multiplicity: ",o
		write(*,*) "Average multiplicity: ", avmul
		write(*,*) "Total error in average multiplicity: ",error1
		write(*,*) "Error per event in average multiplicity: ",error
		write(*,*) "================================================="
		open(unit=2,file="backup.dat")
		c=0
		do i=1,N
		  do j=1,mul(i)
		    if((rap(i,j).gt.0).and.(rap(i,j).lt.0.5)) then
		      c=c+1
		      write(2,10) pt(i,j),rap(i,j),c
		      a(c)=pt(i,j)
		    endif
		  enddo
		enddo
10		format(f7.3,2x,f7.3,2x,i8)
		

		le=10.0 !left edge value
		re=40. ! right edge value
		step=0.1 ! step size
		run=(re-le)/step !no. of cycle
		
		j=1
20		rh=le+step
		if(rh.gt.re) goto 30
		cu=0
		do i=1,c
		  if((a(i).gt.le).and.(a(i).lt.rh)) then
		    cu=cu+1
		  endif		  
		enddo    		
		dpt(j)=le
		dndpt(j)=cu
		dpta(j)=cu/N
		j=j+1
		le=le+step 
		write(*,*) j,N, le, rh, cu, dndpt(j)
		goto 20

30		write(*,*) "Calculation Completed. Writing output."
		
		open(unit=3,file="output.dat")
		open(unit=4,file="log-output.dat")
		do i=1,j-1
		  write(3,40) dpt(i), dndpt(i)
		  write(4,*) log(dpt(i)), log(float(dndpt(i))/float(N))
		enddo
40		format(f7.3,2x,i8,f9.6)	
	
		write(*,*) "================================================="						
		write(*,*) "Work Done... Thank You.."		
		write(*,*) "================================================="
		stop
		end
