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
    colors: ergo-colors.bw,  
    styles: ergo-styles.basic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 220B Final",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= D//1
#problem[
  Let $R$ be a commutative ring such that $R_frak(m)$ is a Noetherian ring for every maximal ideal $frak(m)$. Prove or disprove that $R$ is Noetherian.

  \ 

  #line(length: 100%)

  \ 
][
  /*Test: Consider the direct product ring $R=product_(n=0)^infinity ZZ\/2ZZ$. Then, its maximal ideal must necessarily be of the form $m_i = product_(n!=i)ZZ\/2ZZ$ (the only maximal ideal times other whole copies of ring). Then, anything not in this maximal ideal $m_i$ is of the form  $(a_0,...,a_i=1,...)$.

  Now, if the following holds in localization:
  $ ((a_0,a_1,...,a_i,...))/((s_0,s_1,...,1,...))=((b_0,b_1,...,b_i,...))/((t_0,t_1,...,1,...)) $
  Then, there must exists $(u_0,u_1,...,1,...) in R\\m_i$, such that the following holds:
  $ &((a_0,a_1,...,a_i,...)(t_0,t_1,...,1,...)-(b_0,b_1,...,b_i,...)(s_0,s_1,...,1,...))(u_0,u_1,...,1,...)= 0\
  \
  & (a_0 t_0-b_0 s_0,a_1 t_1-b_1 s_1,...,a_i-b_i,...)(u_0,u_1,...,1,...)=0\ 
  \
  & (u_0(a_0 t_0-b_0 s_0),u_1(a_1 t_1-b_1 s_1),...,a_i-b_i,...)=0 $
  Which, the equality implies $a_i-b_i=0$, or $a_i-b_i$; conversely, if $a_i=b_i$, then take $(u_0,u_1,...,1,...) in R\\m_i$ such that any $j!=i$ satisfies $u_j=0$, the above equality then shows the two fractions are equal (since the other coordinates are $0$ by multiplying $u_j$).

  As a result, one has $R_(m_i) tilde.equiv ZZ\/2ZZ$ a field, hence Noetherian. But, $R$ itself is clearly not Noetherian (by increasing the ideals)*/
  We'll disprove the statement, by providing a counterexample.

  \ 

  Consider the direct product ring $R:= product_(n in NN)ZZ\/2ZZ$ (direct product of $ZZ\/2ZZ$'s, with $NN$ as index set). We'll prove the following statements in order:
  1. $R$ is not Noetherian.
  2. Its localization at all maximal ideal is Noetherian.

  \ 

  #text(weight: "bold")[Proof of (1):]

  Let $I_n:= product_(i=0)^n ZZ\/2ZZ$ in $R$ (i.e. every sequence in $R$ that's of the form $(a_0,a_1,...,a_n,0,...)$ that is $0$ after index $n$). Notice that it's an ideal: Its product structure gave an additive subgroup structure, and it's an ideal because all $(a_0,a_1,...,a_n,0,...) in I_n$ and any $(b_n)_(n in NN) in R$ has the following:
  $ (a_0,a_1,...,a_n,0,...)(b_0,b_1,...,b_n,b_(n+1),...) = (a_0 b_0,a_1 b_1,...,a_n b_n,0,...) in I_n $
  Now, since $I_n$ allows every element $(a_k)_(k in NN)$ with $a_(k)=0$ for all $k>n$, then in particular $I_n subset I_(n+1)$ (as all elements in $I_n$ has $a_k=0$ for all $k>n$, which is true for all $k>(n+1)$), and the inclusion is strict, as the element $(0,...,0,1,0,...) in I_(n+1)\\I_n$ (where the $1$ appears at the $(n+1)$th entry). So, with the strict increasing chain of ideals $I_0 subset I_1 subset ...$, we concluded that $R$ is not Noetherian.

  \ 

  #text(weight: "bold")[Proof of (2):]

  Notice that $R$ satisfies the following: For any $a in ZZ\/2ZZ$, since $a^2=a$, then any $(a_n)_(n in NN) in R$ satisfies $((a_n)_(n in NN))^2 = (a_n^2)_(n in NN) = (a_n)_(n in NN)$. In particular, for any maximal ideal $frak(m) subset R$, one has $R_(frak(m))$ also satisfies this property.

  Now, notice that for a commutative ring $A$ with the property that all $a in A$ satisfies $a^2=a$ has all its prime ideal be maximal: Let $P subset.eq A$ denotes a prime ideal, $A\/P$ is an integral domain. Then, for any nonzero $overline(a) in A\/P$, we have $overline(a)^2 = overline(a^2)=overline(a) = overline(1) dot overline(a)$, so $overline(a)(overline(a)-overline(1))=0$. Which, with $overline(a)!=0$, one must have $overline(a)-overline(1)=0$, or $overline(a)=overline(1)$. This shows that $A\/P$ is $ZZ\/2ZZ$, in particular a field (since ${0,overline(1)}$ are all the elements). This concludes that $P$ is a maximal ideal.

  As a result, $R_frak(m)$ is a local ring with the property that all $a in R_(frak(m))$ satisfies $a^2=a$, then all its prime ideals are maximal; since it only has one maximal ideal, then the only prime (maximal) ideal is $frak(m) R_frak(m)$. So, $Nil(R_frak(m)) = frak(m)R_frak(m)$, showing all elements in $frak(m)R_frak(m)$ are nilpotent. Yet, any $x in frak(m)R_frak(m)$ has $x^2=x$, so any $n in NN$ satisfies $x^n=x$. Then, $x$ is nilpotent enforces $x=0$ (since some $n in NN$ satisfies $x=x^n=0$).

  This implies that $R_frak(m)$ has maximal ideal $0$, which must be a field, in particular it's Noetherian.

  \ 

  This shows a counterexample where $R_frak(m)$ is a Noetherian ring for all maximal ideal $frak(m)$, while $R$ itself is not Noetherian.
]

#pagebreak()

= D//2
#problem[
  Let $A$ and $B$ be Noetherian rings together with surjective ring homomorphisms $f:A->C$ and $g:B->C$. Let $D=A times_C B = {(a,b) in A times B | f(a)=g(b)}$ be the subring of the direct product ring $A times B$. Prove or disprove that $D$ is a Noetherian ring.

  \ 

  #line(length: 100%)

  \ 
][
  /*Idea: It must be Noetherian.

  Try to prove the map $A times_C B ->> A->> C$ has kernel being exactly $ker(f) times ker(g)$, which it forms the following exact sequence as $A times_C B$-module:
  $ 0-> ker(f) times ker(g) -> A times_C B ->> C -> 0 $
  Notice that since $ker(f) subset.eq A$ and $ker(g) subset.eq B$ are finitely generated by Noetherian Property (say $ker(f)=(a_1,...,a_n), ker(g)=(b_1,...,b_m)$), then, $(a_1,0),...,(a_n,0), (0,b_1),...,(0,b_m)$ generates $ker(f) times ker(g)$: Here, it uses the fact that any $a in A$ has some $b in B$, such that $(a,b) in A times_C B$ (by surjectivity of $f,g$). As a result, any $k in ker(f), l in ker(g)$, there exists $r_1,...,r_n in A, s_1,...,s_m in B$, such that $k=r_1 a_1+...+r_n a_n$ and $l = s_1 b_1+...+s_m b_m$.  Suppose $(r_1,p_1),...,(r_n,p_n),(q_1,s_1),...,(q_m,s_m) in A times_C B$, then we have the following:
  $ &(r_1,p_1)(a_1,0)+...+(r_n,p_n)(a_n,0)+(q_1,s_1)(0,b_1)+...+(q_m,s_m)(0,b_m)\ 
  &= (r_1 a_1,0)+...+(r_n a_n,0)+(0,s_1 b_1)+...+(0, s_m b_m)\ 
  &= (r_1 a_1+...+r_n a_n, s_1 b_1+...+s_m b_m)\ 
  &= (k,l) $
  Hence, $ker(f) times ker(g)$ is a fin. gen. $A times_C B$-module. 

  \

  This ideal is Noetherian $A times_C B$-module, simply because as $A times_C B$-module, it's isomorphic to $ker(f) plus.circle ker(g)$, which each are Noetherian $A times_C B$-module.

  So, the exact sequence forces $A times_C B$ to be Noetherian over itself, and hence a Noetherian ring.*/
  We'll prove that $D=A times_C B$ is a Noetherian ring.

  \ 

  First, let $pi_A:D ->A$, $pi_B:D-> B$ be the restriction of projection from $A times B$ onto $A,B$ respectively (and use these ring homomorphisms to define $A,B$ as $D$-modules). We observe that $pi_A,pi_B$ are surjective:
  - For any $a in A$, consider $f(a) in C$, by the surjectivity of $g:B->>C$, there exists $b in B$, such that $g(b)=f(a)$, so $(a,b) in D$. This causes $pi_A (a,b) = a$, showing surjectivity of $pi_A$.
  - Similarly, any $b' in B$ with $g(b) in C$, the surjectivity of $f:A->>C$ guarantees an $a' in A$, such that $f(a')=g(b')$. So, $(a',b') in D$, $pi_B (a',b')=b'$, showing surjectivity of $pi_B$.

  Which, we can consider the composition $phi = f compose pi_A:D->> A ->> C$, which is a surjective ring homomorphism (and it realizes $C$ as an $D$-module). In particular, for all $(a,b) in D$ and $c in C$, the action $(a,b) dot c = phi(a,b)c = f(a)c$.

  \  

  On the other hand, also consider $ker(phi) subset.eq D$, which we claim that $ker(phi) = ker(f) plus.circle ker(g)$. 
  - For any $(a,b) in ker(phi)$, since $phi(a,b) = f(a) = 0$, one has $a in ker(phi)$; also, since $g(b)=f(a)=0$, we also have $b in ker(g)$, showing $(a,b) in ker(f) plus.circle ker(g)$, or $ker(phi) subset.eq ker(f) plus.circle ker(g)$.
  - On the other hand, arbitrary $a' in ker(f)$ and $g' in ker(g)$ satisfies $f(a')=0=g(b')$, hence $(a',b') in D$ and $phi(a',b')=f(a')=0$, so $(a',b') in ker(phi)$, showing $ker(f) plus.circle ker(g) subset.eq ker(phi)$. This shows $ker(phi)=ker(f) plus.circle ker(g)$ as set.

  \ 

  Now, we'll claim the following statements in order:
  + As $D$-modules, $A,B,C$ have all submodules being precisely their ideals.
  + As $D$-module, $A,B,C$ are Noetherian. In particular, all ideals of $A,B,C$ are Noetherian over $A times_C B$.
  + As $D$-module, $ker(phi) tilde.equiv ker(f) plus.circle ker(g)$.
  Then, we'll use these information to conclude the main statement.

  \ 

  \ 

  #text(weight: "bold")[Proof of (1):]

  Here, we'll prove something that's applicable for all $A,B,C$:

  \

  #lemma[
    If $phi:R->>S$ is a surjective ring homomorphism, then defining $S$ as an $R$-module with such homomorphism, the $R$-submodules of $S$ are precisely its ideals.
  ][
    For any $R$-submodule $I subset.eq S$, since $phi:R->>S$ is also an $R$-linear map, one has $phi^(-1)(I) subset.eq R$ being an $R$-submodule. But, the $R$-submodule of $R$ are precisely its ideals, so $phi^(-1)(I)$ is an ideal. With surjectivity of $phi$, $I = phi(phi^(-1)(I))$ is an ideal of $S$.

    Conversely, any ideal $I subset.eq S$ is of the form $I = phi(phi^(-1)(I))$, with $phi^(-1)(I) subset.eq R$ be an ideal (in particular, an $R$-submodule), $I$ is also an $R$-submodule of $S$.
  ]

  \

  Then, since the surjective ring homomorphisms $pi_A:D->> A$, $pi_B:D->>B$, and $phi:D->>C$ define each ring as $D$-modules respectively, all of their $D$-submodules are precisely their ideals.

  \ 

  \

  #text(weight: "bold")[Proof of (2):]

  Again, we'll prove something that's applicable for all $A,B,C$:

  \ 

  #lemma[
    If $phi:R->>S$ is a surjective ring homomorphism, then $S$ is a Noetherian ring $==>$ it's a Noetherian $R$-module.
  ][
    In (1) we've proven all its $R$-submodules are its ideals $I subset.eq S$. Which, $S$ is a Noetherian ring implies $I$ is finitely generated, say $I=(a_1,...,a_n)$. Then, for any $a in I$, there exists $s_1,...,s_n in S$, where $a = sum_(i=1)^n s_i a_i$; by the surjectivity of $phi$, there exists $r_1,...,r_n in R$, such that $phi(r_i)=s_i$ for all index $i$. Hence, the following holds:
    $ a = sum_(i=1)^n s_i a_i = sum_(i=1)^n phi(r_i)a_i = sum_(i=1)^n r_i dot a_i $
    This shows that $I$ as $R$-submodule can be generated by $a_1,...,a_n in I$, in particular it's finitely generated. 

    Hence, with all $R$-submodules being finitely generated, $S$ is a Noetherian $R$-module.
  ]

  \ 

  Now, since $A,B$ are assumed to be Noetherian rings, they're automatically Noetherian $D$-modules based on the lemma (by surjectivity of $pi_A$ and $pi_B$ respectively); also, since $f:A->>C$ is surjective, with $A$ being Noetherian ring, $C$ is also Noetherian ring. Hence, $C$ is also a Noetherian $D$-module with the surjectivity of $phi$.

  As a result, all of their submodules / ideals are Noetherian, in particular $ker(f) subset.eq A$, $ker(g) subset.eq B$ are Noetherian $D$-modules.

  \ 

  \ 

  #text(weight: "bold")[Proof of (3):]

  It's clear that set wise $ker(phi)= ker(f)plus.circle ker(g)$ (proven at the start that within $D$, they're the same), in particular their additive group structures are also the same. Hence, it suffices to verify the $D$-module structures are compatible.

  \ 

  Recall for any $(a,b) in D$, and any $a' in ker(f) subset.eq A$, $b' in ker(g) subset.eq B$, the actions are as follow:
  $ (a,b) dot a' = pi_A (a,b) a' = a a' in ker(f), quad (a,b) dot b' = pi_B (a,b) b' = b b' in ker(g) $
  Hence, one has the following equality on the actions:
  $ (a,b) (a',b') = (a a', b b') = (pi_A (a,b)a', pi_B (a,b)b') = ((a,b) dot a', (a,b) dot b') = (a,b) dot (a',b') $
  where the left most side is the multiplication on $ker(phi) subset.eq D$, while the right most side indicates the $D$-action on $ker(f) plus.circle ker(g)$. This shows that as $D$-module, $ker(phi) tilde.equiv ker(f) plus.circle ker(g)$.

  \ 

  \ 

  \ 

  Finally, going back to the statement, we have the following exact sequence of $D$-modules:
  #set align(center)
  #diagram($
             0 edge(->) & ker(phi) edge("hook->") & D edge(->>, script(phi)) & C edge(->) &0
           $)
  #set align(left)
  Hence, one has $D$ is a Noetherian ring (i.e. Noetherian as module over itself) $<==>$ $ker(phi)$ and $C$ are Noetherian $D$-modules. 
  - We know $C$ is already Noetherian $D$-module by (2).
  - We also know $ker(phi) tilde.equiv ker(f) plus.circle ker(g)$ as $D$-module, with (2) shows that $ker(f)$ and $ ker(g)$ are Noetherian $D$-modules, so $ker(phi)$ as their direct sum is also Noetherian $D$-module.

  This concludes that $A times_C B$ must be a Noetherian ring.
]

