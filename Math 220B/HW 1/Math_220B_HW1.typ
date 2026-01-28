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

= D//2
#problem[
  Give an example of a commutative ring different from $ZZ$ and polynomial rings, which is not a PID, but whose every nonzero prime ideal is maximal.
][
  Consider the ring $ZZ_2 times ZZ_2$, which it's commutative, not isomorphic to $ZZ$ or any polynomial ring (since both $ZZ$ and $R[x]$ over any nonzero ring $R$ are infinite), and it's not a PID (since it's not an Integral domain: one has $(1,0) dot (0,1) = (0,0)$ in this ring).

  \ 

  Now, we claim that all of its nonzero prime ideals are maximal. Given any prime ideal $P subset.eq ZZ_2 times ZZ_2$, one has $ZZ_2 times ZZ_2\/P$ be an integral domain that is finite. However, all finite integral domain must be a field: 

  Given $R$ a finite integral domain, then for any nonzero $a in R$, since $a^n!=0$ for all $n>=1$ due to the integral domain property, then the collection ${a,a^2,...,a^n,...} subset.eq R$ are consist of nonzero elemens. But, with $R$ being finite, at some point this subset must repeat, so there exists positive integers $i<j$, such that $a^i = a^j$. As a result, $a^i(1-a^(j-i))=0$; with $R$ being an integral domain and $a^i!=0$, this equality enforces $1-a^(j-i)=0$, so $a^(j-i)=1$, showing $a dot a^(j-i-1)=1$, which $a$ is invertible.

  \ 

  Hence, all nonzero prime ideals of $ZZ_2 times ZZ_2$ must be maximal, which is an example for this problem.
]

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
][
  Let $R$ be a PID. First, we'll show that all element must admit a factorization into products of irreducibles:

  Suppose the contrary that $R$ contains some nonzero element that doesn't admit a factorization, say $a$. Then, $a$ must be reducible, there exists $a_0,a_1 in R$, both nonzero non-units, such that $a = a_0 a_1$. Notice that one of the $a_0,a_1$ cannot admit a factorization, or else if both $a_0,a_1$ can be written as finite product of irreducibles, so is $a=a_0 a_1$, which contradicts our assumption that $a$ doesn't have a factorization into products of irreducibles. So, WLOG, say $a_1$ doesn't have a factorization.

  Then, $a_1 = a_(10)a_(11)$ for some nonzero non-units, and the above claim also applies, one of $a_(10), a_(11)$ doesn't admit a factorization. WLOG, say $a_(11)$ doesn't admit a factorization.

  Inductively, one can keep factoring $a_(1...1)$ ($n$ ones) into $a_(1...10) a_(1...11)$, where both elements are nonzero non-units, and WLOG one can always say $a_(1...11)$ doesn't admit a factorization.

  \ 

  Now, notice that this forms a chain of ideals: 
  $ (a) subset (a_1) subset  (a_(11)) subset  ... subset  (a_(1...1)) subset  ... $
  This is because each $a_(1...1) = a_(1...10)a_(1...11)$.
  
  Moreover, all the inclusions are proper: if there exists $(a_(1...1)) = (a_(1...11))$, this implies that $a_(1...11) = b a_(1...1)$ for some $b in R$, which further implies $a_(1...1) = a_(1...10) a_(1...11) = a_(1...10)b a_(1...1)$, or $a_(1...1)(1-a_(1...10)b)=0$. Yet, with the construction, $a_(1...1)!=0$, with $R$ being an integral domain, this enforces $1-a_(1...10)b=0$, or $a_(1...10)b=1$. Yet, this is absurd, since $a_(1...10)$ must be non-unit based on our construction. So, $(a_(1...1)) != (a_(1...11))$, the inclusion must be proper.

  \ 

  Then, here comes a contradiction: 
  
  Let $I_n := (a_(1...1))$ (the element with $n$ ones as index). Given the ascending chain of ideals $(a) subset I_1 subset I_2 subset ... subset I_n subset...$, define the set $J:= union.big_(n>=1) I_n$, notice that $J$ is an ideal: 
  
  Given any $x,y in J$, there exists $n,m >=1$, such that $x in I_n$ and $y in I_m$. WLOG, say $n>=m$, then the ascending chain implies $I_m subset.eq I_n$, showing that $y in I_n$ also. Therefore, the subtraction $x-u in I_n subset.eq J$, showing $J$ satisfies the subgroup test, which is a subgroup under addition.

  Furthermore, given any $r in R$ and $x in J$, there exists $I_n$ such that $x in I_n$, so $r x in I_n subset.eq J$, showing $J$ is an ideal.

  Yet, by the PID property, there exists $d in J$, such that $J = (d)$. So, there exists $k>=1$, such that $d in I_k$, which implies $J = subset.eq I_k subset I_(k+1) subset ... subset J$. Hence, all $n>=k$ satisfies $I_n = J$, showing the chain is not strictly ascending, which contradicts the previous construction.

  As a conclusion, all element must admit a factorization into products of irreducibles.

  \ 

  \ 

  Now, we claim that every element has unique such factorization (up to associates): given any nonzero $a in R$, let $a = p_1 ... p_m = q_1 ... q_n$ be two facorizations of $a$ as products of irreducibles. Recall that in a PID, all irreducible elements are prime, 

]

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

