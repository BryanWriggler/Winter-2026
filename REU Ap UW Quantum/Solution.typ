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

  + Given $ket(u) = x ket(psi_0)+y ket(psi_1)$ WLOG, by multiplying suitable global phase, can assume $x>=0$. We'll also rewrite $y = r e^(i t)$, and $braket(psi_0,psi_1)=|braket(psi_0,psi_1)|e^(i s)$ for $r>=0$ and $t,s in RR$. Notice its norm is given as follow:
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

    Now, let's fully write this in terms of $x$: Given the previous normalization condition, one can rewrite $r$ as a function of $x$ as follow:
    $ &r^2 + r dot 2x|braket(psi_0,psi_1)|cos(s+t) + (x^2-1)=0\ 
    &==> r = -x|braket(psi_0,psi_1)|cos(s+t) pm sqrt(x^2|braket(psi_0,psi_1)|^2 cos^2(s+t)-(x^2-1)) $
    Since $r>=0$, one necessary condition is the term in the square root is nonnegative, namely $1-x^2(1-|braket(psi_0,psi_1)|^2 cos^2(s+t))>=0$, showing $x^2 <= 1/(1-|braket(psi_0,psi_1)|^2 cos^2(s+t))$ (Note: this is well defined, because $0<=|braket(psi_0,psi_1)|^2<1$ and $0<=cos^2(s+t)<=1$, so the denominator is strictly positive). Hence, with assumption $x>=0$, one has $0<=x<=1/(sqrt(1-|braket(psi_0,psi_1)|^2 cos^2(s+t)))$.
    
    With such condition being satisfied (which $r$ is real), one needs to consider $r>=0$ (as this is our assumption), hence one must work with the case where $+$ is in front of the square root (as a necessary condition, since for $r>=0$, maximizing $r^2-x^2$ with fixed $x$ meaning maximizing $r$). 
    
    Now, for maximizing $r^2-x^2$, one will consider the case where $d/(d x)(r^2-x^2)=2r (d r)/(d x)-2 x=0$, and the boundary case $x=0. x=1/sqrt(1-|braket(psi_0,psi_1)|^2 cos^2(s+t))$.

    - For $x=0$, then $r$ simplifies to $pm sqrt(1)$, so take $r>=0$ one has the probability being $1/2+1/2(1-|braket(psi_0,psi_1)|^2)(r^2-x^2) = 1-1/2|braket(psi_0,psi_1)|^2$.

    \ 

    - For $x=1/sqrt(1-|braket(psi_0,psi_1)|^2 cos^2(s+t))$, the term in the square root becomes $1-x^2(1-|braket(psi_0,psi_1)|^2 cos^2(s+t)) = 0$, hence $r$ reduces to $-x|braket(psi_0,psi_1)|cos(s+t)$, which one has the probability being as follow:
      $ 1/2+1/2(1-|braket(psi_0,psi_1)|^2)(r^2-x^2) &= 1/2+1/2(1-|braket(psi_0,psi_1)|^2)x^2(|braket(psi_0,psi_1)|^2 cos^2(s+t)-1)\ 
    &= 1/2-1/2(1-|braket(psi_0,psi_1)|^2)\ 
    &= 1/2|braket(psi_0,psi_1)|^2 $

    \ 

    - For the derivative being $0$, one has $r (d r)/(d x)-x=0$. Which, it becomes the following:
      $ (-x|braket(psi_0,psi_1)|cos(s+t)pm sqrt(1-x^2(1-|braket(psi_0,psi_1))^2cos^2(s+t)))(-x|braket(psi_0,psi_1)|cos(s+t)) $