#pagebreak()

= D//3
#problem[
  Let $R$ be a commutative local ring with maximal ideal $frak(m)$. Assume that $frak(m)$ is principal and $sect.big_(n>=1)frak(m)^n=(0)$. Prove or disprove that $R$ is Noetherian.

  \ 

  #line(length: 100%)

  \ 
][
  /*Idea: $R$ is not necessarily Noetherian. Consider $R=k[x_1,...]\/(x_1^2,...)$ (which has infinite indeterminates), which $R$ is clearly not Noetherian (by choosing $(overline(x_1)) subset (overline(x_1),overline(x_2)) subset ...$ as the ascending chain). 
  
  Then, we claim that $frak(m)=(overline(x_1),...) subset.eq R$ is maximal.

  On the other hand, each $frak(m)^n$ must be generated by $overline(x_(i_1))...overline(x_(i_m))$, where each $i_j$ are distinct, and $m>=n$ (since all the powers $>=2$ for the same indeterminate gets killed by the quotient). So, the intersection $sect.big_(n>=1)frak(m)^n=(0)$.*/
  We'll prove that $R$ is Noetherian.

  \ 

  Given that $frak(m) = (a)$ for some $a in R$ (since it's principal), then all of its powers $frak(m)^n = (a^n)$ for all $n in NN$. Which, for all nonzero proper ideal $I subset R$, there exists some $k in NN$, such that $I subset.eq.not frak(m)^k$, since if $I subset.eq frak(m)^k$ for all $k in NN$, then $I subset.eq sect.big_(n>=1)frak(m)^n=(0)$, so $I$ nonzero enforces such $k$ to exists.

  Also, since $I$ is a proper ideal, then $I subset.eq frak(m)$ (all proper ideal is contained in a maximal ideal, and here we only have one choice because the ring is local), so there exists $n in NN$, such that $I subset.eq frak(m)^n$. 
  
  Based on the above two facts, choose the minimum $k in NN$ such that $I subset.eq frak(m)^k = (a^k)$, while $I subset.eq.not frak(m)^(k+1) = (a^(k+1))$. Then, there exists element $i in I\\frak(m)^(k+1)$, which it can be expressed as $i=r a^k$ for some $r in R$ (since $i in frak(m)^(k)$), while $i!=r' a^(k+1)$ for all $r' in R$ (since $i in.not frak(m)^(k+1)$). 

  \ 

  Now, we claim that $r$ must be a unit: Suppose the contrary $r$ is not a unit, then since in $R$ the local ring we have every element in $R\\frak(m)$ being a unit, this enforces $r in frak(m)$. Hence, there exists $r' in R$, such that $r = r' a$. However, this shows that $i = r a^k = (r' a)a^k = r' a^(k+1) in frak(m)^(k+1)$, contradicting our assumption $i in.not frak(m)^(k+1)$. As a result, $r$ must be a unit, and $a^k = r^(-1)i in I$. This shows that $frak(m)^(k)=(a^k) subset.eq I subset.eq frak(m)^k$, showing $I = frak(m)^k = (a^k)$. Hence, all ideal of $R$ is a power of the maximal ideal, and is a principal ideal.

  \ 

  As a result, since all ideals are principal (since it's true for all nonzero proper ideals, while $(0)$ and $R$ are trivially principal), $R$ is a Principal Ideal Ring, in particular Noetherian.
]

#pagebreak()

= D//4
#problem[
  Is there an integral domain $R$ whose all maximal ideals are principal but $R$ is not a PID? Justify your answer.

  \ 

  #line(length: 100%)

  \ 
][
  /*Test: Take all analytic function that's $[0,1]->RR$ (which is an integral domain, since any analytic function with dense $0$ must be identically $0$).

  Note: the ideal $(x-a)$ generated by $x-a$ for all $a in RR$ is maximal (by suitable power series expansion, and factoring $x-a$ out).

  On the other hand, any other ideal not this form (while "claimed" to be maximal) is the unit ideal (by compactness, and the fact that we can square functions over this ring, cf. Aluffi for proof).

  So, all maximal ideals are principal (wait but then the ideals may be principal sill...fuck)

  \ 

  This is a PID, fuck (since every function are only allowed to have finitely many zeros on $[0,1]$, so it can only be factored finitely many times; also, every irreducible elements must be of the form $(x-a)h(a)$ where $h(a)!=0$ at all $a in [0,1]$, so all irreducibles are prime, and they generates maximal ideal).

  \ 

  Maybe this is false. What if we look at the set of non-principal ideals? $Sigma$ denotes such set, it definitely has an upper bound for each chain, hence has a maximal element $J$. Q: Is $J$ maximal? $J$ is prime this is known.*/

  //To be honest, not sure (but some sources proposed that all $f(x) in QQ[x]$ where $f(0) in ZZ$ can be one).
  We claim such integral domain $R$ exists. 

  \ 

  First we'll fix some notations: Let $QQ[[X]]$ denotes the power series ring with coefficients over $QQ$. Let $ZZ_((2))$ denotes the local ring associated to the prime number $2$ (in particular, we'll use the description as a subring of $QQ$, say $ZZ_((2)):= {m/n in QQ | gcd(m,n)=1, " " m in.not 2 ZZ}$). 
  
  Now, define the set $R:= {sum_(n>=0)a_n X^n in QQ[[X]] | a_0 in ZZ_((2))}$, we claim that this is a ring:
  - It's clear that $0,1 in R$ (as $0,1 in ZZ_((2)) arrow.hook QQ$), so this ring has zero and multiplicative identity.
  - For any power series $sum_(n>=0)a_n X^n, sum_(m>=0)b_m X^m in R$, we have $a_0, b_0 in ZZ_((2))$, then their addition and multiplication are as follow:
    $ &sum_(n>=0)a_n X^n+sum_(m>=0)b_m X^m = sum_(n>=0)(a_n + b_n)X^n\
    &a_0+b_0 in ZZ_((2)) ==> sum_(n>=0)(a_n + b_n)X^n in R $
    $ &(sum_(n>=0)a_n X^n)(sum_(m>=0)b_m X^m) = sum_(n>=0)(sum_(k=0)^n a_k b_(n-k))X^n\
    &sum_(k=0)^0 a_k b_(0-k)=a_0 b_0 in ZZ_((2)) ==>sum_(n>=0)(sum_(k=0)^n a_k b_(n-k))X^n in R  $
    Hence, $R$ is closed under addition and multiplication. Also, associativity / distributivity of addition / multiplication directly inherits from $QQ[[X]]$.

  Hence, $R$ is a subring of $QQ[[X]]$. And, because $QQ[[X]]$ is an integral domain, $R$ is also an integral domain.

  \ 

  Now, consider the map $phi:R->> ZZ_((2))$ by $phi(sum_(n>=0)a_n x^n)=a_0$, which $phi$ is a ring homomorphism (since the $0$th coefficient of sum / product, is the sum / product of the $0$th coefficients). It's surjective, just because any $a_0 in ZZ_((2))$ is also a power series in $R$ (with any $n>0$ satisfies $a_n=0$). 

  Here, notice that $sum_(n>=0)a_n x^n in ker(phi)$ iff $phi(sum_(n>=0)a_n x^n) = a_0=0$, so we have the ideal $I_0 = ker(phi) = {sum_(n>=0)a_n x^n in R | a_0=0}$. Now, we'll prove the following in order:
  + $I_0$ is not finitely generated, hence $R$ is not a PID. (In fact, not even Noetherian!)
  + $R$ only has one maximal ideal, and it's $2 R$ (ideal generated by $2 in R$), a principal ideal.

  \ 

  \ 

  \ 

  #text(weight: "bold")[Proof of (1):]

  To prove $I_0$ is not finitely generated, we'll prove via contradiction. Suppose $I_0$ is finitely generated, then there exists power series $f_1,...,f_k in I_0$ such that $I_0=(f_1,...,f_k)$. Here, since each $f_j$ has constant coefficient $0$, denote $f_j := n_j/m_j 2^(l_j)X+ sum_(n>=2)a_(j,n) X^n$, where $n_j/m_j 2^(l_j) in QQ$ satisfies $gcd(n_j,m_j)=1$, $n_j,m_j in.not 2 ZZ$, and $l_j in ZZ$ could be arbitrary.

  Now, let $l=min{l_1,...,l_k}$, and consider the power series $2^(l-1)X in I_0$: By the finite generation assumption, there exists $g_1,...,g_k in R$, such that $2^(l-1)X = sum_(j=1)^m g_j f_j= 2^(l-1)X$. Here, denote each $g_j := p_j/q_j 2^(h_j)+sum_(n>=1)b_(j,n)X^n$, where each $p_j/q_j 2^(h_j) in ZZ_((2))$ satisfies $gcd(p_j,q_j)=1$, $p_j,q_j in.not 2 ZZ$, and the power $h_j>=0$.

  If looking into the degree $1$ coefficient, notice that each $g_j f_j$ has the following form:
  $ g_j f_j = (p_j/q_j 2^(h_j)+sum_(n>=1)b_(j,n)X^n)(n_j/m_j 2^(l_j)X+ sum_(n>=2)a_(j,n) X^n) = (p_j n_j)/(q_j m_j)2^(h_j+l_j)X+"(higher order terms)" $
  Hence, extracting the degree-1 coefficient in the equality $2^(l-1)X=sum_(j=1)^m g_j f_j$, we get:
  $ 2^(l-1) &= sum_(j=1)^m (p_j n_j)/(q_j m_j)2^(h_j+l_j)= (sum_(j=1)^m (p_j n_j product_(k=1\ k!=j)^m q_k m_k)2^(h_j+l_j))\/(product_(j=1)^m q_j m_j) $
  Which, define $ell:= min{h_1+l_1,...,h_k+l_k}$, then each $2^(h_j+l_j) = 2^(h_j+l_j-ell) dot 2^(ell)$, where $h_j+l_j-ell >=0$, showing $2^(h_j+l_j-ell) in ZZ$. Then, we get the following:
  $ 2^(l-1) &= 2^ell dot (sum_(j=1)^m (p_j n_j product_(k=1\ k!=j)^m q_k m_k)2^(h_j+l_j-ell))\/(product_(j=1)^m q_j m_j) $
  Now, notice that the massitve fraction has numerator being integer (since $2^(h_j+l_j-ell) in ZZ$, and the rest of the elements $p_j, n_j, q_k,m_k in ZZ$), and denominator containing no factor of $2$ (since we've chosen each $q_j,m_j in.not 2 ZZ$, so the product $product_(j=1)^m q_j m_j in.not 2ZZ$). 
  
  In particular, if factoring out the powers of $2$ (so the fraction contains no factors of $2$ in numerator and denominator), the right hand side should have powers of $2$ being $>= ell$ (since the fraction can only contribute nonnegative powers of $2$, by the oddness of the denominator, and the fact that numerator is an integer).

  However, the left hand side has power of $2$ being $l-1$. This is a contradiction, because of the following:
  $ forall j in {1,...,k}, quad h_j>=0 " " ==> " " ell = min{h_1+l_1,...,h_k+l_k}>= min{l_1,...,l_k} = l > l-1 $
  So, the left and right hand sides has powers of $2$ that don't match up, causing a contradiction.

  As a consequence, our assumption is false, the ideal $I_0$ is not finitely generated, this shows that $R$ is not a PID.

  \ 

  \ 

  \ 

  #text(weight: "bold")[Proof of (2):]

  To show that $2 R$ is the maximal ideal of $R$, it suffices to show everything in $R\\2 R$ is invertible. For this, let's prepare a lemma:

  \ 

  #lemma[
    For a commutative ring $A$, any power series $sum_(n>=0)a_n X^n in A[[X]]$ having $a_0 in A$ being a unit, is invertible.
  ][
    Suppose $a_0 in A$ is invertible, consider the power series $sum_(m>=0)b_m X^m$ given by $b_0=a_0^(-1)$, and inductively, define each $m>0$ has $b_m := -a_0^(-1) sum_(i=1)^m a_i b_(m-1)$. Then, notice the product is as follow:
    $ (sum_(n>=0)a_n X^n)(sum_(m>=0)b_m X^m) = sum_(n>=0)(sum_(i=0)^n a_i b_(n-i))X^n $
    Let's calculate its coefficients: 
    - For $n=0$, the coefficient is $sum_(i=0)^0 a_0 b_(0-i) = a_0 a_0^(-1)=1$.  
    - For any $n>0$, we have the following:
      $ sum_(i=0)^n a_i b_(n-i) &= a_0 b_n + sum_(i=1)^n a_i b_(n-i) = a_0 (-a_0^(-1)sum_(j=1)^n a_j b_(n-j))+ sum_(i=1)^n a_i b_(n-i)\ 
      &= sum_(i=1)^n a_i b_(n-i) - sum_(j=1)^n a_j b_(n-j) = 0 $
    Hence, we concluded that the multiplication has constant coefficient $1$, and any other coefficients $0$, which is the multiplicative identity. This shows that the power series $sum_(n>=0)a_n X^n$ is invertible, if $a_0 in A$ is invertible.
  ]

  \ 

  As a consequence, for any power series $f=n/m + sum_(n>0)a_n X^n in R\\2 R$ (where $gcd(n,m)=1$, and $m in.not 2 ZZ$, so $n/m in ZZ_((2))$), the power series is not divisible by $2$, hence $n in.not 2 ZZ$ (since if $n in 2 ZZ$, one can write $n=2 k$ for some $k in ZZ$, which $f=(2k)/m + sum_(n>0)a_n X^n = 2(k/m+sum_(n>0)a_n/2 X^n) in 2 R$, because all $n>0$ has $a_n in QQ$ being allowed to divide by $2$; but, this causes a contradiction as $f in.not 2 R$).

  So, $n/m in ZZ_((2))$ is actually invertible, with inverse $m/n$. Using the lemma (specifically the algorithm provided), $f in QQ[[X]]$ has an inverse, and the constant term of $f^(-1)$ is $m/n in ZZ_((2))$. This shows that $f^(-1) in R$, hence $f$ is invertible in $R$.

  So, all elements in $R\\2R$ is a unit, showing that $2 R$ is the only maximal ideal $R$.

  \ 

  \ 

  \ 

  This demonstrates there exists such integral domain $R$, with (the only) maximal ideal being principal ideal, while the ring itself is not a PID.

  /*
  Note: This is originally for the case of pulling back maximal ideal from $ZZ_((2))$.
  
  To prove that $I_0 subset.eq J(R)$, for any power series $f in I_0$ (denote $f = sum_(n>0)a_n X^n$), choose any other power series $y in R$ (denote $y = sum_(m>=0)b_m X^m$), then notice that the term $y f$ has constant term $0$ (since $f$ contains only powers $>0$, so any power must be $>0$ in the product). Hence, the term $1-y f$ has constant coefficient $1 in ZZ_((2)) arrow.hook QQ$.

  Notice that this implies $1-y f$ is invertible in $R$. Let's recall the following lemma:

  \

  #lemma[
    For a commutative ring $A$, any power series $sum_(n>=0)a_n X^n in A[[X]]$ having $a_0 in A$ being a unit, is invertible.
  ][
    Suppose $a_0 in A$ is invertible, consider the power series $sum_(m>=0)b_m X^m$ given by $b_0=a_0^(-1)$, and inductively, define each $m>0$ has $b_m := -a_0^(-1) sum_(i=1)^m a_i b_(m-1)$. Then, notice the product is as follow:
    $ (sum_(n>=0)a_n X^n)(sum_(m>=0)b_m X^m) = sum_(n>=0)(sum_(i=0)^n a_i b_(n-i))X^n $
    Let's calculate its coefficients: 
    - For $n=0$, the coefficient is $sum_(i=0)^0 a_0 b_0 = a_0 a_0^(-1)=1$.  
    - For $n=1$, the coefficient is:
      $ sum_(i=0)^1 a_i b_(1-i) &= a_0 b_1 + a_1 b_0 = a_0 (-a_0^(-1)sum_(i=1)^m a_i b_(m-i))+a_1 a_0^(-1)\ 
      &= -a_1 b_0 + a_1 a_0^(-1) = -a_1 a_0^(-1)+a_1 a_0^(-1)=0 $
    - Inductively, suppose for any $k<n$ the coefficient $sum_(i=0)^k a_i b_(k-i)=0$, then for the case of $n$, we have the following:
      $ sum_(i=0)^n a_i b_(n-i) &= a_0 b_n + sum_(i=1)^n a_i b_(n-i) = a_0 (-a_0^(-1)sum_(j=1)^n a_j b_(n-j))+ sum_(i=1)^n a_i b_(n-i)\ 
      &= sum_(i=1)^n a_i b_(n-i) - sum_(j=1)^n a_j b_(n-j) = 0 $
    Hence, we concluded that the multiplication has constant coefficient $1$, and any other coefficients $0$, which is the multiplicative identity. This shows that the power series $sum_(n>=0)a_n X^n$ is invertible, given $a_0 in A$ is invertible.
  ]

  \

  As a result, since $1-y f$ has constant coefficient $1 in ZZ_((2)) arrow.hook QQ$, it's invertible in $QQ[[X]]$, and its inverse also has constant coefficient $1 in ZZ_((2))$ based on the formula provided in the lemma above. Which, since its inverse has constant coefficient in $ZZ_((2))$, the inverse exists in $R$, hence $1-y f$ is invertible in $R$.

  This shows that $f in J(R)$ (since all $y in R$ satisfies $1-y f$ is a unit in $R$), hence $I_0 subset.eq J(R)$.

  \ 

  \ 

  #text(weight: "bold")[Proof of (3):]

  Since in (2) we've prove that $I_0 subset.eq J(R)$, then any maximal ideal $frak(m) subset R$ contains $I_0$. Which, recall that $I_0 = ker(phi)$, where $phi:R->> ZZ_((2))$ is a projection onto the constant coefficient. As a result, one has $phi(frak(m)) subset.eq ZZ_((2))$ being a maximal ideal; but, since $ZZ_((2))$ only has the maximal ideal $2 ZZ_((2))$, one has $phi(frak(m)) = 2 ZZ_((2))$. And, with $I_0 subset.eq frak(m)$, one has $frak(m) = phi^(-1)(phi(frak(m))) = phi^(-1)(2 ZZ_((2)))$.

  Now, we claim that $2 in R$ satisfies $2 R = frak(m)=phi^(-1)(2 ZZ_((2)))$: 
  - It's clear that $2 R subset.eq frak(m)$, since the generator $2$ satisfies $phi(2) = 2 in 2 ZZ_((2))$.
  - For the converse, we'll prove that every*/

]

#pagebreak()

= D//5
#problem[
  Let $R$ be an integral domain in which the set of principal ideals satisfies the ascending chain condition. Prove or disprove that $R$ is Noetherian.

  \ 

  #line(length: 100%)

  \ 
][
  /*Idea: In a UFD, its principal ideals satisfies the ascending chain condition (because of unique factorization, and each strict inclusion of principal ideals must decrease in the number of irreducible factors). So, to provide a counterexample, it suffices to provide a UFD that's not Noetherian.

  EX: $k[x_1,...]$, since every polynomial can be included into a polynomial ring with finite indeterminate, then it necessarily has a factorization (and it is unique, simply because any two factorizations can be included into the same finite indeterminate polynomial rings, by choosing enough polynomials). So, it's a UFD, but on the other hand it's not Noetherian (consider $(x_1) subset (x_1,x_2) subset ...$ a strict inclusion of ideal, or copy the proof that the ideal $(x_1,...)$ is not finitely generated).*/
  We'll disprove the statement, by providing a counterexample.

  \ 

  Consider $k$ a field, and the integral domain $R=k[x_1,x_2,...]$ with (countably) infinite indeterminates. Notice that the ideal $I=(x_1,x_2,...)$ generated by all indeterminates is not finitely generated as $R$-module:

  #proof[
    Suppose the contrary that $I$ is a finitely generated $R$-module, then there exists $f_1,...,f_n in I$, such that $I=sum_(i=1)^n R f_i=(f_1,...,f_n)$ as ideal. Since each polynomial only involves finitely many indeterminates, there are only finitely many indeterminates involved in $f_1,...,f_n$, say the indeterminates involved are contained in ${x_1,...,x_k}$.

  Then, consider the element $x_(k+1) in I$: By our assumption, there exists polynomials $g_1,...,g_n in R$, such that $x_(k +1) = sum_(i=1)^n g_i f_i$. Which, the indeterminates of $x_(k+1),f_1,...,f_n,g_1,...,g_n$ are alll contained in ${x_1,...,x_m}$ for some suitable $m in NN$, one can realize the elements $x_(k+1),f_1,...,f_n,g_1,...,g_n$ as elements in the subring $ k[x_1,...,x_m] arrow.hook k[x_1,x_2,...]$, and inside this smaller subring, the equality $x_(k+1)=sum_(i=1)^n g_i f_i$ still holds.

  Now, consider the evaluation map $k[x_1,...,x_m] -> k$, by $x_(k+1) mapsto 1$, and all other $x_(r) mapsto 0$. Notice that since each $f_i in I$, then it has no constant term (since one has $f_i = h_1 x_1+...$ for $h_i in R$, such that finitely many $h_i!=0$; then, all the constant terms in $h_i$ are multiplied with $x_i$, which is with constant term $0$). Hence, with each $x_(r) mapsto 0$ for $r!=k+1$ (in particular, $r=1,...,k$ all sends to $0$), $f_i mapsto 0$ also (since it's a polynomial involving only $x_1,...,x_k$, and with no constant term).

  As a result, one has the following:
  $ x_(k+1) = sum_(i=1)^n g_i f_i mapsto 0 $
  because each $f_i mapsto 0$. However, this contradicts our assumption that $x_(k+1) mapsto 1$. Hence, our assumption must be false, the ideal $I$ cannot be a finitely generated $R$-module.
  ]

  This shows that $R$ has non-finitely generated ideal, hence $R$ is not Noetherian ring.

  \ 

  \ 

  Now, we claim that $R$ has the set of principal ideals satisfy the ascending chain condition. In particular, we'll show it's a UFD, and show that UFD satisfies ascending chain condition for principal ideals.

  \ 

  #text(weight: "bold")[I. $R$ is a UFD:]

    For each polynomial $f in R$, since it only involves finitely many indeterminate, there exists some suitable large $N in NN$, such that $f$ only involves indeterminates in ${x_1,...,x_N}$. Hence, it's an element of the subring $k[x_1,...,x_N] arrow.hook R$. Since this subring is a UFD (finite indeterminates polynomial ring over a field), it has a unique factorization $f = f_1...f_n$, for each irreducible polynomial $f_i in k[x_1,...,x_N] arrow.hook R$. With each $f_i in R$ remains irreducible (as it's irreducible in any $k[x_1,...,x_m]$ containing it), this shows that $f$ admits a factorization in $R$ (as such equality also holds in $R$).

    Now, to show that the factorization is unique in $R$, suppose $f = f_1...f_n = g_1...g_m$ as the factorization. Choose large enough $M in NN$, such that all polynomials $f,f_1,...,f_n, g_1,...,g_m$ only involves indeterminates ${x_1,...,x_M}$. Then, these elements are in the subring $k[x_1,...,x_M]$, and the equality still holds. However, since each $f_i, g_j$ are irreducible in $R$, they're also irreducible in $k[x_1,...,x_M]$, showing the two factorizations must be equal by the UFD property of $k[x_1,...,x_M]$.

    Hence, $R$ is a UFD.

  \ 

  #text(weight: "bold")[II UFD Satisfies the Principal Ideal A.C.C.:]

  First, given a UFD $A$, let's recall that for any nonzero $a,b in A$ (say with unique factorization $a=a_1^(k_1)...a_n^(k_n)$ and $b=b_1^(l_1)...b_m^(l_m)$, each $a_i, a_j$ and $b_k,b_l$ are distinct irreducibles when $i!=j$, $k!=l$), then $a divides b$ iff each $a_i$ is an associate of some $b_j$, with $k_i <= l_j$ if they're associates. In particular, if $a divides b$ while $b divides.not a$, $a$ is guaranteed to have less irreducible factors (if it has the same irreducible factors with same powers, then $b divides a$, since they're now associates at each irreducible factors; so, either some $b_j$ has no associates with irreducible factors of $a$, or some $k_i<l_j$ if $a_i,b_j$ are associate irreducibles).

  Let $(a_1) subset (a_2) subset ...$ be an ascending chain of principal ideals in $A$. Let $a_1 = r_1^(k_1)...r_n ^(k_n)$ be its unique factorization in $R$. Notice that since $a_1 in (a_2)$ (or $a_2 divides a_1$), then the irreducible factors of $a_2$ must be in $r_1,...,r_n$ (with powers at most $k_i$, if $r_i$ is an irreducible factor of $a_2$). Inductively, if $a_i = r_(j_1)^(k_(j_1,i))...r_(j_m) ^(k_(j_m, i))$ (where each $j_l in {1,...,n}$, and $k_(j_l,i)<= k_(j_l)$, the power of $r_(j_l)$ for $a_1$), then each $a_(i+1)$ must have irreducible factors from $r_(j_1),...,r_(j_m)$, and with degree at most $k_(j_l, i)$ if $r_(j_l)$ is an irreducible factor of $a_(i+1)$.

  As a result, $(a_1) subset (a_2) subset ...$ must stabilize at some point: If it's a strict chain of inclusion, then each $a_(i+1)$ must necessarily have less irreducible factors than $a_i$. But, since the number of irreducible factors is bounded by $a_1$ (which only allows factors of $r_1^(k_1)...r_n^(k_n)$ for each $a_i$), then each inclusion $(a_i) subset (a_(i+1))$ must remove at least one irreducible factor, showing $a_2$ only has at most $k_1+...+k_n-1$ irreducible factors, $a_3$ has at most $k_1+...+k_n-2$ irreducible factors, and inductively any $i in NN$ provides $a_i$ iwth at most $k_1+...+k_n-i$ irreducible factors. Hece, for $i>k_1+...+k_n$, it runs out of irreducible factors, and the chain becomes unit ideal and stabilizes, which contradicts. 

  So, by the unique factorization property, increasing chain of principal ideals must stabilize at some point in UFD.

  \ 

  \ 

  Finally, because $R$ is a UFD, for the set of principal ideals, it satisfies ascending chain condition. However, we've shown that $R$ is not Noetherian, which provides a counterexample to the statement.
]