= D//10
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

  \ 

  $<==:$

  Now, suppose that $a_0 in U(R)$, consider the following formula: 
  
  /*we'll inductively derive the coefficients of the inverse of $f(x)$.

  
  First, we aim to see the structure of its inverse (if it exists), so temporarily assume it has an inverse: Let $g(x)=sum_(j>=0)b_j x^j$ be the inverse of $f(x)$, then it must satisfy the following:
  $ 1=f(x)g(x)=(sum_(i>=0)a_i x^i)(sum_(j>=0)b_j x^j) = sum_(k>=0)(sum_(i=0)^k a_i b_(k-i))x^k $
  As a result, the constant term provides the equality $1=a_0 b_0$ (hence $b_0 = a_0^(-1)$), and non-constant terms provide the equality $0 = sum_(i=0)^k a_i b_(k-i)$ for all $k>0$.

  Hence, for $k=1$, one has $a_1 b_0+a_0 b_1 = 0$, or $b_1 =- a_0^(-1) a_1 b_0 = -a_0^(-2)a_1$, which is some polynomial combinations of $a_0, a_0^(-1)$ and $a_1$.

  Then, suppose that for given $k$, one has $b_(l)$ equal to some polynomial combination of $a_0,a_0^(-1),a_1,...,a_l$ for all $0<=l<k$, under this assumption $b_k$ will be the following:
  $ 0 = sum_(i=0)^k a_i b_(k-i) ==> a_0 b_k = -sum_(i=1)^k a_i b_(k-i) ==> b_k = -sum_(i=1)^k a_0^(-1)a_i b_(k-i) $
  Since each $i=1,...,k$ has $0<=(k-i)<k$, by induction hypothesis $b_(k-i)$ is a polynomial combinations of $a_0,a_0^(-1),...,a_(k-i)$. This implies that $b_k$ is in fact polynomial combination of $a_0,a_0^(-1),...,a_k$. Hence, by induction each $b_k$ can be recreated using $a_0,...,a_k$, with a recursive formula $b_0=a_0^(-1)$, and $b_k = -sum_(i=1)^k a_0^(-1)a_i b_(k-i)$ for all $k>0$.

  \ 

  After seeing the structure, 
  */
  Define $g(x)=sum_(j>=0)b_j x^j$ by $b_0 := a_0^(-1)$, and each $k>0$ has $b_k := -sum_(i=1)^k a_0^(-1)a_i b_(k-i)$. Then, we have the following:
  $ f(x)g(x)=(sum_(i>=0)a_i x^i)(sum_(j>=0)b_j x^j) = sum_(k>=0)(sum_(i=0)^k a_i b_(k-i))x^k $
  Which, for $k=0$, the coefficient is $a_0 b_0 = a_0 a_0^(-1)=1$; for $k=1$, one has coefficient $a_1 b_0+a_0 b_1 = a_1 b_0 + a_0 (-a_0^(-1)a_1b_0) = 0$. And inductively, if for given $k$, every $1<=l < k$ has $sum_(i=0)^l a_i b_(l-i)=0$, for the case of $k$, one has the following by the definition of $b_k$:
  $ sum_(i=0)^k a_i b_(k-i) &= a_0 b_k + sum_(i=1)^k a_i b_(k-i) = a_0(-sum_(i=1)^k a_0^(-1)a_i b_(k-i))+sum_(i=1)^k a_i b_(k-i)\ 
  &= -sum_(i=1)^k a_i b_(k-i)+sum_(i=1)^k a_i b_(k-i) = 0 $
  So by induction, $f(x)g(x)$ has constant coefficient $1$, and all non-constant coefficient $0$, showing $f(x)$ has an inverse, hence a unit in $R[[x]]$.
]

