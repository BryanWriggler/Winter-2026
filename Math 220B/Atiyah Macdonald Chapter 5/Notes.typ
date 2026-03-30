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
    styles: ergo-styles.sidebar2, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Atiyah Macdonald Chapter 5: Integrality and Valuation",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline(title: "Table of Content:")

\ 

The goal for such chapter is understanding the relationships between: Integrality, Valuation ring, and some of their applications in algebraic geometry (especially the relationship with valuative criterion of separatedness and properness).

\ 

= Integrality

Similar to the concept of a field extension element $a in K\/k$ being algebraic over the base field $k$ (i.e. there exists nonzero $f(x) in k[x] arrow.hook K[x]$, such that $f(a)=0$), over rings we also have similar definitions:

#definition[Integral Dependence][
  Given $A arrow.hook B$ an inclusion of ring. An element $b in B$ is #text(weight: "bold")[integral over $A$] if there exists a monic polynomial $f(x)=x^n + a_1 x^(n-1)+...+a_n in A[x] arrow.hook B[x]$, such that $f(b)=0$.
]

Here's a most typical example:
#example[Integral Dependence of $ZZ$ and $QQ$][
  Given $A=ZZ$, $B=QQ$, for any nonzero rational number $p/q in QQ$ that's integral over $ZZ$ (with $gcd(p,q)=1$), then there exists $a_1,...,a_n in ZZ$, such that:
  $ &(p/q)^n + a_1 (p/q)^(n-1)+...+a_n =0\
  &==> p^n + a_1 p^(n-1)q + ... + a_(n-1)p q^(n-1) + a_n q^n=0 $
  Hence, $-p^n = q_1 p^(n-1)q+...+a_(n-1)p q^(n-1)$ which is divisible by $q$. Hence, with $gcd(p,q)=1$, this implies $q=pm 1$, showing all elements in $QQ$ that's integral over $ZZ$, is $ZZ$.
]

\ 

Here are some characterization of integrality:
#proposition[
  Given ring inclusion $A arrow.hook B$, the following are equivalent:
  1. $b in B$ is integral over $A$.
  2. $A[b]$ is a finitely generated $A$-module.
  3. $A[b] arrow.hook C arrow.hook B$, where $C$ is a subring of $B$, which is a finitely generated $A$-module.
  4. There exists a faithful $A[b]$-module $M$, which is finitely generated as an $A$-module.
][
  $1 ==> 2:$

  Suppose $b$ is integral over $A$, then there exists a smallest number $n in NN$, where it has corresponding $a_1,...,a_n in A$, such that the monic polynomial $g(x)=x^n + a_1 x^(n-1)+...+a_(n-1)x+a_n in A[x]$ has $b$ as a root.

  Then, for all polynomial $f(x) in A[x]$, by generalized division algorithm (together with monic polynomial), there exists unique $q(x), r(x) in A[x]$ (with $r(x)=0$ or $deg(r)<deg(g)=n$), such that $f(x)=g(x)q(x)+r(x)$.

  As a result, $f(b) = g(b)q(b)+r(b) = r(b)$ (as $g(b)=0$), which $r(b) in sum_(i=0)^(n-1)A b^i$ (since $r(x)$ is a polynomial with degree $<n$). So, $A[b] = sum_(i=0)^(n-1)A b^i$ is finitely generated as $A$-module.

  \

  $2==>3:$

  If $A[b]$ is a finitely generated $A$-module, simply take $C:= A[b]$ suffices.

  \ 

  $3==>4:$

  Suppose $A[b] arrow.hook C arrow.hook B$ with $C$ being a finitely generated $A$-module, then $C$ is automatically a faithful $A[b]$-module with the property given in 4.

  \ 

  $4==>1:$

  Suppose there exists $M$ that's a faithful $A[b]$-module which is also a finitely generated as $A$-module, then take $phi:M -> M$ by $phi(m) = b dot m$ (the scalar multiplication by element $b in A[b]$), notice that it's an $A$-linear map (as commutativity of $A[b]$ forces it to be an $A[b]$-linear map, hence an $A$-linear map). Then, since $M$ is a finitely generated $A$-module, applying Cayley-Hamilton Theorem, there exists $a_1,...,a_n in A$, such that $phi^n + a_1 phi^(n-1)+...+a_(n-1)phi+a_n = 0$ as endomorphism of $M$.

  However, this is precisely the multiplication on $M$ by $b^n + a_1 b^(n-1)+...+a_(n-1)b+a_n in A[b]$, such multiplication being $0$. Which, the fact that $M$ is a faithful $A[b]$-module enforces $b^n + a_1 b^(n-1)+...+a_(n-1)b+a_n=0$, or $b$ is integral over $A$.
]

