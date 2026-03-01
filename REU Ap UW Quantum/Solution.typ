#import "../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *
#import "@preview/physica:0.9.8": *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.penumbra-light,  
    styles: ergo-styles.basic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "UW Quantum REU Solution",
  authors: ("Zih-Yu Hsieh",),
  //date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(i)")

#problem("Distinguishing between two states")[
  Let $n in NN$, Suppose you are handed #emph[one] of two $n$-qubit states $ket(psi_0), ket(psi_1)$ uniformly at random. Assume that you know exactly what the two states are: you just don't know #emph[which one] of the two you are given. Assume also that the two states are not identical (differing only by a global phase still counts as being identical here). In this question you will find the projective measurement ${P, II-P}$ that maximizes the distinguishing success probability, i.e. it maximizes
  $ 1/2"Pr"[0 | psi_0] + 1/2"Pr"[1 | psi_1] $
  where $"Pr"[i | psi_i]$ denotes the probability that the measurement outcome is $i$, given that the state was $ket(psi_i)$.

  \

  + #emph[Carefully] show that, without loss of generality, you can restrict your search to the 2-dimensional space spanned by $ket(psi_0)$ and $ket(psi_1)$, i.e. you can restrict yourself to consider measurements of the form 
    $ {ket(u)bra(u), II - ket(u)bra(u)} $
    where $ket(u)$ lies in the span of $ket(psi_0)$ and $ket(psi_1)$
    
    (You should try to make this proof as rigorous as possible -- this queston is more subtle than meets the eye!).

    \ 

  + Find the optimal measurement, and show that it is optimal.

  \ 

  #line(length: 100%)

  \ 

][
  
  Let $cal(H)$ denote the Hilbert Space of the $n$-qubit system (which $dim cal(H) = 2^n$). Let $V = span{ket(psi_0),ket(psi_1)}$ be the 2-dimensional linear subspace of $cal(H)$ (by the assumption that $ket(psi_0), ket(psi_1)$ are distinct states, hence they're linearly independent), then $cal(H) = V plus.circle V^perp$. 

  Here, if $ket(phi)$ is a normalized state, we'll use $braket(phi,u)braket(u,phi)=;"Pr"[1 | phi]$ (probability of having measurement outcome 1 given state $ket(phi)$), while $braket(phi,(II-ketbra(u)),phi) = 1-braket(phi,u)braket(u,phi) =: "Pr"[0 | phi]$ (probability of having measurement outcome 0 given state $ket(phi)$).

  \

  + Let $ket(u) in cal(H)$ be any normalized states, then notice that $ket(u) = ket(v) + ket(w)$ for unique $ket(v) in V$ and $ket(w) in V^perp$. Which, since $ket(psi_0),ket(psi_1),ket(v) in V$ while $ket(w) in V^perp$, one has $braket(w,psi_0)=braket(w,psi_1)= braket(w,v)=0$. Also, the noralization condition provides the following equality:
    $ 1= braket(u) = braket(v)+braket(w)+braket(v,w)=braket(v)+braket(w) $
    Hence, the inner product property guarantees $0<= braket(v)<=1$, and $braket(v)=1$ iff $braket(w)=0$ iff $ket(w)=0$ iff $ket(u)=ket(v) in V$.

    \ 
    
    Now, write the corresponding projection operator, one has the following:
    $ ketbra(u) = ketbra(v,v)+ketbra(v,w)+ketbra(w,v)+ketbra(w,w) $
    Hence, the component of the distinguishing success probability -- $"Pr"[0 | psi_0]$ and $"Pr"[1 | psi_1]$ are given as follow:
    $ "Pr"[1 | psi_1] &= braket(psi_1,u)braket(u,psi_1) = braket(psi_1,v)braket(v,psi_1) $
    $ "Pr"[0 | psi_0] &= 1-braket(psi_0,u)braket(u,psi_0) = 1-braket(psi_0,v)braket(v,psi_0) $
    Which, this is the consequence of $braket(w,psi_0)=braket(w,psi_1)=0$.

    Then, the distinguishing success probability becomes:
    $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u)) &= 1/2 + 1/2(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0)) $
    Now, there are two cases to consider: 
    - If $ket(v)=0$, then the above probability simply reduces to $1/2$. Which, let's consider $ket(u') = ket(psi_0)+ket(psi_1) in V$ (which is a nonzero vector by linear independence of $ket(psi_0), ket(psi_1)$), and consider $ket(v'):= (ket(u'))/(sqrt(braket(u')))$ (the normalized version of $ket(u')$). Notice with respect to this state, one has the distinguishing success probability as follow:
      $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(v')) =& 1/2 + 1/2(braket(psi_1,v')braket(v',psi_1)-braket(psi_0,v')braket(v',psi_0))\ 
      \
      =& 1/2 + 1/(2braket(u'))(braket(psi_1,u')braket(u',psi_1)-braket(psi_0,u')braket(u',psi_0))\ 
      \
      =& 1/2 + 1/(2braket(u',u'))(braket(psi_1, (ketbra(psi_0,psi_0)+ketbra(psi_0,psi_1)+ketbra(psi_1,psi_0)+ketbra(psi_1,psi_1)), psi_1))\ 
      &- 1/(2braket(u',u'))(braket(psi_0, (ketbra(psi_0,psi_0)+ketbra(psi_0,psi_1)+ketbra(psi_1,psi_0)+ketbra(psi_1,psi_1)), psi_0))\ 
      \
      =& 1/2+1/(2braket(u'))(|braket(psi_0,psi_1)|^2+braket(psi_1,psi_0)+braket(psi_0,psi_1)+1)\ 
      &-1/(2braket(u'))(1+braket(psi_1,psi_0)+braket(psi_0,psi_1)+|braket(psi_0,psi_1)|^2)\ 
      =&1/2  $
      Hence, considering the normalized state $ket(v') in V$, one can achieve the same distinguishing success probability.

    \ 

    - If $ket(v)!=0$, consider the new state $ket(u'):= (ket(v))/(sqrt(braket(v))) in V$ (i.e. the normalized $ket(v)$), and also any normalized vector $ket(w') in V$ such that $braket(u',w')=0$ (i.e. orthogonal to $ket(u')$). 

      Which, ${ket(u'), ket(w')} subset V$ is an orthonormal list, hence linearly independent; also, with $dim V=2$, they form a basis. Hence, for any vector $ket(phi) in V$, its decomposition becomes $ket(phi) = braket(u',phi)ket(u')+braket(w',phi)ket(w')$, implying that $braket(phi) = |braket(u',phi)|^2+|braket(w',phi)|^2$ by the orthonormality, or $|braket(w',phi)|^2 = braket(phi)-|braket(u',phi)|^2$. In particular if choosing $ket(phi) in V$ as a normalized vector (for instance, $ket(phi)=ket(psi_0), ket(psi_1)$), this reduces to $|braket(w',phi)|^2 = 1-|braket(u',phi)|^2$.

      \ 
    
      Then, notice the new distinguishing successive probability of $ket(u'), ket(w')$ becomes the following:
      $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u')) &= 1/2+1/2(braket(psi_1,u')braket(u',psi_1)-braket(psi_0,u')braket(u',psi_0))\ 
      &= 1/2+1/(2braket(v))(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0)) $
      $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(w')) &=1/2+1/2(braket(psi_1,w')braket(w',psi_1)-braket(psi_0,w')braket(w',psi_0))\ 
      &= 1/2+1/2(|braket(w',psi_1)|^2-|braket(w',psi_0)|^2)\ 
      &= 1/2+1/2((1-|braket(u',psi_1)|^2)-(1-|braket(u',psi_0)|^2))\ 
      &= 1/2-1/2(braket(psi_1,u')braket(u',psi_1)-braket(psi_0,u')braket(u',psi_0))\ 
      &= 1/2-1/(2braket(v))(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0)) $
      Which, if $(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0))>=0$, then the following inequality holds because $braket(v)<=1$:
      $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u')) &= 1/2+1/(2braket(v))(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0))\ 
      &>= 1/2+1/(2)(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0))\ 
      &= (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u)) $
      Else if $(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0))<0$, then the following inequality holds:
      $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(w'))&= 1/2-1/(2braket(v))(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0))\ 
      &>1/2+1/(2)(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0))\ 
      &= (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u)) $
      Hence, one can choose states in $V$, such that the distinguishing success probability is at least $(1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u))$.

    \

    Since for any normalized $ket(u) in cal(H)$, in either cases, one can always choose normalized state $ket(u') in V = span{ket(psi_0),ket(psi_1)}$ such that the distinguishing success probability is at least the same as $ket(u)$, for maximizing the probability, one just need to consider $span{ket(psi_0),ket(psi_1)}$.

    \ 

    \ 

    \ 

  + There is one trivial case we'll deal with first (to prevent exception). Sppose $braket(psi_0,psi_1)=0$ (i.e. the two states are orthonormal), then choosing $ket(u):= ket(psi_1)$ (where if $ket(v) in V$ and $ket(w) in V^perp$ has $ket(u)=ket(v)+ket(w)$, then $ket(w)=0$ and $ket(v)=ket(u)$) has the above distinguishing success probability becomes the following:
    $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u)) &= 1/2 + 1/2(braket(psi_1,v)braket(v,psi_1)-braket(psi_0,v)braket(v,psi_0))\ 
    &= 1/2+1/2(1-0) = 1 $
    Which, the probability can be maximized to $1$, and it's definitely an optimal measurement.

    \ 

    \ 

    Afterward, we'll assume $braket(psi_0,psi_1)!=0$. Which,  because $ket(psi_0),ket(psi_1)$ are normalized states which are linearly independent, so $|braket(psi_0,psi_1)|^2 < braket(psi_0)braket(psi_1)=1$ using Cauchy Schwartz, and it's strict inequality because of linear independence. Hence, one has $0<|braket(psi_0,psi_1)|<1$.
  
    Given $ket(u) = x ket(psi_0)+y ket(psi_1)$. WLOG, by multiplying suitable global phase, can assume $x>=0$. We'll also rewrite $y = r e^(i t)$, and $braket(psi_0,psi_1)=|braket(psi_0,psi_1)|e^(i s)$ for $r>=0$ and $t,s in RR$. Notice its norm is given as follow:
    $ braket(u) &= x^2braket(psi_0)+x y braket(psi_0,psi_1) + y^* x braket(psi_1,psi_0)+y^* y braket(psi_1)\ 
    &= x^2 + |y|^2 + 2x Re(y braket(psi_0,psi_1)) \ 
    &= x^2+r^2 + 2 x Re(r|braket(psi_0,psi_1)|e^(i(s+t)))\ 
    &= x^2+r^2+2x r |braket(psi_0,psi_1)| cos(s+t) $
    So, for $ket(u)$ to be normalized, one first need $x^2+r^2+2x r |braket(psi_0,psi_1)| cos(s+t)=1$.

    \ 

    On the other hand, the distinguishing success probability of $ket(u)$ is given as:
    $ (1/2"Pr"[0 | psi_0]+1/2"Pr"[1 | psi_1])_(ket(u)) =& 1/2 + 1/2(braket(psi_1,u)braket(u,psi_1)-braket(psi_0,u)braket(u,psi_0))\ 
    \
    =& 1/2+1/2(|y+x braket(psi_1,psi_0)|^2-|x+y braket(psi_0,psi_1)|^2)\ 
    \
    =& 1/2+1/2(y y^*+x y braket(psi_0,psi_1) + x y^* braket(psi_1,psi_0) + x^2|braket(psi_0,psi_1)|^2)\ 
    &-1/2(x^2 + x y^* braket(psi_1,psi_0) + x y braket(psi_0,psi_1)+y y^* |braket(psi_0,psi_1)|^2)\ 
    \
    =& 1/2+1/2(1-|braket(psi_0,psi_1)|^2)(|y|^2-x^2)\ 
    \
    =& 1/2+1/2(1-|braket(psi_0,psi_1)|^2)(r^2-x^2)  $
    With $0<=|braket(psi_0,psi_1)|^2 <=braket(psi_0)braket(psi_1)=1$ by Cauchy Schwartz (in fact, $|braket(psi_0,psi_1)|^2 < 1$ because $ket(psi_0),ket(psi_1)$ are linearly independent), the term $(r^2-x^2)$ has nonnegative coefficient. Hence, to maximize the probability, it suffices to maximize $r^2-x^2$.

    \ 

    Now, we'll denote $theta := s+t$ (where $t$ is the changing variable, but for simplicity purpose), and also $a:= |braket(psi_0,psi_1)|$ to simplify the equation (where $0<a < 1$). 
    
    Then, the above question becomes: minimizing $f(r,x,theta)= r^2-x^2$, given the constraint $g(r,x,theta) = x^2+r^2+2x r a cos(theta)-1 = 0$. Hence, using Lagrange Multiplier, if $(x,r,theta)$ maximizes $f$ while satisfying the constraint, there exists a unique $lambda in RR$, such that $nabla f(x,r,theta) = lambda nabla g(x,r,theta)$. Which, we get the following equation:
    $ (-2x, 2r, 0)=nabla f = lambda nabla g = lambda(2x+2r a cos(theta), 2r+2x a cos(theta), -2x r a sin(theta)) $
    Since $ket(u)$ is assumed to be a nonzero state, one must have one of $x,r=|y|$ be nonzero. In particular, this forces $lambda !=0$ (as if $lambda = 0$, $nabla f = (-2x,2r,0)=0$, enforcing $x,r=0$, which is a contradiction).

    Then, the third entry of the equality implies that $-2 lambda x r a sin(theta)=0$, or $x r sin(theta)=0$. There are three case to consider, either $x=0, r=0$, or $sin(theta)=0$:
    - If $x=0$, $r!=0$ is being enforced. Plug it into $g$, one has the following equality:
      $ g(r,x,theta) = x^2+r^2+2 x r a cos(theta)-1 = r^2=0 $
      Which implies that $r=0$, but this is a contradiction to $r!=0$.

      \ 

    - If $r=0$, $x!=0$ is being enforced. Plug it into $g$, one has the following equality:
      $ g(r,x,theta) = x^2+r^2+2 x r a cos(theta)-1 = x^2 = 0 $
      Which implies that $x=0$, but this again contradicts with $x!=0$.

      \ 

    Hence, the only possibility is having $sin(theta)=0$ and $x,r!=0$, enforcing $cos(theta)=pm_1 1$. Plug this result into the first two entries of the Lagrange Multiplier, we get:
    $ &-2x = lambda(2x pm_1 2r a), quad 2 r = lambda(2r pm_1 2x a) $
    where the $pm$ is by $cos(theta)$ (which hasn't been determined yet). Then, the two equalities simplify to the following:
    $ &-x = lambda x pm_1 lambda a r, quad r = lambda r pm_1 lambda a x $
    Which, the second equality states $(1-lambda)r = pm_1 lambda a x$. With $lambda, a, r, x!=0$, this enforces $1-lambda !=0$ (or $lambda!=1$). Hence, one gets $r = pm (lambda a x)/(1-lambda)$. Plugin to the first equality (which shows $-(1+lambda)x = pm_1 lambda a r$, or $x = mp_1 (lambda a r)/(1+lambda)$), one has:
    $ x = mp_1 (lambda a r)/(1+lambda) = -(lambda^2 a^2 x)/(1-lambda^2) $
    Hence, $(1-lambda^2)x = -lambda^2 a^2 x$, or $(1-lambda^2(1-a^2))x=0$. With $x!=0$, this enforces $1-lambda^2(1-a^2)=0$, or $lambda = pm_2 1/sqrt(1-a^2)$.

    \ 

    Here, plug the two potential $lambda$'s back to the previous equation, we get:
    $ cases(
      (1pm_2 1/sqrt(1-a^2))x pm_1 (pm_2 a/sqrt(1-a^2))r = 0,
      pm_1 (pm_2 a/sqrt(1-a^2))x +(pm_2 1/sqrt(1-a^2)-1)r=0
    ) $
    Because of the requirement $x,r!=0$, such linear system must have nontrivial solution. Which, for any $x>0$, the solution is $r = mp_1 (pm_2 sqrt(1-a^2)/a) (1 pm_2 1/sqrt(1-a^2))x$ (one can check this does satisfy the linear system). 
    
    Also, note that we have the restriction $r>=0$ initially. With $0<a<1$, one has $1-1/sqrt(1-a^2)<0$. Hence, for $r>0$ to happen, the only possible pairs are $(pm_1,pm_2) = (-,+), (-,-)$. In particular, one needs $cos(theta)=-1$ (so, in particular one can choose $theta=pi$).

    Finally, the two cases are given as follow:
    - For $pm_2 = +$ (or $lambda = 1/sqrt(1-a^2)$), the solution is $r=sqrt(1-a^2)/a (1+1/sqrt(1-a^2))x$. Plugin to the equation $g(x,r,theta)=0$, one has:
      $ &g(x,r,theta) = 0 \ 
      &==> x^2+(1-a^2)/a^2 (1+1/sqrt(1-a^2))^2 x^2-2 sqrt(1-a^2)(1+1/sqrt(1-a^2))x^2=1\ 
      &==> x^2 = 1/2 a^2/(1-a^2)1/(1+sqrt(1-a^2))\ 
      &==> r^2-x^2 = [(1-a^2)/a^2 (1+1/sqrt(1-a^2))^2-1]x^2 = 1/sqrt(1-a^2) $
      Hence, the distinguishing success probability for this case is: 
      $ 1/2+1/2(1-a^2)(r^2-x^2) = 1/2+1/2 sqrt(1-a^2) $

      \ 

    - for $pm_2 = -$ (or $lambda = -1/(sqrt(1-a^2))$), the solution is $r=sqrt(1-a^2)/a (1/sqrt(1-a^2)-1)x$. Plugin to the equation $g(x,r,theta)=0$, one has:
      $ &g(x,r,theta)=0\ 
      &==> x^2+(1-a^2)/a^2 (1/sqrt(1-a^2)-1)^2 x^2 - 2 sqrt(1-a^2)(1/sqrt(1-a^2)-1)x^2=1\ 
      &==> x^2 = 1/2 1/(1-sqrt(1-a^2)) a^2/(1-a^2)\ 
      &==> r^2-x^2 = [(1-a^2)/a^2(1/sqrt(1-a^2)-1)^1-1]x^2 = -1/sqrt(1-a^2) $
      Hence, the distinguishing success probability for this case is:
      $ 1/2+1/2(1-a^2)(r^2-x^2)=1/2-1/2sqrt(1-a^2) $
    
    \ 

    Hence, for $pm_2 = +$, one maximizes the the distinguishing success probability. Which, one has $x = a/(sqrt(2)sqrt(1-a^2)sqrt(1+sqrt(1-a^2)))$, and $r = sqrt(1+sqrt(1-a^2))/(sqrt(2)sqrt(1-a^2))$.

    Also, recall that we need $cos(theta) = cos(s+t)=-1$, in particular we chose $theta = pi$. Hence, one has $t = pi-s$ (where $s in RR$ satisfies $braket(psi_0,psi_1) = |braket(psi_0,psi_1)|e^(i s) = a e^(i s)$). So, the optimal measurement has state $ket(u)$ being the following (given that $braket(psi_0,psi_1) = a e^(i s)$ for some $0<a<1$ and $s in RR$):
    $ ket(u) &= x ket(psi_0)+r e^(i t) ket(psi_1)\ 
    &= a/(sqrt(2(1-a^2)(1+sqrt(1-a^2))))ket(psi_0) - sqrt(1+sqrt(1-a^2))/sqrt(2(1-a^2))e^(-i s)ket(psi_1) $
    And, the maximum distinguishing success probability is $1/2+1/2sqrt(1-a^2)$ shown by the Lagrange Multiplier.

]