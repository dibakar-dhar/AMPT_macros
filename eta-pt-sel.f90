!===================================================================!
! Developed by : Dibakar Dhar										!
! Compiled with: gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.2) 	!
! Status: Compiled with no errors (on Dt. 03.06.2024)				!
! Description: this program extracts eta and pt 
!===================================================================!
		integer i,j,n
		integer tevent,temp,nop,pid,k
		real(kind=8) :: px,py,pz,m,x,y,z,t,mxpt,mnpt
		real(kind=8) :: eta(1000000),pt(1000000)
!=======================================================
		tevent=100000  ! tevent = no. of total event
!=======================================================
		open(unit=1,file="ampt.dat")	! input file name
		open(unit=2,file="eta_ampt2tev.dat") ! output file name
!=======================================================
		mxpt=0
		mnpt=1
		do i=1,tevent
			read(1,*) temp, temp, nop ! nop= no of particles in event
			k=0	! k is counting no. of pions
			do j=1,nop
				read(1,*) pid,px,py,pz,m,x,y,z,t
				if((abs(int(pid)).eq.211).or.(abs(int(pid)).eq.111)) then		
					k=k+1
					eta(k)=atanh(pz/sqrt(px**2+py**2+pz**2+m**2)) 
					pt(k) = sqrt(px**2+py**2)
				endif		
			enddo
			
			
			!=======================================================
			! writing output
			!=======================================================
			write(2,10) i, k
10 	format(i8,x,i8)
			do j=1,k
			if(pt(j).gt.mxpt) then
			  mxpt=pt(j)
			endif
			if(pt(j).lt.mnpt) then
			  mnpt=pt(j)
			endif
		    write(2,20) j, eta(j), pt(j)	
20	format(i8,2x,f7.3,2x,f7.3)	
			enddo
		write(*,*) "Event",i, "Completed.",mxpt
		enddo
		write(*,*) "============================================"
		write(*,*) "max value of pt is:", mxpt
		write(*,*) "min value of pt is:", mnpt
!=======================================================
		write(*,*) "============================================"
		write(*,*) " "
		write(*,*) "Everything is done properly thank you....."
		write(*,*) " "
		write(*,*) "============================================"
		stop
		end
!=======================================================	