\ 
#corollary[
  Let $A arrow.hook B$ be rings. Some statements on integrality:
  1. If $b_1,...,b_n in B$ are integral over $A$. Then, $A[b_1,...,b_n]$ is a finitely generated $A$-module.
  2. Let $C subset.eq B$ be all set of element that's integral over $A$, then it's a subring of $B$ containing $A$.
  3. If $A subset.eq B subset.eq C$ are rings such that $B$ is integral over $A$, $C$ is integral over $B$, then $C$ is integral over $A$ (the transitivity of integral dependence).
][
  1. By induction on $n$. Case $n=1$ is given by the integrality, and if $A[b_1,...,b_(n-1)]$ is a finitely generated $A$-module as induction hypothesis, $b_n$ which is integral over $A$, is also integral over $A[b_1,...,b_(n-1)]$, hence $A[b_1,...,b_n] = (A[b_1,...,b_(n-1)])[b_n]$ is a finnitely generated $A[b_1,...,b_(n-1)]$-module, say $y_1,...,y_m in A[b_1,...,b_n]$ satisfies $A[b_1,...,b_n]=sum_(i=1)^m C y_i$ (where $C=A[b_1,...,b_(n-1)]$). 
  
    Then, since $C$ is finitely generated $A$-module, there exists $z_1,...,z_p in C$, such that $C=sum_(j=1)^p A z_j$. So, $A[b_1,...,b_n] = sum_(i=1)^m sum_(j=1)^p A y_i z_j$ is finitely generated $A$-module.

    \ 

  2. Take any $b_1, b_2 in C$:
    - The inversion $-b_1 in C$, since if $b_1$ is a root of $x^n+a_1 x^(n-1)+...+a_0 in A[x]$, then $-b_1$ is a root of $x^n + (-1)^n ((-1)^(n-1)a_1 x^(n-1)+...+a_0) in A[x]$.
    - Consider $A[b_1+b_2] arrow.hook A[b_1,b_2]$ and $A[b_1 b_2] arrow.hook A[b_1,b_2]$, since $A[b_1,b_2]$ is a subring of $B$ which is a finitely generated $A$-module, the previous proposition shows that $b_1+b_2, b_1 b_2$ are both integral over $A$.
    - It's clear that all $a in A$ satisfies the equation $x-a in A[x]$.
    Hence, $C$ is a subring by the first two condition, and containing $A$ by the third condition.

    \ 

  3. Suppose $A subset.eq B subset.eq C$ with each succession having integral dependence, then for all $c in C$, there exists $b_1,...,b_n in B$, such that $c$ satisfies the polynomial $x^n+b_1 x^(n-1)+...+b_n in B[x]$.

    As a result, $c$ is also integral over the subring $A_n:=A[b_1,...,b_n]$ of $B$ that's containing $A$, so the proposition states $A_n [c]$ is a finitely generated $A_n$-module.

    However, since by 1 we know $A_n$ is a finitely generated $A$-module, $A_n [c]$ is a finitely generated $A$-module using the proof in 1. So, $A[c] arrow.hook A_n [c] arrow.hook C$, where $A_n [c]$ is a subring of $C$ that's finitely generated as $A$-module, showing $c$ is integral over $A$.
]

\ 

In some sense, because polynomial rings over non-fields have worse behavior, hence some of the above characterizations using the proposition will make it easier to do such computations.

\ 

Also, since the above corollary points out how integral elements of a subring in a ring forms another subring, we can make such definition:
#definition[Integral Closure][
  Let $A subset.eq B$ be a subring. Then, $C subset.eq B$ the ring collect all elements in $B$ that's integral over $A$, is called the #text(weight: "bold")[Integral Closure] of $A$ in $B$.

  If $A=C$, then $A$ is said to be #text(weight: "bold")[integrally closed] in $B$.

  Else, if $C=B$, the ring $B$ is said to be #text(weight: "bold")[integral] over $A$.
]

This in some sense points out how integral dependence is highly correlated to both the ring and the subring: For instance, the integral closure of $ZZ$ in $QQ$ is $ZZ$, while in $CC$ will be much larger because more elements in $CC$ satisfies integer coefficient monic polynomials.

\ 

Which, integral closure has another important feature:
#corollary[
  Let $A subset.eq B$ be rings, $C$ the integral closure of $A$ in $B$. Then $C$ is integrally closed in $B$.
][
  Suppose another ring $C'$ satisfies $C subset.eq C' subset.eq B$ which is the integral closure of $C$ in $B$, then $A subset.eq C subset.eq C'$ is a chain where successive inclusion have integral dependence. Then, since $C'$ is integral over $A$ (by transitivity of integrality), then $C' subset.eq C$ by definition, so $C=C'$. Hence, $C$ is integrally closed.
]

Another important characterization is about the ring homomorphisms:
#definition[Integral Homomorphisms][
  Given a ring homomorphism $f:A->B$, it's said to be #text(weight: "bold")[Integral] (or $B$ is an #text(weight: "bold")[integral $A$-algebra]), if $B$ is integral over the subring $f(A)$.
]
Which, the above characterization shows that finite type $+$ integral $<==>$ finite (finite is finite type and integral, since $B$ is a finitely generated $f(A)$-module showing it's integral over $f(A)$; conversely, finite type $+$ integral means each generator of of $B$ over $A$ is integral over $f(A)$, which is $B$ automatically a finitely generated $f(A)$-module, using the algebra generator).

\ 

\ 

Another important property is regarding how integral dependence changes under ideal, quotient, and localization:
#proposition[
  Let $A subset.eq B$ be rings such that $B$ is integral over $A$.
  + If $I subset.eq B$ is an ideal, and $I' = A sect I$ be the contraction of ideal, then $B\/I$ is integral over $A\/I'$.
  + If $S$ is a multiplicatively closed subset of $A$, then $S^(-1)B$ is integral over $S^(-1)A$.
][
  1. First, consider the ring homomorphism $A arrow.hook B ->> B\/I$, then the kernel is precisely $I' = A sect I$ the contraction of $I$ (since kernel needs to be simultaneously in $A$ and $I$). This realizes an injective ring homomorphism $A\/I' arrow.hook B\/I$, which $A\/I'$ is precisely the image of $A$ under $B\/I$.

    Then, any $overline(b) in B\/I$ has preimage $b in B$ satisfying some equation, say $f(x)=x^n + a_1 x^(n-1)+...+a_n in A[x]$. So, take the quotient of $0=f(b)$, we get:
    $ overline(f(b))=overline(b)^n + overline(a_1)overline(b)^(n-1)+...+overline(a_n)=overline(0) $
    Where, $overline(a_1),...,overline(a_n) in A\/I'$, showing $overline(b)$ is integral over $A\/I'$.

    \ 

  2. For any $b/s in S^(-1)B$, since $b$ satisfies some polynomial $f(x)=x^n + a_1 x^(n-1)+...+a_0 in A[x]$, then since $f(b)=0$. So, in $S^(-1)B$, we have the following:
    $ (b/s)^n + a_1/s (b/s)^(n-1) + ... + a_1/s^(n-1)(b/s)+a_n/s^n = f(b)/s^n = 0 $
    Where, $a_1/s,..., a_n/s^n in S^(-1)A$, showing $b/s$ is integral over $S^(-1)A$.
]