/*
  \

  - Since $cal(H)^(times.circle n)$ is a $d$-dimensional inner product space, together with $ket(psi_0), ket(psi_1) in cal(H)^(times.circle n)$ be two distinct normalized states (in particular, the list ${ket(psi_0), ket(psi_1)}$ is linearly independent), hence one can extend it to a basis of $cal(H)^(times.circle n)$, say ${ket(psi_0), ket(psi_1),...,ket(psi_(d-1))} subset cal(H)^(times.circle n)$. By performing Gram-Schmidt process, we can form an orthonormal basis, say ${ket(phi_0),ket(phi_1),...,ket(phi_(d-1))} subset cal(H)^(times.circle n)$. Which, one has $ket(phi_0)=ket(psi_0)$, while the second component is given by:
    $ ket(phi_1) &= (ket(psi_1)-braket(psi_0,psi_1)ket(psi_0))/(||ket(psi_1)-braket(psi_0,psi_1)ket(psi_0)||) = (ket(psi_1)-braket(psi_0,psi_1)ket(psi_0))/sqrt(1-|braket(psi_0,psi_1)|^2) $
    Also, as a side note, for each index $k in {0,1,...,d-1}$, the Gram-Schmidt process guarantees $span{ket(psi_0),...,ket(psi_k)} = span{ket(phi_0),...,ket(phi_k)}$. Which, using the orthonormality of the $ket(phi_k)$'s, since $ket(psi_1) in span{ket(phi_0), ket(phi_1)}$ (which $ket(phi_0), ket(phi_1)$ are both orthonormal to all $ket(phi_k)$ with $k>=2$), then one has $ket(psi_1)$ being orthogonal to all $ket(phi_k)$ with $k>=2$, or $braket(phi_k, psi_1)=0$ for all $k>=2$.

  \ 

  - Let $ket(u)$ be a normalized state corresponding to the projection operator, we'll denote it as $ket(u) = sum_(k=0)^(d-1)a_k ket(phi_k)$, for $a_k in CC$ that satisfies $braket(u,u)=sum_(k=0)^(d-1)|a_k|^2 = 1$. WLOG, by multiplying a suitable global phase, one can assume $a_1>=0$. Then, the projection operator is of the following form:
    $ ket(u)bra(u) = sum_(k=0)^(d-1)sum_(l=0)^(d-1)a_k a_l^* ket(phi_k)bra(phi_l) $
    The measurement outcome $0$ will be read off from $II-ketbra(u)$, while the measurement outcome $1$ will be read off from $ketbra(u)$.

  \

  \ 

  #text(weight: "bold")[II. Calculating Distinguishing Success Probability:]

  To calculate $"Pr"[0 | psi_0], "Pr"[1 | psi_1]$, we have the following:
  $ "Pr"[0 | psi_0] &= braket(psi_0, (II-ketbra(u)), psi_0) = 1-braket(psi_0,u)braket(u,psi_0)\
  &=1-sum_(k=0)^(d-1)sum_(l=0)^(d-1)a_k a_l^* braket(phi_0,phi_k)braket(phi_l,phi_0)\ 
  &= 1-sum_(k=0)^(d-1)sum_(l=0)^(d-1)a_k a_l^* delta_(0 k)delta_(0 l) = 1-a_0 a_0^* = 1-|a_0|^2 $
  (Note: This is due to the Gram-Schmidt process, causing $ket(phi_0)=ket(psi_0)$).
  $ "Pr"[1 | psi_1] =& braket(psi_1, u)braket(u, psi_1) = sum_(k=0)^(d-1)sum_(l=0)^(d-1)a_k a_l^* braket(psi_1,phi_k)braket(phi_l,psi_1)= sum_(k=0)^(1)sum_(l=0)^(1)a_k a_l^*braket(psi_1,phi_k)braket(phi_l,psi_1)\ 
  =& |a_0|^2 dot |braket(psi_0,psi_1)|^2 + a_0 a_1^* braket(psi_1,psi_0)(braket(psi_1,psi_1)-|braket(psi_0,psi_1)|^2)/(sqrt(1-|braket(psi_0,psi_1)|^2)) \
  &+ a_1a_0^* braket(psi_0,psi_1)(braket(psi_1,psi_1)-|braket(psi_0,psi_1)|^2)/(sqrt(1-|braket(psi_0,psi_1)|^2))+|a_1|^2 dot #eval(400%) (braket(psi_1,psi_1)-|braket(psi_0,psi_1)|^2)/(sqrt(1-|braket(psi_0,psi_1)|^2))#eval(400%)^2\ 
  =& |a_0|^2 dot |braket(psi_0,psi_1)|^2 + sqrt(1-|braket(psi_0,psi_1)|^2)(a_0 a_1^* braket(psi_1,psi_0)+a_1 a_0^* braket(psi_0,psi_1))+|a_1|^2 dot (1-|braket(psi_0,psi_1)|^2) $
  (Note: This relies on Gram-Schmidt again, where $ket(phi_1)=(ket(psi_1)-braket(psi_0,psi_1)ket(psi_0))/(sqrt(1-|braket(psi_0,psi_1))|^2)$)
  
  Which, if denote $braket(psi_0,psi_1) = r e^(i t)$ for $r = |braket(psi_0,psi_1)|$ (with $0<=r<1$) and $t in [0,2pi)$, $a_1 = |a_1| dot e^(i s)$ for $s in [0,2pi)$, and under the assumption $a_0>=0$, then the distinguishing success probability becomes:
  $ &(1/2"Pr"[0 | psi_0] + 1/2"Pr"[1 | psi_1])_(ket(u))\ 
  &= 1/2+1/2(1-r^2)(|a_1|^2-a_0^2)+ 1/2 a_0 sqrt(1-r^2)dot 2 Re(a_1 braket(psi_0,psi_1))\ 
  &= 1/2+1/2(1-r^2)(|a_1|^2-a_0^2)+a_0 sqrt(1-r^2)cos(s+t) $
  (Note: This formula is for arbitrary $ket(u) = sum_(k=0)^(d-1)a_k ket(phi_k)$ with $a_0>=0$),

  \ 

  \ 

  #text(weight: "bold")[III. Solutions:]

  + To show that one only needs to check $ket(u) in span{ket(psi_0), ket(psi_1)}$, we'll show that if $ket(u) in.not span{ket(psi_0), ket(psi_1)}$, there exists some other normalized state $ket(u') in span{ket(psi_0), ket(psi_1)}$, such that ${ketbra(u',u'), II-ketbra(u',u')}$ generates a higher distinguishing success probability.

    Suppose $ket(u) in.not span{ket(psi_0), ket(psi_1)}$, this implies some $a_2,...,a_(d-1) in CC$ are nonzero, say $i_1,...,i_k in {2,...,d-1}$ are all distinct indices (other than indices $0,1$) such that each $a_(i_j)!=0$. This implies the following: 
    $ 1 = braket(u,u) = sum_(j=0)^(d-1)|a_j|^2 = |a_0|^2+|a_1|^2 + sum_(j=1)^k |a_(i_j)|^2 $ 
    since the remaining coefficients are $0$). 
    
    Then, consider the state $ket(u') = (sqrt(|a_0|^2+sum_(j=1)^d|a_(i_j)|^2))ket(psi_0)+a_1 ket(psi_1)$. Which, $ket(u') in span{ket(psi_0),ket(psi_1)}$, and moreover it satisfies the following: 
    $ braket(u',u') = #eval(400%)sqrt(|a_0|^2+sum_(j=1)^k|a_(i_j)|^2)#eval(400%)^2 + |a_1|^2 = |a_0|^2+|a_1|^2 + sum_(j=1)^k|a_(i_j)|^2 = 1 $
    This shows that $ket(u')$ is perfectly normalized. On the other hand, notice that the distinguishing success probability of $ket(u')$ is given as follow:
    $ (1/2 "Pr"[0 | psi_0]+1/2 "Pr"[1 | psi_1])_(ket(u')) &= 1/2+1/2(#eval(400%)sqrt(|a_0|^2+sum_(j=1)^k|a_(i_j)|^2)#eval(400%)^2 - |a_1|^2)\ 
    &= 1/2+1/2(|a_0|^2+sum_(j=1)^k |a_(i_j)|^2 - |a_1|^2)\
    &>1/2+1/2(|a_0|^2-|a_1|^2)\ 
    &= (1/2 "Pr"[0 | psi_0]+1/2 "Pr"[1 | psi_1])_(ket(u)) $
    This strict inequality holds because each $a_(i_j)!=0$, showing $|a_(i_j)|^2>0$. Which, this demonstrates that $ket(u') in span{ket(psi_0),ket(psi_1)}$ generates a higher distinguishing success probability than $ket(u)$, providing that $ket(u) in.not span{ket(psi_0), ket(psi_1)}$.

    hence, we conclude that any $ket(u) in.not span{ket(psi_0),ket(psi_1)}$ CANNOT maximize the distinguishing success probability (since one can always choose some other normalized state with higher probability). Which, one only needs to check $ket(u)$ that lies in the span of $ket(psi_0),ket(psi_1)$.

    \ 

    \ 

  + Suppose $ket(u) = x ket(psi_0)+y ket(psi_1)$ is a normalized state maximizing the distinguishing success probability (which, $braket(u,u)=|x|^2+|y|^2=1$, showing $|x|,|y| in [0,1]$). WLOG, by multiplying with suitable global phase, one can assume $x in[0,1]$. 
  
    Then, notice that $|y|^2 = 1-|x|^2 =1-x^2$, which shows the following for the distinguishing success probability:
    $ (1/2 "Pr"[0 | psi_0]+1/2 "Pr"[1 | psi_1])_(ket(u)) &= 1/2+1/2(|x|^2-|y|^2)\ 
    &= 1/2+1/2(x^2-(1-x^2))\ 
    &= x^2 $
  */
]