#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.penumbra-light,  
    styles: ergo-styles.classic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 220B HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Prove or disprove that $ZZ[x]$ is a Euclidean domain.
][
  We'll prove that $ZZ[x]$ is not a Euclidean domain.

  First, recall that any Euclidean domain is a PID, so it suffices to show that $ZZ[x]$ is not a PID.

  \ 

  Consider the ideal $(2,x) subset.eq ZZ[x]$, we claim that it is not a principal ideal: Suppose the contrary that it is a principal ideal, there exists $f(x) in ZZ[x]$, such that $(f(x)) = (2,x)$. In particular, $f(x)!=0$.

  This implies that there exists nonzero polynomials $g(x), h(x) in ZZ[x]$, such that $2 = g(x)h(x)$ and $x = h(x)f(x)$.

  \ 

  Now, recall that since $ZZ[x]$ is an integral domain, then for any nonzero polynomials $f,g in ZZ[x]$, one has $deg(f dot g) = deg(f)+deg(g)$. So, one gets the following:
  $ 0 = deg(2)=deg(g(x)f(x)) = deg(g(x))+deg(f(x)) $
  Since degree is always nonnegative for a polynomial, the above implies $deg(f(x))=deg(g(x))=0$, hence $f(x)=a$ and $g(x)=b$ for some nonzero $a,b in ZZ$.

  \ 

  Then, apply the same logic to the other equality, one gets the following:
  $ 1 = deg(x)=deg(h(x)f(x))=deg(h(x))+deg(f(x)) $
  Since $deg(f(x))=0$ is proven above, it indicates $deg(h(x))=1$, so $h(x) = c x+d$ for some $c,d in ZZ$ (where $c!=0$).

  Which, $x = h(x)f(x) = (c x+d)a = (c a)x + (d a)$, showing that $c a=1$ and $d a = 0$. 
  
  Yet, $c a = 1$ implies that $a$ is a unit, hence $f(x)=a$ is a unit in $ZZ[x]$. This concludes that $ZZ[x] = (a)=(f(x))=(2,x)$.

  \ 

  However, notice that $(2,x)$ is a proper ideal: Suppose it is not proper, there exists $k(x),l(x) in ZZ[x]$, such that $2 dot k(x)+x dot l(x) = 1$. Let's write $k(x)=k_0+k_1 x+...+k_n x^n$ and $l(x)=l_0+l_1 x+...+l_m x^m$. Then, the equality becomes the following:
  $ 1 &= 2 dot k(x)+x dot l(x) = 2(k_0+k_1 x+...+k_n x^n) + x (l_0+l_1 x+...+l_m x^m)\ 
  &= 2 k_0 + (k_1 x+...+k_n x^n)+(l_0 x+l_1 x^2+... +l_m x^(m+1)) $
  Which, the constant term on the left is $1$, while the constant term on the right is $2 k_0$, showing that $1 = 2 k_0$, or $2$ divides $1$. Yet, this is a contradiction. So, $(2,x)$ must be a proper ideal.

  But, if $(2,x)$ is proper, $(2,x) = ZZ[x]$ is another contradiction. So, the initial assumption is false, $(2,x)$ can't be a principal ideal.

  \ 

  Since $ZZ[x]$ has ideals that're not principal, it's not a PID, hence not a Euclidean domain.
]

\ 

= ND//2
#problem[
  Give an example of a commutative ring different from $ZZ$ and polynomial rings, which is not a PID, but whose every nonzero prime ideal is maximal.
][]

\ 

= D//3
#problem[
  Let $R$ be a commutative ring and let $S=R[x]$. Prove or disprove that $U(R)=U(S)$.
][
  We'll give a counterexample:

  \ 

  Choose $R = ZZ_4$, one has $2 in R$ satisfies $2^2 = 4 equiv 0 (mod 4)$, so $2$ is a nilpotent element.

  Now, consider the element $1-2 x in R[x]$, it is a unit, because its square gives the following:
  $ (1-2x)^2 = (1-2x)+(-2x)(1-2x) = 1-2x-2x+2^2x^2 = 1-4x+0x^2 = 1 $
  So, $1-2x$ is a unit in $R[x]$ (with its inverse being itself), or $1-2x in U(S)$ (with $S=R[x]$).

  Yet, $1-2x in.not U(R)$ (when viewing $R$ as a subring of $R[x]$), showing that $U(S) != U(R)$ in this case.
]

\ 

= ND//4
#problem[
  Let $R$ be a commutative ring and $f(x) in R[x]$ be a zero-divisor. Prove or disprove that there exists $a in R$ such that $a f(x) = 0$ in $R[x]$.
][
]

\ 

= ND//5
#problem[
  Prove that every PID is a UFD.
][]

\ 

= ND//6
#problem[
  Let $R$ be a UFD in which every nonzero prime ideal is maximal. Prove or disprove that $R$ is a PID.
][]

\ 

= ND//7
#problem[
  Prove or disprove that $ZZ[x]\/(x^2+5)$ is a PID.
][

]

\ 