\

These are some basic discussion on properties of integral dependence and integral closure.

#pagebreak()

= Going-up Theorem

This theorem is concerned about the behaviors of prime ideals in integral extensions (which is in particular useful when characterizing varieties using scheme theory). Which, the theorem is derived in a series of propositions / lemmas:

#proposition[
  Let $A subset.eq B$ be integral domains, such that $B$ is integral over $A$. Then, $B$ is a field $<==>$ $A$ is a field.
][
  $==>:$

  Suppose $A$ is a field, then for all nonzero $b in B$, one can consider its minimal polynomial over $A$ by integrality (since $B$ is not a field yet, such claim that $b$ has minimal polynomial is imprecise, but idea is the same). If $x^n+a_1 x^(n-1)+...+a_n in A[x]$ is an equation satisfied by $b$ with smallest degree, then it implies $a_n!=0$ (or else having no constant term one can factor out another copy of $x$, producing a polynomial with one degree less).

  Hence, we have the following:
  $ b^n + a_1 b^(n-1)+...+a_(n-1)b + a_n = 0&==> b(b^(n-1)+a_(n-1)b^(n-2)+...+a_(n-1)) = -a_n\ 
  &==> b(-a_n^(-1)(b^(n-1)+a_(n-1)b^(n-2)+...+a_(n-1))) = 1 $
  So, we manually produced an inverse for any nonzero $b in B$, using just $b$ and the elements in $A$, showing that $B$ is a field.

  \ 

  $<==:$

  Now, suppose $B$ is a field, then for all nonzero $a in A$, there exists $a^(-1) in B$. The goal is to show $a^(-1) in A$. By integrality, we get some polynomial $x^n+a_1 x^(n-1)+...+a_n in A[x]$ which is satisfied by $a^(-1)$. Hence, one gets the following equality:
  $ a^(-n)+a_1 a^(-(n-1))+...+a_(n-1)a^(-1)+a_n = 0&==> a^(-n) = -a_1 a^(-(n-1))-...-a_n\ 
  &==> a^(-1) = a^(n-1)(-a_1 a^(-(n-1))-...-a_n)\ 
  &==> a^(-1) = -a_1 -...-a_n a^(n-1) in A  $
  Hence, $A$ is a field.
]

Which, it follows with the following corollaries on the prime ideals, regarding integral dependence:
#corollary[
  Given $A arrow.hook B$ rings, such that $B$ is integral over $A$. Let $Q subset.eq B$ be a prime ideal, $P := A sect Q$ be its contraction (also prime), then $B\/Q$ is integral over $A\/P$ (with the two rings being integral domains).

  As a result, $B\/Q$ is a field $<==>$ $A\/P$ is a field, hence $Q$ is maximal in $B$ $<==>$ $P= A sect Q$ is maximal in $A$.
][]

\ 

#corollary[
  Let $A subset.eq B$ be rings, such that $B$ integral over $A$. Let $Q subset.eq Q'$ be prime ideals of $B$ such that $Q subset.eq Q'$ and $A sect Q=A sect Q' = P$. Then, $Q=Q'$.
][
  One has $B_P$ being integral over $A_P$ (#text(weight: "bold")[Remark:] Here $B_P$ is not localizing at prime ideal $P subset.eq A$, but the localization by the multiplicatively closed subset $A\\P$ in $B$, since $P$ may not even be an ideal in $B$!)

  Which, let $frak(m) = P A_P$ be the maximal ideal, and let $frak(n) = Q B_P$, $frak(n') = Q' B_P$ be the extension of $Q,Q'$ in $B_P$ respectively (Note: Here since $P = A sect Q=A sect Q'$, then these two prime ideals in $B$ intersect nowhere with $A\\P$, hence such extension is still a prime ideal).

  Then, one simply has $frak(m) = A_P sect frak(n) = A_P sect frak(n')$. Then, take the quotient, one simply has $B_P \/ frak(n)$ being integral over $A_P \/ frak(m)$ a field, showing that $frak(n)$ is a maximal ideal. However, with $frak(n) subset.eq frak(n')$, this enforces $frak(n)=frak(n')$.

  Finally, since the localization preserves prime ideals that don't intersect with the multiplicatively closed set, then $Q B_P = frak(n)=frak(n') = Q' B_P$ impliea $Q=Q'$, showing our desired result.
]

\ 

Now, before the Going-up Theorem, let's prove one more important piece:

#lemma[
  Let $A subset.eq B$ be rings, such that $B$ is integral over $A$, and let $P subset.eq A$ be a prime ideal of $A$. Then, there exists a prime ideal $Q subset.eq B$, such that $P = A sect Q$.
][
  Similar to above, since $B_P$ is integral over $A_P$, let $alpha:A -> A_P$ and $beta:B -> B_P$ be the localization map. Then, one has the following diagram:
  #set align(center)
  #diagram($
             A edge("d",->, script(alpha)) edge("hook->") & B edge("d",->, script(beta), #left)\
             A_P edge("hook->") & B_P
           $)
  #set align(left)
  Now, take a maximal ideal $frak(m) subset.eq B_P$, $frak(n)=frak(m) sect A_P$ is a maximal ideal.

  \ 
  
  #text(weight: "bold")[Remark:] This is not completely trivial! It's because $frak(m)$ contains no elements from the multiplicatively closed subset $A\\P$, hence the contraction is prime, instead of unit ideal; now, consider the quotient, $B_P \/ frak(m)$ is integral over $A_P \/ frak(n)$, which $B_P\/frak(m)$ is a field enforces $A_P \/ frak(n)$ being a field. So, $frak(n)$ is maximal in $A$.

  \ 

  As a result, with $A_P$ being a local ring, $frak(n) = P A_P$. Then, the contraction of $frak(n)$ in $A$ is precisely $alpha^(-1)(frak(n))=P$. So, $frak(m) subset B_P$ contracts to $alpha^(-1)(frak(n))=P$ in $A$ based on the above diagram.

  Then, let $beta^(-1)(frak(m)) subset.eq B$ be the contraction of $frak(m)$ in $B$, then it's a prime ideal; moreover, its contraction in $A$ is $beta^(-1)(frak(m))^c=P$ (the contraction of $frak(m)$ in $A$), showing there exists such prime ideal in $B$ that contracts to $P subset.eq A$.
]

