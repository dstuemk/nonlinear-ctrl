## Non-Linear Control

In this MATLAB-Script two feedback controllers for stabilizing a non-linear dynamical system are compared. The system is described by the following differential equation:
![System Equation](https://latex.codecogs.com/svg.image?\dot{x}_1=x_2&space;-&space;x_1^3&space;)
![System Equation](https://latex.codecogs.com/svg.image?\dot{x}_2=u&space;)

Control strategies:
* [**Backstepping control**](https://en.wikipedia.org/wiki/Backstepping)  Recursive design where in each step one state variable get's controled. The resulting closed loop system leads to asymptotic stability.
* [**Lyapuov based control**](https://en.wikipedia.org/wiki/Control-Lyapunov_function)  A positive definite "pseudo-energy" energy function ![V(x)](https://latex.codecogs.com/svg.image?\inline&space;V(x)=||&space;x&space;||^2) is defined. The control law aims to make the derivative of this function negative (semi-)definite. This leads to a closed loop system which loses energy over time.

Phase portrait:
![Image of phase portrait](phase-portrait.png)