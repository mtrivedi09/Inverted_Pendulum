# Inverted_Pendulum

Controllability and Observability of the system.<p>
Determining the gain if the system has state-feedback based on a time costraint to stabalize.<p>
Gain margin - point where the LTI system loses its asymptotic stability.<p>
Designing a state-feedback and output-feedback system which follows a constant and variable command.<p>
![ ](Images/Rotary%20inverted%20pendulum%20system.JPG)
  
In this project task, we will focus on the command following problem for two types of systems.<p>

# 1) STATE-FEEDBACK SYSTEM
In particular, assume that the state vector 𝑥(𝑡) is available for feedback. Design a state-feedback control structure of your choice in order to make 𝜃(𝑡) to follow the time-varying command 𝑐 𝑡 = cos (𝛽𝑡). Here, consider that the initial condition is 𝑥: = 0 0 0 0 ;. In your design, you must satisfy the following requirements:<p>
a. 𝜃(𝑡) needs to converge to command 𝑐 around 𝑇 seconds, where 1.5 < 𝑇 < 3. 𝜃(𝑡) can
make some acceptable level of oscillations, but not excessive (i.e., try your best to avoid
oscillations as much as you can, significant oscillations are not acceptable for 𝜃(𝑡)).<p>
b. 𝛼(𝑡) needs to converge to zero around 𝑇 seconds, where 0.5 < 𝑇 < 4.<p>
c. Control signal 𝑢(𝑡) needs to stay between -20 and 20 volts (i.e., −20 ≤ 𝑢 𝑡 ≤ 20).<p>

# 2) OUTPUT-FEEDBACK SYSTEM
Specifically, design an output-feedback control structure of your choice in order to make 𝜃(𝑡) to follow the constant command 𝑐 = 1.5 radians. Here, consider that the initial condition is 𝑥: = [0.02 0.04 − 0.02 − 0.04]^T ;. In your design, you must satisfy the following requirements:<p>
a. 𝜃(𝑡) needs to converge to command 𝑐 around 𝑇 seconds, where 1.5 < 𝑇 < 3. 𝜃(𝑡) can make some acceptable level of oscillations, but not excessive (i.e., try your best to avoid oscillations as much as you can, significant oscillations are not acceptable for 𝜃(𝑡)).<p>
b. 𝛼(𝑡) needs to converge to zero around 𝑇 seconds, where 0.5 < 𝑇 < 4.<p>
c. Control signal 𝑢(𝑡) needs to stay between -20 and 20 volts (i.e., −20 ≤ 𝑢 𝑡 ≤ 20).<p>