\ 

With all these pieces, here's the main statement of Going-up Theorem:
#theorem("Going-up Theorem")[
  Let $A subset.eq B$ be rings, such that $B$ is integral over $A$. Let $P_1 subset.eq ... subset.eq P_n$ be a chain of prime ideals of $A$, and $Q_1 subset.eq ... subset.eq Q_m$ be a chain of prime ideals in $B$, such that $m<n$, and each $1<=i<=m$ satisfies $Q_i sect A=P_i$, then the chain $Q_1 subset.eq ... subset.eq Q_m$ can be extended to a chain $Q_1 subset.eq ... subset.eq Q_n$, such that each $1<=i<=n$ satisfies $Q_i sect A=P_i$.
][
  We'll prove by induction.

  \ 

  First, let's prove how to reduce to the case $m=1, n=2$: 
  - Given $m>1$, then consider the quotient $A\/P_m$ and $B\/Q_m$, then the integral dependence is maintained, while the length of the chain $P_i$ is reduced to $1$ (namely the zero prime ideal in the quotient). So, one only needs to consider the case $m=1$ and $n>1$.
  - Then, given the above case, by induction if one can guarantee its extension to the case $m=n-1$ and $n$, then simply take the quotient $A\/P_(n-1)$ and $B\/Q_(n-1)$, it reduces to find an extension of $P_n subset A\/P_(n-1)$ inside the ring extension $B\/Q_(n-1)$ (as an integral extension of $A\/P_(n-1)$).

  \ 

  Finally, it reduces to the case $m=1, n=2$ (and even stronger, we can assume $P_1,Q_1=0$, or the two rings are integral domain). Let $P_2 subset A$ be the prime ideal await to be extended, however the above proposition states one can find prime ideal $Q_2 subset B$ such that $P_2 = A sect Q_2$, hence this finishes the proof (as the rest is taking the preimage of prime ideals under quotient, until recovering the original case). 
]

As a side note, I believe the previous propositions and corollaries in fact guarantees such extension of chain to be unique (as integral dependence guarantees the contraction of two prime ideals being the same, then the two prime ideals are forced to be identical).

This also explains something stronger in algebraic geometry: Given a surjective finite morphism from affine to quasi-affine schemes (say both Noetherian), it automatically forces the quasi-affine scheme to be affine (even though there are a lot more to argue, but from the above Going-up theorem it is more clear why it's true).

#pagebreak()

= Integrally Closed Domains \& Going down Theorem

This is also one of the common tools in algebraic geometry (when converting geometric data into algebraic pictures).

\ 

For this, let's extend how integral dependence is inherited under localization:
#proposition[
  Let $A subset.eq B$ be rings, $C subset.eq B$ be the integral closure of $A$ in $B$. Then, let $S subset A$ be a multiplicatively closed subset, one has $S^(-1)C subset.eq S^(-1)B$ be the integral closure of $S^(-1)A$ in $S^(-1)B$.
][
  First, it's clear that $S^(-1)C$ remains integral over $S^(-1)A$. Now, let $b/s in S^(-1)B$ be integral over $S^(-1)A$, then there exists $a_1/s_1,...,a_n/s_n in S^(-1)A$, such that it satisfies the following equation:
  $ (b/s)^n + a_1/s_1 (b/s)^(n-1)+...+a_(n-1)/s_(n-1)(b/s)+a_n/s_n=0 $
  Now, mutiply the whole equation by $(s t)^n$, where $t = s_1...s_n$, then one gets the following:
  $ (t b)^n + s a_1 s_2...s_n (t b)^(n-1)+...+s^n a_n s_1...s_(n-1)t^n = 0 in S^(-1)B $
  So, there exists $u in S subset A$, such that the above multiplied by $u$ is $0$ in $B$, by the definition of localization. Similarly, we can multiply by $u^n$, and get the following result:
  $ (t b u)^n + s a_1 s_2...s_n u (t b u)^(n-1)+...+s^n a_n s_1...s_(n-1)t^n u^n = 0 in B $
  Notice that the coefficients are all in $A$, this shows that $t b u$ is integral over $A$, which $t b u in C$, or $(t b u)/1 in S^(-1)C$. Finally, with $t,u in S$, one has $b/s = (t b u)/(t s u) in S^(-1)C$, finishing the proof.
]

\ 

If limited the target to integral domains, most ring extensions of the ring in its field of fraction can be chosen as localization (Note: if it's arbitrary ring extension, it may not be well-defined, as the concept of "denominator" becomes vague once we're out of the class of UFDs). As a result, we can talk about integral dependence with respect to its own algebraic extension:
#definition[Integrally Closed Integral Domain][
  An integral domain $A$ is said o b #text(weight: "bold")[Integrally Closed], if $A$ is integrally closed in $K$, where $K$ is its field of fraction.
]

\ 

The classical example is $ZZ subset QQ$, which the proof in fact applies to all UFD, where gcd is well-defined:
#prop[
  Let $A$ be a UFD, then $A$ is integrally closed.
][
  Let $K$ be $A$'s field of fraction, let $a/b in K$ be an element that's integral over $A$ (in particular, choose $gcd(a,b)=1$). Then, there exists $a_1,...,a_n in A[x]$, such that the following holds:
  $ (a/b)^n + a_1 (a/b)^(n-1)+...+a_n =0 in K ==> a^n + a_1 b a^(n-1)+...+a_n b^n=0 in A $
  So, we get $a^n = -b(a_1 a^(n-1)+...+a_n b^(n-1))$, showing $b$ divides $a^n$. But, if $b$ is not a unit, with $gcd(a,b)=1$, this generates a contradiction. So, $b$ must be a unit, showing $a/b = a b^(-1) in A$.
]

