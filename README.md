# Non-Linear Control

In this MATLAB-Script two feedback controllers for stabilizing a non-linear dynamical system are compared. The system is described by the following differential equation:

![System Equation](https://latex.codecogs.com/svg.image?\dot{x}_1=x_2&space;-&space;x_1^3&space;)

![System Equation](https://latex.codecogs.com/svg.image?\dot{x}_2=u&space;)

## Control strategies
### [Backstepping control](https://en.wikipedia.org/wiki/Backstepping)  
Recursive design where in each step one state variable get's controled. The resulting closed loop system leads to asymptotic stability.

### [Lyapuov based control](https://en.wikipedia.org/wiki/Control-Lyapunov_function)
A positive definite "pseudo-energy" energy function ![V(x)](https://latex.codecogs.com/svg.image?\inline&space;V(x)=||&space;x&space;||^2) is defined. The control law aims to make the derivative of this function negative (semi-)definite. This leads to a closed loop system which loses energy over time.

![Equation lyapunov](https://latex.codecogs.com/svg.image?\inline&space;\begin{align*}V(x)&space;&=&space;||x||^2&space;=&space;x_1^2&space;&plus;&space;x_2^2&space;\\\\\dot{V}(x)&space;&=&space;\frac{\partial&space;V}{\partial&space;x_1}\dot{x}_1&space;&plus;&space;\frac{\partial&space;V}{\partial&space;x_2}\dot{x}_2&space;\\&=&space;2&space;x_1&space;(x_2&space;-&space;x_1^3)&space;&plus;&space;2&space;x_2&space;u&space;\\\\0&space;&\geq&space;\dot{V}(x)&space;\geq&space;x_1&space;x_2&space;-&space;x_1^4&space;&plus;&space;x_2&space;u&space;\geq&space;x_2&space;(&space;x_1&space;&plus;&space;u&space;)&space;\\\\\text{with&space;}&space;u&space;&:=&space;-\alpha&space;(x_2&space;&plus;&space;x_1)&space;\text{,&space;}&space;\alpha&space;\in&space;\mathbb{R}_&plus;&space;\implies&space;\dot{V}(x)&space;=&space;-x_2^2&space;\leq&space;0\end{align})

## Phase portrait
![Image of phase portrait](https://github.com/code2love/nonlinear-ctrl/raw/main/phase-portrait.png)