\ 

= D//11
#problem[
  Let $R$ be a commutative ring and $f(x) in R[[x]]$. Suppose $f(x) in Nil(R[[x]])$. Prove or disprove that all coefficients of $f(x)$ are nilpotent in $R$.
][
  We'll prove that all coefficients of $f(x)$ are all nilpotent in $R$ via induction.

  \ 

  Let $f(x)=sum_(n>=0)a_n x^n$. Since $f(x)$ is nilpotent, there exists $k>0$, such that $f(x)^k=0$.

  So, for $n=0$, since $f(x)^k$ has constant term $a_0^k$, this enforces $a_0^k=0$, hence $a_0$ is nilpotent in $R$. 

  \ 

  Now, suppose for given $n$, one has $a_0, ..., a_(n-1) in R$ all being nilpotent. Then, as a result each index $0<=i < n$ has $a_i x^i in R[[x]]$ being nilpotent also (since the only potential nonzero coefficient is nilpotent). As a result, one has $sum_(m>=n)a_m x^m = sum_(m>=0)a_m x^m - (a_0+a_1 x+...+a_(n-1)x^(n-1)) = f(x)-(a_0+a_1 x+...+a_(n-1)x^(n-1)) in Nil(R[[x]])$ (since nilradical is an ideal). 

  So, there exists $l_n>0$, such that $(sum_(m>=n)a_m x^m)^(l_n) = 0$. Thus, one derives the following:
  $ 0 &= (sum_(m>=n)a_m x^m)^(l_n) = (x^n sum_(m>=n)a_m x^(m-n))^(l_n)= (x^n sum_(m>=0)a_(n+m)x^m)^(l_n) = x^(n l_n)(a_n^(l_n)+...) $
  Which, the smallest degree term $x^(n l_n)$ has coefficient $a_n^(l_n)$, showing that $a_n^(l_n)=0$, or $a_n in R$ is nilpotent.

  \ 

  Hence, by induction, one can conclude that all coefficients of $f(x)$ are nilpotent in $R$.
]

\ 

= D//12
#problem[
  Let $R$ be a commutative ring and $f(x) = sum_(i>=0)a_i x^i in R[[x]]$. Prove or disprove that $f(x) in J(R[[x]]) <==> a_0 in J(R)$.
][
  We'll proe that $f(x) in J(R[[x]])<==> a_0 in J(R)$.

  \ 

  First, recall the characterization of Jacobson radical: Given a commutative ring $S$, one has $a in J(S)$ iff all $t in S$ satisfies $1-s t$ being a unit.

  Second, we now know that $f(x) in R[[x]]$ is a unit, iff its constant term $a_0 in R$ is a unit (done in #text(weight: "bold")[Problem 10]).

  \ 

  $==>:$

  Suppose $f(x) in J(R[[x]])$, then given $f(x)=sum_(i>=0)a_i x^i$, since all $g(x) in R[[x]]$ satisfies $1-g(x)f(x) in U(R[[x]])$, in particular, given any $b in R arrow.hook R[[x]]$, one has $1-b f(x)$ being a unit. However, it has the following form:
  $ 1-b f(x)=1-sum_(i>=0)b a_i x^i = (1-b a_0)+sum_(i>=1)b a_i x^i $
  Which, its constant term is $1-b a_0$. Based on the second statement listed beforehand, $1-b f(x)$ is a unit iff its constant term $1-b a_0$ is a unit. So, all $b in R$ has $1-b a_0$ being a unit, showing $a_0 in J(R)$.

  \ 

  $<==:$ 

  Suppose $a_0 in J(R)$, then all $b in R$ satisfies $1-b a_0 in U(R)$. Now, given any $g(x) = sum_(j>=0)b_j x^j in R[[x]]$, one has $1-g(x)f(x)$ being the following:
  $ 1-g(x)f(x)&=1-(sum_(j>=0)b_j x^j)(sum_(i>=0)a_i x^i)\ 
  &= 1-sum_(k>=0)(sum_(i=0)^k a_i b_(k-i))x^k\ 
  &= (1-a_0 b_0)+sum_(k>=1)(sum_(i=0)^k a_i b_(k-i))x^k $
  So, $1-g(x)f(x)$ has its constant term $1-a_0 b_0$ being a unit, showing $1-g(x)f(x)$ is a unit. Since such relation is true for all $g(x) in R[[x]]$, $f(x) in J(R[[x]])$.
]

\ 

= D//13
#problem[
  Let $R$ be a commutative ring in which every element $x$ satisfies $x^n=x$ ($n$ depends on $x$). Prove or disprove that every prime ideal of $R$ is maximal.
][
  Here we'll prove by contradiction that every prime ideal of $R$ is maximal.

  \ 

  Suppose there exists prime ideal $P subset.neq R$ that is not maximal, then the quotient ring $R\/P$ is only an integral domain, but not a field. Thus, there exists an element $x in R$, such that its quotient $overline(x) in R\/P$ is nonzero, but not a unit.

  Now, since there exists $n in NN$ such that $x^n = x$ (in particular, one can choose $n>1$), it's the same for the quotient (where $overline(x)^n = overline(x^n)=overline(x)$). So, since $overline(x)$ is nonzero and $R\/P$ is an integral domain, $overline(x)^(n-1) != 0$; on the other hand, since $overline(x)$ is not a unit either, $overline(x)^(n-1)!=1$.

  However, consider the following equality:
  $ 1 dot overline(x) = overline(x) = overline(x)^n = overline(x)^(n-1) dot overline(x) $
  Hence, one gets that $(1-overline(x)^(n-1)) dot overline(x)=0$. But, recall that $overline(x)^(n-1)!=1$ (so $1-overline(x)^(n-1)!=0$), while $overline(x)!=0$ also, showing that $overline(x)$ is in fact a nonzero zero-divisor. Yet, this contradicts the assumption that $R\/P$ is an integral domain.

  \ 

  So, our assumption is false, every prime ideal in $R$ must be maximal.
]