\ 

Now, let's talk about the locality of integral closure:
#proposition[
  Let $A$ be an integral domain. The following are equivalent:
  1. $A$ is integrally closed.
  2. $A_P$ is integrally closed, for all prime ideal $P subset A$.
  3. $A_(frak(m))$ is integrally closed, for all maximal ideal $frak(m) subset A$.
][
  $1 ==> 2$:

  This can be derived by the proposition of the start of the section, since they all share the same field of fraction, then $A subset K$ is integrally closed implies $A_P subset K_P = K$ is integrally closed (as localization doesn't change integral closure).

  \ 

  $2==> 3:$

  By definition.

  \ 

  $3==> 1:$

  Consider the inclusion map $iota:A arrow.hook C$, where $C subset K$ is the integral closure of $A$. Then, $A$ is integrally closed $<==>$ this map is surjective. 
  
  Since $A_frak(m) arrow.hook C_(frak(m))$ is the integral closure in $K_(frak(m))=K$ for all maximal ideal $frak(m) subset A$, then having all $A_frak(m)$ being integrally closed implies all such map has cokernel (as $A_frak(m)$-module) being $0$. Which, since the cokernel is precisely $coker(iota) tensor_A A_frak(m)$ for each maximal ideal, then having all of them being $0$ implies $coker(iota)=0$, showing $iota$ is surjective.
]

\ 

Now, we can also talk about the concept of integral dependence over an ideal, and integral closure of an ideal by refining the definition:
#definition[Integral Dependence and Closure over an Ideal][
  Let $I subset.eq A$ be an ideal, and $A subset.eq B$ be rings. Then, an element $b in B$ is #text(weight: "bold")[Integral over $I$], if the integral dependence on $A$ can be chosen with coefficients in $I$.

  Similarly, the #text(weight: "bold")[Integral Closure of $I$ in $B$], is the set of all elements in $B$ that're integral over $I$.
]

Which, it in fact has a particularly nice characterization:
#lemma[
  Let $A subset.eq B$ be rings, $C$ the integral closure of $A$ in $B$, and $I subset.eq A$ be an ideal, with $I^e$ denotes its extension in $B$. Then, $sqrt(I^e) subset.eq C$ is precisely the integral closure of $I$ in $B$.
][
  Let $x in C$ be integral over $I$, then there exists $a_1,...,a_n in I$, such that the following equality holds:
  $ x^n+a_1 x^(n-1)+...+a_n = 0 $
  Since $a_1,...,a_n in I^e$ within $C$, then $x^n = -(a_1 x^(n-1)+...+a_n) in I^e$, showing $x in sqrt(I^e)$.

  \ 

  Conversely, if $x in sqrt(I^e)$, then some $k in NN$ satisfies $x^k in I^e$. Which, there exists $a_1,...,a_n in I$ and $c_1,...,c_n in C$, such that $x^n = sum_(i=1)^n c_i a_i$. As a result, since $c_1,...,c_n in C$ are integral over $A$, then $M=A[c_1,...,c_n]$ is a finitely generated $A$-module, together with $x^k in I M$ (since it can be generated with coefficients in $I$). In particular, $x^k M subset.eq I M$.

  Finally, let $phi:M -> M$ be the multiplication by $x^k$, then since $phi(M) = x^k M subset.eq I M$, "Cayley-Hamilton" theorem guarantees that we can find $r_1,...,r_m in I$, such that $phi^m + r_1 phi^(n-1)+...+r_m = 0$, in particular its multiplication on $M = A[x_1,...,x_n]$ is $(x^k)^m+r_1 (x^k)^(m-1)+...+r_m$. Let it act on the identity $1 in M$, we see that $(x^k)^m+r_1 (x^k)^(m-1)+...+r_m=0$, hence $x$ is integral over $I$, proving the desired result.
]

In particular, this shows the integral dependence over an ideal forms a set that's additively / multiplicatively closed.

\ 

Here is an application about the integral dependence over an ideal:

#proposition[
  Let $A subset.eq B$ be integral domains, $A$ integrally closed, $I subset.eq A$ and ideal, and let $x in B$ be integral over $I$. Then, $x$ is algebraic over the field of fractions $K$ of $A$, and if the minimal polynomial over $K$ is $t^n + a_1 t^(n-1)+...+a_n$, then $a_1,...,a_n in sqrt(I)$.
][
  It's clear that $x$ is algebraic over $K$ (as it satisfies some equation over $A arrow.hook K$).

  \ 
  
  Let $rho_(x,K)(t)=t^n+a_1 t^(n-1)+...+a_n in K[t]$ be the minimal polynomial of $x$. Let $x_1,...,x_k in L$ be the roots of $rho_(x,K)$, where $L$ is a field extension of $K$ containing all roots of $rho_(x,K)$ (also called the #emph[conjugates] of $x in K$). Then, since each $x_i$ satisfies the same integral dependence equation as $x$ (because any polynomial over $A arrow.hook K$ satisfied by $x$, must also be divisible by ), then all $x_i$ are integral over $I subset.eq A$. 
  
  \
  
  As a result, since $A arrow.hook K$ is integrally closed (or, the integral closure in $K$ is itself), everything in $K$ that's integral over $I$ must be contained in $sqrt(I)$. Then, since $rho_(x,K)$ has $a_1,...,a_n in K$ be polynomials in terms of $x_1,...,x_k$, which are also integral over $I$ (since $A arrow.hook L$ has all elements integral over $I$ be gathered in a additively / multiplicatively closed set, since it's a radical of $A$'s integral closure in $L$; in particular, $a_1,...,a_n$ is inside that radical, which are integral over $I$). So, $a_1,...,a_n in A$, in particular $a_1,...,a_n in sqrt(I)$ (since they're elements in $K$ that's integral over $A$, so contained in $A$ by integral closeness; then, it's integral over $I$, which is contained in $sqrt(I)$).
]

\ 

Now, let's talk about the main goal for this section:

#theorem("Going Down Theorem")[
  Let $A subset.eq B$ be integral domains, $A$ integrally closed, and $B$ integral over $A$. Let $P_1 supset.eq ... supset.eq P_n$ be a chain of prime ideals of $A$, and $Q_1 supset.eq ... supset.eq Q_m$ be a chain of prime ideals over $B$ (where $m<n$) such that $P_i = A sect Q_i$ for all $1<=i<=m$. Then, it can be extended to a chain of prime ideals $Q_1 supset.eq ... supset.eq Q_n$ in $B$, such that $P_i = A sect Q_i$ for all $i$.
][
  Using similar process as the Going Up Theorem, we can take quotient and use induction to reduce down to the case $m=1, n=2$.

  \ 

  Again, we have the following commutative diagram regarding localization:
  #set align(center)
  #diagram($
             A edge("hook->") edge("d","hook->") & B edge("d","hook->")\
             A_(P_1) edge(->) & B_(Q_1)
           $)
  #set align(left)
  Which, the goal is finding a prime ideal in $B_(Q_1)$, such that the contraction in $A$ becomes $P_2$. Which, since a prime ideal is a contraction of prime ideal $<==>$ its extension then contraction is itself, then it's the same as saying $B_(Q_1) P_2 sect A = P_2$ (under $A arrow.hook B_(Q_1)$, $B_(Q_1)P_2$ is extension of $P_2$, then $B_(Q_1) P_2 sect A$ is the ocntraction).

  \ 

  Any element $x in B_(Q_1)P_2$ is of the form $y/s$, where $y in B P_2$, and $s in B\\Q_1$. Then, since $B$ is the integral closure of $A$ in $B$, and $y in B P_2 subset.eq sqrt(B P_2)$, this shows that $y$ is integral over the prime ideal $P_2$. So, there exists $u_1,...,u_r in P_2$, such that the following holds:
  $ y^r + u_1 y^(r-1)+...+u_r = 0 $
  In particular, $r$ can be chosen as the minimal degree.

  As a result, if $x=y/s in B_(Q_1)P_2 sect A$, then within certain field extension of $K$ (field of fraction of $A$), one has $s = y x^(-1)$ (where $x^(-1) in K$). So, $s$ satisfies the following equation:
  $ x^(-r)(y^r+u_1 y^(r-1)+...+u_r)= 0, quad s^r + u_1 x^(-1) s^(r-1)+...+u_r x^(-r)=0 $
  Which, the minimal degree forces this equation to be the minimal polynomial of $s$ over $K$ (as each $v_i := u_i x^(-i) in K$). Which, since $x^i v_i = u_i in P_2$ for all $1<=i <=r$, with $s in B$ being integral over $A$, the previous proposition states each $v_i in A$ (by choosing the ideal $I:= A$ the unit ideal).

  \ 

  Finally, to show $x in P_2$, suppose the contrary that it doesn't, then each $x^i v_i = u_i in P_2$ implies all $v_i in P_2$. Hence, Hence, eventually this shows that $s^r in B P_2 subset.eq B P_1 subset.eq Q_1$, so by prime property $s in Q_1$, which contradicts the assumption $s in B\\Q_1$.

  This forces $x in P_2$, hence $B_(Q_1)P_2 sect A = P_2$.
]

\ 

Finally, it comes to the following proposition:
#proposition[
  Let $A$ be an integrally closed domain, $K$ its field of fractions, $L$ a finite separable algebraic extension of $K$, and $B$ the integral closure of $A$ in $L$.

  Then, there exists a basis $v_1,...,v_n in L$ as $K$-vector space, such that $B subset.eq sum_(j=1)^n A v_j$.
][
  For all $v in L$, since it's algebraic over $K$, then by multiplying its minimal polynomial over $K$, with the common multiple of the coefficients, we can choose $a_0,...,a_n in A$, such that the following holds:
  $ a_0 v^n + a_1 v^(n-1)+...+a_n = 0, quad (a_0 v)^n + a_1 (a_0 v)^(n-1)+...+a_n a_0^(n-1) = 0 $
  Which, the latter equation is the former one multiplied by $a_0^(n-1)$, showing that $a_0 v in L$ is integral over $A$, hence $a_0 v in B$. Then, choose any basis $v_1,...,v_n in L$ as $K$-vector space, multiply by suitable $a_0 in A$ for each $v_i$ (as $v$ for above), it becomes a basis $u_1,...,u_n in L$ over $K$, where each $u_i in B$.

  \ 

  Now, since $L\/K$ is separable, let $T:L-> K$ denotes the trace of each element (as $K$-linear operator by multiplication), then separable extension guarantees the bilinear form $(x,y) mapsto T(x y)$ to be nondegenerate (probably some nontrivial field theory fact...). Then, one can choose a dual basis $v_1,...,v_n in L$, that satisfies $T(u_i v_j)= delta_(i j)$. 

  For all $x in B$, there exists unique $x_1,...,x_n in K$, such that $x = sum_(j=1)^n x_j v_j$. Since each $x u_i in B$, then as a result $T(x u_i) in A$, since the trace of a linear operator is a multiple of one of its coefficients in the minimal polynomial (which by one of the previous propositions, must lie in $A$). As a result, $T(x u_i) = sum_(j=1)^n T(x_j u_i v_j) = sum_(j=1)^n x_j T(u_i v_j) = sum_(j=1)^n x_j delta_(i j) = x_i$. So, each $x_i in A$, showing $B subset.eq sum_(j=1)^n A v_j$.
]

#pagebreak()

= Valuation Ring

There are multiple ways of characterizing these types of rings. First, let's start with a common definition:
#definition[Valuation Ring of a Field][
  Let $B$ be an integral domain with $K$ being its field of fractions. Then, $B$ is a #text(weight: "bold")[Valuation Ring of $K$], if for all $x in K^times$, at least one of $x,x^(-1)$ is contained in $B$.
]

\ 