= D//8
#problem[
  Let $R$ be a commutative ring and $a,b in R$ be such that $a in Nil(R)$ and $b in U(R)$. Prove or disproe that $a+b in U(R)$.
][
  We'll prove that $b+a in U(R)$.

  \ 

  Given $b$ is a unit and $a$ is nilpotent, there exists $n>0$, such that $a^n = 0$. Also, one can rewrite $b+a = b(1+b^(-1)a)$, which $b^(-1)a$ is also nilpotent (since $(b^(-1)a)^n = b^(-n)a^n = 0$).

  \ 

  Now, we claim that $1+b^(-1)a$ is a unit in $R$: Consider the term $sum_(i=0)^(n-1)(-b^(-1)a)^i$ (where $(-b^(-1)a)^0=1$ by convention), one has the following:
  $ (1+b^(-1)a)(sum_(i=0)^(n-1)(-b^(-1)a)^i) &= sum_(i=0)^(n-1)(-b^(-1)a)^i - (-b^(-1)a)sum_(i=0)^(n-1)(-b^(-1)a)^n\ 
  &= sum_(i=0)^(n-1)(-b^(-1)a)^i - sum_(i=1)^n (-b^(-1)a)^i\ 
  &= (-b^(-1)a)^0 - (-b^(-1)a)^n\ 
  &= 1-0=1 $
  So, one has the following:
  $ (b+a)(b^(-1)sum_(i=0)^(n-1)(-b^(-1)a)^i) = b(1+b^(-1)a)b^(-1)(sum_(i=1)^(n-1)(-b^(-1)a)^i)=1 $
  This shows that $(b+1) in U(R)$.
]

\ 

= D//9
#problem[
  Let $R$ be a commutative ring and $f(x) in R[x]$. Prove or disproev that $f(x) in Nil(R[x])$ iff all coefficients of $f(x)$ lie in $Nil(R)$.
][
  We'll prove the equivalence between the two statements.

  \ 

  $==>:$

  First, suppose $f(x) = a_0+a_1 x+...+a_n x^n in Nil(R[x])$. We'll prove by induction on $n$, that all of its coefficient is in $Nil(R)$.

  For the case $n=0$, it's clear that $f(x)=a_0$ is nilpotent implies there exists some $k>0$, such that $f(x)^k = a_0^k = 0$, showing $a_0 in Nil(R)$.

  Now, suppose given $n$, one has $f(x)=a_0+a_1 x+...+a_(n-1) x^(n-1) in Nil(R[x])$ implies each coefficient $a_i in Nil(R)$. Given now that $f(x)=a_0+a_1x+...+a_(n-1) x^(n-1)+a_n x^n in Nil(R[x])$, there exists $k>0$, such that $f(x)^k = 0$. Notice that the highest degree term in $f(x)^k$ is given by $(a_n x^n)^k = a_n^k x^(n k)$, which $f(x)^k = 0$ implies that $a_n^k = 0$, showing $a_n in Nil(R)$. 
  
  However, this also implies that $(a_n x^n)^k = a_n^k x^(n k)=0$, showing $a_n x^n in Nil(R[x])$, so the term $f(x)-a_n x^n = a_0+a_1x+...+a_(n-1)x^(n-1) in Nil(R[x])$ (since the nilradical is an ideal). So by induction hypothesis, one has $a_0,a_1,...,a_(n-1) in Nil(R)$, showing all coefficients of $f(x)$ is in $Nil(R)$.

  Hence, by induction one can say $f(x) in Nil(R[x])$ implies all its coefficients are in $Nil(R)$.

  \ 

  $<==:$

  If $f(x)=a_0+a_1x+...+a_n x^n$ has all coefficients lie in $Nil(R)$, for each index $k in {0,1,...,n}$, there exists $l_k>0$, such that $a_k^(l_k)=0$. As a result, $a_k x^k$ satisfies $(a_k x^k)^(l_k) = a_k^(l_k)x^(k l_k)=0$, showing that $a_k x^k in Nil(R[x])$.

  Then, since $f(x)$ is a finite sume of nilpotent elements (since each monomial is verified to be nilpotent), $f(x) in Nil(R[x])$ (because nilradical is an ideal).

  \ 

  The above two proofs verifies the equivalence of the two statements.
]

\ 

= ND//10
#problem[
  Let $R$ be a commutative ring and $f(x) in R[[x]]$ be of the form $f(x)=sum_(i>=0)a_i x^i$. Prove or disprove that $f(x) in U(R[[x]]) <==> a_0 in U(R)$.
][
  We'll prove the equivalence $f(x) in U(R[[x]])<==> a_0 in U(R)$.

  \ 

  $==>:$

  First, suppose $f(x)= sum_(i>=0)a_i x^i in U(R[[x]])$, then there exists $g(x) = sum_(j>=0)b_j x^j in R[[x]]$, such that $f(x)g(x)=1$. Expand the product, one has the following:
  $ 1 = f(x)g(x)=(sum_(i>=0)a_i x^i)(sum_(j>=0)b_j x^j) = sum_(k>=0)(sum_(i=0)^k a_i b_(k-i))a^k $
  So, consider the constant term, the left hand side provides $1$, while the right hand side provides $sum_(i=0)^0 a_i b_(0-i)= a_0 b_0$. Hence, one concludes that $a_0 b_0=1$, or $a_0 in U(R)$.

  \ 

  $<==:$
   
]

\ 

= ND//11
#problem[
  Let $R$ be a commutative ring and $f(x) in R[[x]]$. Suppose $f(x) in Nil(R[[x]])$. Prove or disprove that all coefficients of $f(x)$ are nilpotent in $R$.
][]

\ 

= ND//12
#problem[
  Let $R$ be a commutative ring and $f(x) = sum_(i>=0)a_i x^i in R[[x]]$. Prove or disprove that $f(x) in J(R[[x]]) <==> a_0 in J(R)$.
][]

\ 

= ND//13
#problem[
  Let $R$ be a commutative ring in which every element $x$ satisfies $x^n=x$ ($n$ depends on $x$). Prove or disprove that every prime ideal of $R$ is maximal.
][]

\ 

= ND//14
#problem[
  Let $R$ be a commutative ring such that $R[x]$ is a PID. Prove or disprove that $R$ is a field.
][]

\ 

= ND//15
#problem[
  Let $R$ be a commutative ring. Prove or disprove that $Nil(R[x]) = J(R[x])$.
][]