\ 

= D//14
#problem[
  Let $R$ be a commutative ring such that $R[x]$ is a PID. Prove or disprove that $R$ is a field.
][
  We'll prove that $R$ is a field.

  \ 

  Given any nonzero element $a in R$, consider the following ideal $(a,x) subset.eq R[x]$: Since $R[x]$ is a PID, one has $(a,x)=(f(x))$ for some $f(x) in R[x]$. Then, since $a = g(x)f(x)$ for some $g(x) in R[x]$, using the degree formula, we get:
  $ 0 = deg(a) = deg(g(x)f(x))=deg(g(x))+deg(f(x)) $
  So, with the degrees being nonnegative, one has $deg(f(x))=deg(g(x))=0$, showing there exists nonzero $b,c in R$, such that $f(x)=b$, and $g(x)=c$.

  On the other hand, since $b = f(x) = k(x) a+ l(x) x$ for some $k(x),l(x) in R[x]$ (by the ideal relation), take the evaluation map $phi:R[x] ->> R$ by $phi(x)=x$, one has the following:
  $ b = phi(b)=phi(k(x) a+l(x) x) = k(0) a+l(0) 0 = k(0) a $
  Combining with the previous relation $a = f(x)g(x) = b c$, one has $a = c k(0)a$, so $a(1-c k(0))=0$; with the assumption $a!=0$, one must have $1=c k(0)$, or $c$ is a unit.

  Hence, $b = c^(-1)a$, showing that $a,b$ are associates, hence $(a)=(b)$, showing $(a,x) = (b,x)=(f(x))=(b)=(a)$.

  \ 

  Finally, since $x in (a)$, there exists $r(x) in R[x]$, such that $r(x) a = x$. Since $deg(x)=1$, this enforces $deg(r(x) a)=deg(r(x))+deg(a)=1$; with $deg(a)=0$, then $deg(r(x))=1$, so there exists $p,q in R$, such that $r(x)=p x+ q$.

  However, with $x = r(x)a = (a p)x+(a q)$, this implies $a p =1$, showing $a$ is a unit.

  Hence, all nonzero element $a in R$ is a unit, showing $R$ is a field.
]

\ 