Turns out, there are multiple ways of characterizing it:
#proposition[
  Given an integral domain $B$ with its field of fraction, the following conditions are equivalent:
  1. For all $x in K^times$, at least one of $x,x^(-1)$ is contained in $B$.
  2. The ideals of $D$ are totally ordered by inclusion.
  3. The principal ideals of $D$ are totally ordered by inclusion.
][
  $1 ==> 2:$

  Suppose all $x in K^times$ has at least one of $x,x^(-1)$ contained in $B$. Let $I,J subset.eq B$ be ideals, and suppose the contrary that $I subset.eq.not J$ and $J subset.eq.not I$. Then, there exists $i in I\\J$ and $j in J\\I$.

  Now, consider the two elements $i j^(-1)$ and $i^(-1)j$, since they're mutual inverses, at least one of them is in $B$. For definiteness, if $i j^(-1) in B$, then $i = (i j^(-1))j in J$, contradicting the assumption $i in.not J$ (for the other case the proof is the same).

  So, one of the ideal must be contained in the other one, showing the total order of ideals.

  \ 

  $2 ==> 3:$

  If all ideals in $B$ are totally ordered by inclusion, $3$ follows directly.

  \ 

  $3==>1:$

  Suppose all principal ideals of $B$ are totally ordered by inclusion, then for all nonzero element $a/b in K^times$ (field of fraction of $K$), since $a,b in B$, so either $(a) subset.eq (b)$ or $(b) subset.eq (a)$.

  For definiteness, say $(a) subset.eq (b)$, then $a = c b$ for some $c in B$, showing that $a/b = (c b)/b = c in B$. For $(b) subset.eq (a)$, the same proof shows that $b/a = (a/b)^(-1) in B$.
]

Which, all of these can be used as the definition of valuation ring. It is also proven to be equivalent to the definition related to a valuation:

#definition[Valuation on a Field][
  Let $Gamma$ be a ttally ordered abelian group (so, all $a,b,c in Gamma$ can be compared, and satisfies $a<=b$ implies $a+c <= b+c$). Define an extra relationship on $Gamma union {infinity}$ by $a+infinity= infinity$, and $infinity >=a$ for all $a in Gamma$.

  Given a field $K$, a valuation $v:K-> Gamma union {infinity}$ satisfies the following:
  - $v(0) = infinity$.
  - $v(x y)=v(x)+v(y)$.
  - $v(x+y)>= min{v(x),v(y)}$.
]
For instance, take $K((X))$ the laurent series field over a field $K$, then the minimal degree of a laurent series define a valuation $deg:K((X))-> ZZ union {infinity}$.

Notice a valuation has the following property:
#proposition[
  Let $Gamma$ be a totally ordered abelian group, $v:K-> Gamma union {infinity}$ be a valuation. Then, the following holds:
  1. $v(1)=v(-1)=0$.
  2. For all $x in K^times$, $v(x^(-1))=-v(x)$.
][
  1. This relies on the fact that nothing in $Gamma$ can have finite order (since if $a in Gamma\\{0}$, then either $x>0$ or $x<0$; for definiteness say $x>0$, then for all $n in NN$, $n x>(n-1)x>...>x>0$).

    Which, $v(1) = v(1 dot 1)=v(1)+v(1)$, so $v(1)=0$; also, $0=v(1)=v((-1) dot (-1))=v(-1)+v(-1)$, showinv $v(-1)=-v(-1)$, so $v(-1)=0$ by the fact that all elements have infinite order.

    \ 

  2. Since $v(x x^(-1))=v(1)=0$, one has $v(x)+v(x^(-1))=0$, so $v(x^(-1))=-v(x)$.
]

\ 

Which, another equivalent definition of valuation ring is as follow:
#theorem[
  Let $B$ be an integral domain, and $K$ be its field of fraction. Then, $B$ is a valuation ring of $K$ $<==>$ there exists a totally ordered abelian group $Gamma$ and a valuation $v:K-> Gamma union{infinity}$, such that $B = {x in K | v(x)>=0}$ (where $0 in Gamma$ is the identity).
][
  $<==:$

  Suppose the valuation exists, one only needs to verify that $B$ is a ring (as any nonzero $x in K^times$ has $v(x)<=0$ or $v(x)>=0$, whih the second case has $x in B$, the first case has $v(x^(-1))=-v(x)>=0$, so $x^(-1) in B$).

  - It's clear that $0,1 in B$ (as $v(0)=infinity >0$, and $v(1)=0$).
  - If $x,y in B$, then $v(x+y)>= min{v(x),v(y)}>=0$, and $v(x y)=v(x)+v(y)>=0$, so $x+y,x y in B$.

  This shows that $B$ is a ring satisfying the valuation ring definition we have initially.

  \ 

  $==>:$

  Suppose $B$ is a valuation ring of $K$, we know all $x in K^times$ has at least one of $x,x^(-1)$ in $B$, and its principal ideals are totally ordered. 

  Now, consider the group $Gamma := K^times\/B^times$ (which is well-defined, as $K^times$ is abelian). Which, notice it has the following property:
  - For all $x,y in B$, if $overline(x)=overline(y) in Gamma$, there exists unit $u in B$, such that $u x=y$, showing $(x)=(y)$ as ideals in $B$ (and the converse is also true).

  \

  So, for any $overline(x),overline(y) in Gamma$, define the following order on all $overline(x), overline(y) in Gamma$:
  - If $x in B$ (then consequently everything in the equivalence class $overline(x)$ is in $B$, since they're multiplied by elements in $B^times$), then $overline(x)>=e$ (here $e$ is the class of $B^times$, the identity of $Gamma$). Similarly, $overline(x^(-1))<=e$.
  - If both $x,y in B$, then define $overline(x)>=overline(y)$ iff $(x) subset.eq (y)$ as ideals in $B$. For this case, define $overline(x^(-1))<=overline(y^(-1))$. (This relation is transitive when compared to $e$).

  \

  Let's verify this is a total order (as it's of course well-defined):
  - For all $overline(x) in Gamma$, if $x in B$ it's clear $overline(x)>=overline(x)$ (as $(x) subset.eq (x)$); as a consequence, $overline(x^(-1))<=overline(x^(-1))$, so it's reflexive.
  - If $overline(x)<=overline(y)$ and $overline(x)>=overline(y)$, then in particular they both $>=e$ or $<=e$. As a result, they're comparable, or their inverses are comparable. Which, the comparison in $B$ forces $overline(x)=overline(y)$ or $overline(x^(-1))=overline(y^(-1))$.
  - Transitivity again works in $B$, and since it's transitive with respect to $e$ by definition, it's transitive.

  Eventually, define $v:K^times -> Gamma$ as projection, and $v:K-> Gamma union {infinity}$ by $v(0) = infinity$, then it's a valuation, with $B = {x in K | v(x)>=e}$ (since it's set so that elements in $B$ has relation $overline(x)>=e$).
]

