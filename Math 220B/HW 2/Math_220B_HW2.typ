#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *
#import "@preview/xarrow:0.4.0": *

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
  title: "Math 220B HW 2",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Let $R$ be a semilocal ring and let $M$ and $N$ be two $R$-modules such that $M tensor_R N=0$. Prove or disprove that either $M=0$ or $N=0$.
][
  We'll disprove the statement by providing a counterexample.

  \ 

  Consider th ring $R=ZZ\/6ZZ$, which it is semilocal ring because it only has finitely many maximal ideals (in fact, finitely many ideals since the ring is finite).

  Now, consider the canonical projection $pi_2:ZZ->> ZZ\/2ZZ$ and $pi_3:ZZ->>ZZ\/3ZZ$, notice that since $6ZZ = 2ZZ sect 3ZZ$, one has the ideal $6ZZ subset ker(pi_2) = 2ZZ$ and $6ZZ subset ker(pi_3) = 3ZZ$. Hence, by Generalized First Isomorphism Theorem, with the canonical projection $pi_6:ZZ->> ZZ\/6ZZ$, the above two maps uniquely factor into surjective maps $phi_2:ZZ\/6ZZ->>ZZ\/2ZZ$ and $phi_3:ZZ\/6ZZ->>ZZ\/3ZZ$ as follow:
  #set align(center)
  #diagram($
             ZZ edge("rr",->, script(pi_2)) edge("dr",->>, script(pi_6),#right) && ZZ\/2ZZ & ZZ edge("rr",->, script(pi_3)) edge("dr",->>, script(pi_6),#right) && ZZ\/3ZZ\ 
             & ZZ\/6ZZ edge("ru",->>, script(phi_2), #right) && & ZZ\/6ZZ edge("ru",->>, script(phi_3), #right)
           $)
  #set align(left)
  Hence, $ZZ\/2ZZ, ZZ\/3ZZ$ can be realized as $R$-module, via the map $phi_2$ and $phi_3$ (in particular, one has $phi_2(overline(1)_6)=overline(1)_2$ and $phi_3(overline(1)_6)=overline(1)_3$ as the map, based on the above commutative diagrams).

  \ 

  Now, consider the tensor $ZZ\/2ZZ tensor_R ZZ\/3ZZ$, we claim that it is $0$: Recall that $2,3 in ZZ$ are coprime, with Bezout's Lemma there exists integers $s,t in ZZ$, such that $1=2s+3t$. Then, under the projection map $pi_6:ZZ->>ZZ\/6ZZ$, one knows there exists $overline(s)_6,overline(t)_6 in ZZ\/6ZZ$, such that the following holds:
  $ overline(1)_6 = overline(2)_6 dot overline(s)_6+overline(3)_6 dot overline(t)_6 $
  Then, for any $overline(a)_2 in ZZ\/2ZZ$ and $overline(b)_3 in ZZ\/3ZZ$, one has the following:
  $ overline(a)_2 tensor overline(b)_3 &= overline(1)_6 dot (overline(a)_2 tensor overline(b)_3) = (overline(2)_6 dot overline(s)_6+overline(3)_6 dot overline(t)_6)dot (overline(a)_2 tensor overline(b)_3)\ 
  &= overline(s)_6 dot ((overline(2_6) dot overline(a)_2) tensor overline(b)_3) + overline(t)_6 dot (overline(a)_2 tensor (overline(3)_6 dot overline(b)_3))\ 
  &= overline(s)_6 dot ((overline(0)_2 overline(a)_2) tensor overline(b)_3) + overline(t)_6 dot (overline(a)_2 tensor (overline(0)_3 overline(b)_3))\ 
  &= overline(s)_6 dot (overline(0)_2 tensor overline(b)_3)+overline(t)_6 dot (overline(a)_2 tensor overline(0)_3)\ 
  &= 0  $
  (Note: By definition, one has $overline(2)_6 dot overline(a)_2 := phi_2 (overline(2)_6) overline(a)_2 = overline(0)_2 overline(a)_2 = overline(0)_2$, and same idea for $ZZ\/3ZZ$).

  Hence, this proves that $ZZ\/2ZZ tensor_R ZZ\/3ZZ=0$. Yet, each $ZZ\/2ZZ, ZZ\/3ZZ != 0$ as $R$-module, which is a desired counterexample for the problem. 
]

\ 

= D//2
#problem[
  Let $0-> M' xarrow(u) M xarrow(v) M'' -> 0$ be an exact sequence of $R$-modules. Assume that $M'$ and $M''$ are finitely generated $R$-modules. Prove that $M$ is a finitely generated $R$-modules. Explain if the converse is true.
][
  We'll first prove the given statement, then prove the converse is false in general, by providing a counterexample.

  \ 

  \ 

  #text(weight: "bold")[I. Proof of Statement:]

  Given the given sequence is exact, then it implies $M' xarrow(u) M$ is injective, hence $M' tilde.equiv im(u) subset M$, WLOG we'll denote $im(u)$ as $M'$, and $M' xarrow(u) M$ as an inclusion map, and recognize all elements in $M'$ as in $M$ also.

  Since $M', M''$ are finitely-generated, there exists $x_1,...,x_n in M'$ and $y_1,...,y_m in M''$, such that $M'= sum_(i=1)^n R x_i$ and $M'' = sum_(j=1)^m R y_j$. Then, choose $z_1,...,z_m in M$, such that for each index $j in {1,...,m}$, one has $v(z_j)=y_j$. We claim that the collection ${x_1,...,x_n, z_1,...,z_m}$ generates $M$.

  \ 

  For any $x in M$, since $v(x) in M''$, there exists $b_1,...,b_m in R$, such that the following holds: 
  $ v(x) = sum_(j=1)^m b_j y_j = sum_(j=1)^m b_j v(z_j) = v(sum_(j=1)^m b_j z_j) $
  As a result, one has $v(x-sum_(j=1)^m b_j z_j)=0$, or $x-sum_(j=1)^m b_j z_j in ker(v)$. 

  Now, using exactness of the sequence, one gets $ker(v)=im(u)=M'$, hence there exists $a_1,...,a_n in R$, such that $x-sum_(j=1)^m b_j z_j = sum_(i=1)^n a_i x_i$ by the finitely generated property of $M'$.

  As a result, we have $x = sum_(i=1)^n a_i x_i + sum_(j=1)^m b_j z_j$, hence all element $x in M$ can be expressed with some $R$-linear combination of ${x_1,...,x_n,z_1,...,z_m}$, showing $M$ is finitely generated.

  \ 

  \ 

  #text(weight: "bold")[II. Counterexample of the Converse:]

  Let $k$ be a field, consider the ring $R = k[x_1,x_2,...]$, which $R$ is a polynomial ring over $k$, with (countably) infinite indeterminates. First, let's note that $R$ consists of polynomials that are finite sums of monomials, and each monomial can involve only finite indeterminates.

  \ 

  Consider the ideal $I := (x_1,x_2,...)$ (ideal generated by all indeterminates). Then, $I, R, R\/I$ are all $R$-modules, in particular $R$ is a finitely generated $R$-module (since every $r in R$ can be written as $r dot 1$, so $R$ is generated by $1$ as an $R$-module). Moreover, we naturally have the following exact sequence of $R$-linear maps:
  #set align(center)
  #diagram($
             0 -> I edge("hook->") & R edge(->>) & R\/I -> 0
           $)
  #set align(left)
  And it's simply because the image of the inclusion $I arrow.hook R$ is $I$, and the kernel of projection $R ->> R\/I$ is also $I$.

  \ 

  Now, we have a short exact sequence, such that the middle $R$-module is finitely generated. Yet, we claim that $I$ is not a finitely generated $R$-module:

  Suppose the contrary that $I$ is a finitely generated $R$-module, then there exists $f_1,...,f_n in I$, such that $I=sum_(i=1)^n R f_i=(f_1,...,f_n)$ as ideal. Based on our definition, there are only finitely many indeterminates involved in $f_1,...,f_n$, say $S={x_(i_1),...,x_(i_k)}$ (and say it's ordered such that $i_1<...<i_k$).

  Then, consider the element $x_(i_k+1) in I$: By our assumption, there exists polynomials $g_1,...,g_n in R$, such that $x_(i_k +1) = sum_(i=1)^n g_i f_i$. Which, let $T = {x_(j_1),...,x_(j_l)}$ be the (finite) indeterminates involved in the polynomials $g_1,...,g_n$. Which, if consider the set of indeterminates $S union T union {x_(i_k+1)} = {x_(i_k+1),x_(m_1),...,x_(m_p)}$ after reordering, one can realize the elements $x_(i_k+1),f_1,...,f_n,g_1,...,g_n $ as elements in $ k[x_(i_k+1),x_(m_1),...,x_(m_p)] arrow.hook k[x_1,x_2,...]$, and inside this smaller subring, the equality $x_(i_k+1)=sum_(i=1)^n g_i f_i$ still holds.

  Now, consider the evaluation map $k[x_(i_k+1),x_(m_1),...,x_(m_p)] -> k$, by $x_(i_k+1) mapsto 1$, and all $x_(m_r) mapsto 0$: Since we've chosen $x_(i_k+1)$, such that it's distinct from all $x_(i_j)$ ($1<=j<=k$), then one has $x_(i_j)$ being some of the $x_(m_r)$, hence $x_(i_j) mapsto 0$. Also, notice that since each $f_i in I$, then it has no constant term (since one has $f_i = h_1 x_1+...$ for $h_i in R$, such that finitely many $h_i!=0$; then, all the constant terms in $h_i$ are multiplied with $x_i$, which is no longer with constant term). Hence, with each $x_(i_j) mapsto 0$, $f_i mapsto 0$ also (since it's a polynomial involving only $x_(i_1),...,x_(i_k)$, and with no constant term).

  As a result, one has the following:
  $ x_(i_k+1) = sum_(i=1)^n g_i f_i mapsto 0 $
  because each $f_i mapsto 0$. However, this contradicts our assumption that $x_(i_k+1) mapsto 1$. Hence, our assumption must be false, the ideal $I$ cannot be a finitely generated $R$-module.

  \ 

  Hence, we found an exact sequence of $R$-modules $0->I arrow.hook R ->> R\/I -> 0$, such that the middle is finitely generated $R$-module, while the two sides are not guaranteed to be finitely generated (in particular, the left side is not guaranteed). This proves that the converse is in general false.
]

\ 

= D//3
#problem[
  Let $M$ and $N$ be flat $R$-modules, where $R$ is a commutative ring. Prove or disprove that $M tensor_R N$ is flat $R$-module.
][
  We'll prove that $M tensor_R N$ is also a flat $R$-module.

  \ 

  Since the tensor functor $(\_) tensor_R (M tensor_R N):RMod -> RMod$ is a right exact functor, to show that $M tensor_R N$ is flat (or the above tensor functor is exact), one only needs to prove it preserves injective $R$-linear maps.

  Recall that for any $R$-module $K,L,P$, there is a unique $R$-linear isomorphism $phi_(K L P):(K tensor_R L) tensor_R P arrow.tilde K tensor_R (L tensor_R P)$ that satisfies $phi_(K L P)((k tensor l) tensor p) = k tensor(l tensor p)$ for all $k in K$, $l in L$, and $p in P$.

  \ 

  Now, given an injective $R$-linear map $f:K arrow.hook K'$, since $M$ is flat, then the exactness of the functor $(\_)tensor_R M$ guarantees the map $f tensor id_M:K tensor_R M -> K' tensor_R M$ is injective (which the map is given by $(f tensor id_M) (k tensor m) = f(k) tensor m$ for all $k in K$, $m in M$).

  Similarly, since $N$ is flat, then the exactness of the functor $(\_)tensor_R N$ guarantees the map $(f tensor id_M) tensor id_N: (K tensor_R M) tensor_R N -> (K' tensor_R M) tensor_R N$ is injective (which the map is given by $((f tensor id_M) tensor id_N)((k tensor m)tensor n)=(f(k) tensor m)tensor n$ for all $k in K$, $m in M$, and $n in N$).

  \ 

  Finally, consider the following diagram:
  #set align(center)
  #diagram($
             K tensor_R (M tensor_R N) edge("d","hook->>", script(phi_(K M N)^(-1))) edge(->, script(f tensor id_(M tensor_R N))) & K' tensor_R (M tensor_R N)\ 
             (K tensor_R M) tensor_R N edge("hook->", script((f tensor id_M) tensor id_N), #right) & (K' tensor_R M) tensor_R N edge("u", "hook->>", script(phi_(K' M N)))
           $)
  #set align(left)
  Notice that the diagram commutes, because for each $k in K$, $m in M$, and $n in N$, one has the following:
  $ (f tensor id_(M tensor_R N))(k tensor (m tensor n)) = f(k) tensor (m tensor n) $
  $ &phi_(K' M N) compose ((f tensor id_M) tensor id_N) compose phi^(-1)_(K M N)(k tensor(m tensor n))\ 
  &=phi_(K' M N) compose ((f tensor id_M) tensor id_N)((k tensor m) tensor n)\ 
  &= phi_(K' M N)((f(k) tensor m) tensor n)\ 
  &= f(k) tensor (m tensor n) $
  Then, since $K tensor_R (M tensor_R N)$ is generated by all elements of the form $k tensor (m tensor n)$, then the above two calculation shows that the two maps are the same, hence the diagram commutes.

  As a result, since $phi_(K' M N), (f tensor id_M) tensor id_N,$ and $phi^(-1)_(K M N)$ are all injective, then their composition -- which results in $f tensor id_(M tensor_R N)$ -- is injective. Therefore, the functor $(\_)tensor_R (M tensor_R N)$ preserves injective maps, hence is exact. This shows that $M tensor_R N$ is a flat module.
]

= ND//4
#problem[
  Let $phi:R->S$ be a ring homomorphism and let $M$ be a flat $R$-module. Prove or disprove that $M tensor_R S$ is a flat $S$-module.
][
  We'll prove that given $M$ is a flat $R$-module, then $M tensor_R S$ is a flat $S$-module.

  \ 

  For this, let's prove an exercise in Atiyah Macdonald Chapter 2:
  #exercise("2.15")[
    Let $A,B$ be commutative rings, let $M$ be an $A$-module, $P$ a $B$-module and $N$ an $(A,B)$-bimodule (that is, $N$ is simultaneously an $A$-module and $B$-module and the two structures are compatible in the sens that $a(x b)=(a x)b$ for all $a in A$, $b in B$, $x in N$). 
    
    Then, $M tensor_A N$ is naturally a $B$-module, $N tensor_B P$ an $A$-module, and we have:
    $ (M tensor_A N) tensor_B P tilde.equiv M tensor_A (N tensor_B P) $
  ][
    We'll prove the three claims in sequence:


    #text(weight: "bold")[I. $B$-Module Structure on $M tensor_A N$:]

    For any $b in B$, $m in M$ and $n in N$, detine the action $B times (M tensor_A N)-> M tensor_A N$ as $b dot (m tensor_A n):= m tensor_A (n b)$ on each generator $m tensor_A n$ (where $n b$ is given by the $B$-module structure of $N$), we also define its action on any sum $sum_(i=1)^k m_i tensor_A n_i$ by sum of its action on individual $m_i tensor_A n_i$. As a set map this is well-defined, let's check it does satisfy the $B$-module properties (which suffices to check for the generators of $M tensor_A N$). Given any $b,b' in B$, and any element $m tensor_A n, m' tensor_A n' in M tensor_A N$, we have the following:

    1. $ (b+b') dot (m tensor_A n) &= m tensor_A (n(b+b')) = m tensor_A (n b+n b')\ 
    &= m tensor_A (n b)+m tensor_A (n b')\ 
    &= b dot (m tensor_A n)+b' dot (m tensor_A n) $
    2. $ b dot (m tensor_A n+m' tensor_A n') = b dot (m tensor_A n)+b dot (m' tensor_A n') $
      (Note: This is by our definition, such that the action on the sum, is the sum of each individual generator after the action).

    3. $ (b b') dot (m tensor_A n) &= m tensor_A (n (b b')) = m tensor_A (n (b' b))\ 
    &= m tensor_A ((n b')b) = b dot (m tensor_A (n b'))\ 
    &= b dot (b' dot (m tensor_A n)) $
    4. $ 1_B dot (m tensor_A n) = m tensor_A (n 1_B) = m tensor_A n $
    These are all the requirements for being a $B$-module, hence $M tensor_A N$ has a $B$-module structure (by its action on $N$).

    \ 

    \ 

    #text(weight: "bold")[II. $A$-Module Structure on $N tensor_B P$:]

    Similarly, define $A times (N tensor_B P)-> N tensor_B P$ by $a dot (n tensor_B p):= (a n) tensor_B p$. Based on similar reasonings in #text(weight: "bold")[I], it satisfies all the conditions for $A$-module, hence $N tensor_B P$ now can be realized as $A$-module.

    \ 

    \ 

    #text(weight: "bold")[III. Isomorphism:]

    We aim to show that $(M tensor_A N) tensor_B P$ and $M tensor_A (N tensor_B P)$ are isomorphic as both $A$ and $B$-module. For this, we'll construct a $B$-linear map $(M tensor_A N) tensor_B P -> $
  ]

  Since $S$ is a bimodule (where it's both an $R$-module and $S$-module, while any $r in R$, $s,t in S$ has $(r dot t)s = (phi(r)t) s = phi(r) (t s) = r dot (t s)$, where the dot $dot$ represents the $R$-action on $S$), then one has the following isomorphism, for any $S$-module $P$:
  $ (M tensor_R S) tensor_S P tilde.equiv M tensor_R (S tensor_S P) $
  Then, given any injective $S$-linear map $P arrow.hook P'$ between two $S$-modules, one has the following diagram:
]

= ND//5
#problem[
  Let $phi:R-> S$ be a ring homomorphism such that $M$ is projective as an $R$-module. Prove or disprove that $M tensor_R S$ is projective as $S$-module.
][
  We'll prove that if $M$ is projective as $R$-module, then $M tensor_R S$ is projective as $S$-module.

  \ 

  Since $M$ is projective as an $R$-module, there exists another $R$-module $N$, such that 

  Not sure if this is right, but if $M plus.circle N = R^(plus.circle I)$, then if $R^I tensor_R S tilde.equiv (R tensor_R S)^(plus.circle I) tilde.equiv S^(plus.circle I)$ as $R$-module. Then, the question becomes: are the two structures compatible? Namely the 
]

= ND//6
#problem[
  Let $phi:R -> S$ be a ring homomorphism and let $M$ be an injective $R$-module such that $M tensor_R S != 0$. Prove or disprove that $M tensor_R S$ is injective $S$-module.
][
  
]

= ND//7
#problem[
  Let $phi:R->S$ be a ring homomorphism such that $S$ is flat $R$-algebra. Prove or disprove that $phi$ is injective.
][
  
]

= ND//8
#problem[
  Let $phi:R->S$ be an injective ring homomorphism such that $S$ is a field. Prove or disprove that $S$ is a flat $R$-algebra. 
][
  
]

= ND//9
#problem[
  Let $R$ be a dedekind domain and let $I subset R$ be an ideal. Prove or disprove that $I$ is a flat $R$-module.
][
  
]

= ND//10
#problem[
  Let $R$ be a PID and let $M$ be a finitely generated flat $R$-module. Prove or disprove that $M$ is a free $R$-module.
][
  Q: Over a PID, is there any flat module that's not projective?
]

= ND//11
#problem[
  Let $R$ be a PID and let $M$ be an $R$-module. Prove that $R$ is a submodule of an injective $R$-module.
][
  The injective resolution problem...
]

= ND//12
#problem[
  Let $R$ be a commutative ring and let $m$ be a given maximal ideal of $R$. Suppose $m$ is an $R$-module such that $M_m = 0$. Prove or disprove that $M=0$.
][
  
]

= ND//13
#problem[
  Let $R xarrow(phi)S xarrow(psi)T$ be two ring homomorphisms such that $S$ is $R$-flat and $T$ is $S$-flat. Prove or disprove that $T$ is $R$-flat.
][
  
]

= ND//14
#problem[
  Let $R xarrow(phi)S xarrow(psi)T$ be ring homomorphisms such that $T$ is $R$-flat. Prove or disprove that $phi$ can not be surjective.
][
  
]

= ND//15
#problem[
  Let $R xarrow(phi)S xarrow(psi)T$ be ring homomorphisms such that $T$ is $R$-flat. Prove or disprove that $psi$ can not be surjective.
][
  
]

= ND//16
#problem[
  Let $R xarrow(phi)S$ be ring homomorphism hich is flat. Let $M$ be an $R$-module such that $M tensor_R S$ is torsion-free $S$-module. Is $M$ torsion-free $R$-module?
][
  
]