= D//15
#problem[
  Let $R$ be a commutative ring. Prove or disprove that $Nil(R[x]) = J(R[x])$.
][
  We'll prove that $Nil(R[x])=J(R[x])$.

  \ 

  First, it's clear that $Nil(R[x]) subset.eq J(R[x])$. Now, for the other inclusion, we require the following statement:

  #lemma[
    $f(x) = a_0+a_1 x+...+a_n x^n in R[x]$ is a unit $<==>$ $a_0$ is a unit, and $a_1,...,a_n$ are nilpotent.
  ][

    $<==:$

    First, if $a_0$ is a unit and $a_1,...,a_n$ are nilpotent in $R$, each index $1<=i<=n$ has $a_i x^i$ be nilpotent also. Hence, $f(x)=a_0 + (a_1 x+...+a_n x^n)$, where $a_1x+...+a_n x^n in Nil(R[x])$, and $a_1 in U(R[x])$. Using #text(weight: "bold")[Problem 8], $f(x)$ is a unit plus a nilpotent element, hence a unit.

    \ 

    $==>:$ 

    Suppose $f(x)=a_0+a_1x+...+a_n x^n$ is a unit. Then, there exists $g(x)=b_0+b_1x+...+b_m x^m$, such that $f(x)g(x)=1$. Notice that the left hand side has constant term being $a_0 b_0$, so $a_0b_0=1$, showing that $a_0$ is a unit.

    Now, to show each $a_1,...,a_n$ are nilpotent, we'll prove that they're contained in all prime ideals of $R$. Given any prime ideal $P subset.eq R$, recall that the extension of ideal $P^e subset.eq R[x]$ satisfies $R[x]\/P^e tilde.equiv (R\/P)[x]$. Hence, take the projection $phi:R[x]->>R[x]/P^e tilde.equiv (R\/P)[x]$, one can interpret it as follow:
    $ phi(r_0+r_1x+...+r_k x^k) = overline(r_0)+overline(r_1)x+...+overline(r_k)x^k $
    where $overline(r)$ represents the quotient of $r$ in $R\/P$.

    Notice that $R\/P$ is an integral domain, so is $(R\/P)[x]$, which implies that $U(R\/P) = U((R\/P)[x])$: Given the inclusion $R\/P arrow.hook (R\/P)[x]$, it is clear that $U(R\/P) subset.eq U((R\/P)[x])$. Now, suppose $f(x) in (R\/P)[x]$ is a unit, then there exists $g(x) in (R\/P)[x]$, such that $f(x)g(x)=1$. Recall that for integral domain polynomial ring, one has the following:
    $ 0=deg(1)=deg(f(x)g(x))=deg(f(x))+deg(g(x)) $
    Since degree is nonnegative, this enforces $deg(f(x))=deg(g(x))=0$, showing both $f(x),g(x)$ is in fact a constant, hence in $R$. As a result, $f(x), g(x) in U(R\/P)$, showing $U((R\/P)[x]) subset.eq U(R\/P)$.

    
    Finally, if consider $phi(f(x)) = overline(a_0)+overline(a_1)x+...+overline(a_n)x^n$ in $(R\/P)[x]$, it remains as a unit. Hence by the above statement, it enforces $phi(f(x))$ to be constant, showing that $overline(a_1),...,overline(a_n) = 0$ in $R\/P$, or $a_1,...,a_n in P$. Then, since $P$ is arbitrary prime ideal of $R$, $a_1,...,a_n$ lies in the intersection of all prime ideal, which is precisely $Nil(R)$. Thus, $a_1,...,a_n$ are nilpotent, and it finishes the lemma.
  ] 

  Back to the original problem, for any $f(x) = a_0+a_1x+...+a_n x^n in J(R[x])$, every $g(x) in R[x]$ satisfies $1-g(x)f(x)$ is a unit. In particular, take $g(x)=x$, one has the following being a unit: 
  $ 1-x f(x)=1-x(a_0+a_1x+...+a_n x^n)= 1-a_0x-a_1 x^2-...-a_n x^(n+1) $
  Hence, by the lemma, all the non-constant term coefficients are nilpotent, showing $-a_0,-a_1,...,-a_n$ are nilpotent, hence $a_0,a_1,...,a_n$ are all nilpotent.

  Finally, using the statement proven in #text(weight: "bold")[Problem 11], $f(x) in Nil(R[x])$ iff all its coefficients are nilpotent in $R$. So, with all coefficients of $f(x)$ being nilpotent, $f(x) in Nil(R[x])$. This shows the inclusion $J(R[x]) subset.eq Nil(R[x])$.

  \ 

  Hence, $Nil(R[x]) = J(R[x])$.
]