\ 

Now, here are some propositions of valuation rings:
#proposition[
  1. $B$ is a local ring.
  2. If $B subset.eq B' subset.eq K$ where $B'$ is a ring, then $B'$ is also a valuation ring of $K$.
  3. $B$ is integrally closed (in $K$).
][
  1. Let $frak(m) subset B$ be a set containing all non-invertible elements in $B$ (containing $0$). Notice the following:
    - For all $a in B$ and $x in frak(m)$, either $a x=0 in frak(m)$, or $a x!=0$, which leads to $(a x)^(-1) in.not B$ (or else $(a x)^(-1)=a^(-1)x^(-1)$ implies $x^(-1) = a (a x)^(-1) in B$, contradicting the definition that $x$ is not invertible). So, $a x in frak(m)$ regardless.
    - For all nonzero $x,y in frak(m)$, it's clear that $x y in frak(m)$ (as its inverse $x^(-1)y^(-1)$ cannot be in $B$, or else one of $x^(-1)=(x^(-1)y^(-1))y$, or $y^(-1)=x(x^(-1)y^(-1))$ is in $B$, contradicting the assumption).
    - If consider the element $x y^(-1) in K$, either it's in $B$ or $x^(-1)y in B$. For definiteness, choose the first case, then notice the following:  
      $ (1-x y^(-1))y = y-x in frak(m) $ 
      For the other case invert everything in the equation will give $x-y in frak(m)$. 

    Which, $frak(m)$ is an ideal. And, everything outside of $frak(m)$ is invertible, showing it must be the only maximal ideal.

    \ 

  2. By definition, $B'$ containing $B$ (where every $x in K$ has either $x in B subset.eq B'$ or $x^(-1) in B subset.eq B'$), so it's automatically a valuation ring.

    \ 

  3. For all nonzero $x in K$ that's integral over $B$. If $x in B$ we're already done, so assume $x in.not B$, showing $x^(-1) in B$. Say there exists $a_1,...,a_n in B$, such that $x^n + a_1 x^(n-1)+...+a_n = 0$ in $K$. Then, multiply by $x^(1-n) in B$, we have:
    $ x^n = -(a_1 x^(n-1)+...+a_n), quad x = -(a_1+...+a_n x^(1-n)) in B $
    Yet this is a contradiction, so one must have $x in B$.
]

\ 

\ 

Now, let's talk about ring extensions within an algebraically closed field: Given $K$ a field, $Omega$ an algebraically closed field. (Note: Here we don't have relations between $K$ and $Omega$).

Let $Sigma$ be the set of all pairs $(A,f)$, where $A arrow.hook K$ is a subring, and $f:A-> Omega$ a ring homomorphism, temporarily assume this is nonempty. Then, it has the following partial order, for any $(A,f), (A',f') in Sigma$:
$ (A,f)<= (A',f')" "<==>" "A subset.eq A'," and " f'|_(A) = f $
Which, this satisfies Zorn's Lemma's criterion (by taking union of rings in a chain, and define the morphism based on restrictions). So, by definition it exists a maximal element, say $(B, g) in Sigma$.

#lemma[
  $B$ above is a local ring, and $frak(m) = ker(g)$ is its maximal ideal.
][
  We know $B subset.eq K$ is a subring, hence an integral domain; also, $g(B) subset.eq Omega$ is a subring, hence an integral domain also. This shows that $frak(m)=ker(g)$ is a prime ideal. Now, since all elements outside of $frak(m)$ gets sent to a nonzero element in $Omega$, it's invertible, hence the map uniquely factors through its localization:
  #set align(center)
  #diagram($
             B edge("dr","hook->", script(phi), #right) edge("rr",->, script(g)) && Omega\
             & B_frak(m) edge("ur","..>", script(exists ! overline(g)), #right)
           $)
  #set align(left)
  However, notice that similarly we also have the following relation:
  #set align(center)
  #diagram($
             B edge("dr","hook->", script(phi)) edge("rr","hook->") && K\
             & B_frak(m) edge("ur","hook..>", script(exists !), #right)
           $)
  #set align(left)
  Which, $B_frak(m)$ is a subring of $K$ containing $B$ (since an integral domain has all its localization being a subring of its field of fraction). Then, in particular $(B,g)<= (B_frak(m), overline(g))$ based on the above two relations.

  So, by maximality, we must have $B=B_frak(m)$, $B$ is a local ring, and $frak(m)$ must be its maximal ideal.
]

\ 

#lemma[
  Let $x$ be a nonzero element of $K$. Let $B[x]$ be the subring of $K$ generated by $x$ over $B$, and $frak(m)[x]$ be the extension of $frak(m)$ in $B[x]$. Then, either $frak(m)[x]!= B[x]$, or $frak(m)[x^(-1)]!= B[x^(-1)]$.
][
  Suppose the contrary that  there exists $x in K$, such that $frak(m)[x]=B[x]$, and $frak(m)[x^(-1)]=B[x^(-1)]$. Then, there exists $u_0,...,u_n,v_0,...,v_m in frak(m)$, such that the following holds:
  $ 1 = u_n x^n + ... + u_0 = v_m x^(-m)+...+v_0 $
  Here, choose $m,n$ to be the minimal integers such that the above holds.
]
