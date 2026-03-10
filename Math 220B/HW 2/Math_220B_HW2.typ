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

#outline(title: "Questions")

\ 

All content starts on page 2.

#pagebreak()

= D//1
#problem[
  Let $R$ be a semilocal ring and let $M$ and $N$ be two $R$-modules such that $M tensor_R N=0$. Prove or disprove that either $M=0$ or $N=0$.
][
  We'll disprove the statement by providing a counterexample.

  \ 

  Consider the ring $R=ZZ\/6ZZ$, which it is semilocal ring because it only has finitely many maximal ideals (in fact, finitely many ideals since the ring is finite).

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

#pagebreak()

= D//2
#problem[
  Let $0-> M' xarrow(u) M xarrow(v) M'' -> 0$ be an exact sequence of $R$-modules. Assume that $M'$ and $M''$ are finitely generated $R$-modules. Prove that $M$ is a finitely generated $R$-modules. Explain if the converse is true.
][
  We'll first prove the given statement, then prove the converse is false in general, by providing a counterexample.

  \ 

  \ 

  #text(weight: "bold")[I. Proof of Statement:]

  Given the sequence is exact, then it implies $M' xarrow(u) M$ is injective, hence $M' tilde.equiv im(u) subset M$, WLOG we'll denote $im(u)$ as $M'$, and $M' xarrow(u) M$ as an inclusion map, and recognize all elements in $M'$ as in $M$ also.

  Since $M', M''$ are finitely-generated, there exists $x_1,...,x_n in M'$ and $y_1,...,y_m in M''$, such that $M'= sum_(i=1)^n R x_i$ and $M'' = sum_(j=1)^m R y_j$. Then, by the exactness we have $M xarrow(v)M''$ being surjective, hence we can choose $z_1,...,z_m in M$, such that for each index $j in {1,...,m}$, one has $v(z_j)=y_j$. We claim that the collection ${x_1,...,x_n, z_1,...,z_m}$ generates $M$.

  \ 

  For any $x in M$, since $v(x) in M''$, there exists $b_1,...,b_m in R$, such that the following holds: 
  $ v(x) = sum_(j=1)^m b_j y_j = sum_(j=1)^m b_j v(z_j) = v(sum_(j=1)^m b_j z_j) $
  As a result, one has $v(x-sum_(j=1)^m b_j z_j)=0$, or $x-sum_(j=1)^m b_j z_j in ker(v)$. 

  Again, using exactness of the sequence, one gets $ker(v)=im(u)=M'$, hence there exists $a_1,...,a_n in R$, such that $x-sum_(j=1)^m b_j z_j = sum_(i=1)^n a_i x_i$ by the finitely generated property of $M'$.

  So, we have $x = sum_(i=1)^n a_i x_i + sum_(j=1)^m b_j z_j$, hence all element $x in M$ can be expressed as some $R$-linear combination of ${x_1,...,x_n,z_1,...,z_m}$, showing $M$ is finitely generated using these elements.

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

  Then, consider the element $x_(i_k+1) in I$: By our assumption, there exists polynomials $g_1,...,g_n in R$, such that $x_(i_k +1) = sum_(i=1)^n g_i f_i$. Which, let $T = {x_(j_1),...,x_(j_l)}$ be the (finite) indeterminates involved in the polynomials $g_1,...,g_n$. Which, if consider the set of indeterminates $S union T union {x_(i_k+1)} = {x_(i_k+1),x_(m_1),...,x_(m_p)}$ after reordering, one can realize the elements $x_(i_k+1),f_1,...,f_n,g_1,...,g_n $ as elements in the subring $ k[x_(i_k+1),x_(m_1),...,x_(m_p)] arrow.hook k[x_1,x_2,...]$, and inside this smaller subring, the equality $x_(i_k+1)=sum_(i=1)^n g_i f_i$ still holds.

  Now, consider the evaluation map $k[x_(i_k+1),x_(m_1),...,x_(m_p)] -> k$, by $x_(i_k+1) mapsto 1$, and all $x_(m_r) mapsto 0$: Since we've chosen $x_(i_k+1)$, such that it's distinct from all $x_(i_j)$ ($1<=j<=k$), then one has $x_(i_j)$ being some of the $x_(m_r)$, hence $x_(i_j) mapsto 0$. Also, notice that since each $f_i in I$, then it has no constant term (since one has $f_i = h_1 x_1+...$ for $h_i in R$, such that finitely many $h_i!=0$; then, all the constant terms in $h_i$ are multiplied with $x_i$, which is with constant term $0$). Hence, with each $x_(i_j) mapsto 0$, $f_i mapsto 0$ also (since it's a polynomial involving only $x_(i_1),...,x_(i_k)$, and with no constant term).

  As a result, one has the following:
  $ x_(i_k+1) = sum_(i=1)^n g_i f_i mapsto 0 $
  because each $f_i mapsto 0$. However, this contradicts our assumption that $x_(i_k+1) mapsto 1$. Hence, our assumption must be false, the ideal $I$ cannot be a finitely generated $R$-module.

  \ 

  Thus, we found an exact sequence of $R$-modules $0->I arrow.hook R ->> R\/I -> 0$, such that the middle is finitely generated $R$-module, while the two sides are not guaranteed to be finitely generated (in particular, the left side is not finitely generated). This proves that the converse is in general false.
]

#pagebreak()

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

#pagebreak()

= D//4
#problem[
  Let $phi:R->S$ be a ring homomorphism and let $M$ be a flat $R$-module. Prove or disprove that $M tensor_R S$ is a flat $S$-module.
][
  We'll prove that given $M$ is a flat $R$-module, then $M tensor_R S$ is a flat $S$-module.

  \ 

  Since $(M tensor_R S)tensor_S (\_): sans("S-Mod")->sans("S-Mod")$ is right exact, one just needs to prove it preserves injective maps.

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

    As a side note, this in fact makes $M tensor_A N$ an $(A,B)$-bimodule structure, since for any $m tensor_A n in M tensor_A N$, $a in A$, and $b in B$, we have the following:
    $ a dot (b dot (m tensor_A n)) &= a dot (m tensor_A (n b)) = m tensor_A (a(n b))\ 
    &= m tensor_A ((a n)b) = b dot (m tensor_A (a n))\ 
    &= b dot (a dot (m tensor_A n)) $
    Which, the $A$-action and $B$-action commutes, showing the bimodule property.

    \ 

    \ 

    #text(weight: "bold")[II. $A$-Module Structure on $N tensor_B P$:]

    Similarly, define $A times (N tensor_B P)-> N tensor_B P$ by $a dot (n tensor_B p):= (a n) tensor_B p$. Based on similar reasonings in #text(weight: "bold")[I], it satisfies all the conditions for $A$-module, hence $N tensor_B P$ now can be realized as $A$-module.

    Again, similar to the proof in #text(weight: "bold")[I], the computation shows that $N tensor_B P$ is an $(A,B)$-bimodule.

    \ 

    \ 

    #text(weight: "bold")[III. Isomorphism:]

    We aim to show that $(M tensor_A N) tensor_B P$ and $M tensor_A (N tensor_B P)$ are isomorphic as both $A$ and $B$-module. For this, we'll construct a $B$-linear map $(M tensor_A N) tensor_B P -> M tensor_A (N tensor_B P)$, and another $A$-linear map $(M tensor_A N) tensor_B P <- M tensor_A (N tensor_B P)$, and prove that these two maps are isomorphism for abelian groups, while both maps are $A$-linear and $B$-linear, which will complete the isomorphism.

    \ 

    1. #text(weight: "bold")[$B$-linear map:]
    
      First, fix arbitrary $p in P$, and define a map $F_p:M times N-> M tensor_A (N tensor_B P)$ by $(m,n) mapsto m tensor_A (n tensor_B p)$ for all $(m,n) in M times N$. Note that this is $A$-bilinear, since for all $a,a' in A$, $m,m' in M$, and $n,n' in N$, we have the following:
      $ F_p (a m+a' m', n) &= (a m + a' m') tensor_A (n tensor_B p)\ 
      &= a dot (m tensor_A (n tensor_B p))+a' dot (m' tensor_A (n tensor_B p))\ 
      &= a dot F_p (m,n) + a' dot F_p (m,n) $
      $ F_p (m, a n+a' n')&= m tensor_A ((a n+a' n') tensor_B p)\ 
      &= m tensor_A (a dot (n tensor_B p)+ a' dot (n' tensor_B p))\ 
      &= a dot (m tensor_A (n tensor_B p))+a' dot (m tensor_A (n tensor_B p))\ 
      &= a dot F_p (m,n)+a' dot F_p (m,n') $ 
      Hence, this uniquely factors through the tensor product, as $overline(F)_p:M tensor_A N -> M tensor_A (N tensor_B P)$ by $overline(F)_p (m tensor_A n)= m tensor_A (n tensor_B p)$.

      Now, let's define a map $G:(M tensor_A N) times P -> M tensor_A (N tensor_B P)$ as this: 
      $ G(sum_(i=1)^k m_i tensor_A n_i " ", " " p):= overline(F)_p (sum_(i=1)^k m_i tensor_A n_i) $
      We claim that $G$ is $B$-bilinear (which suffices to check each individual tensors). Given any $b,b' in B$, $(m tensor_A n), (m' tensor_A n') in M tensor_A N$, and $p,p' in P$, we have the following:
      $ G(b dot (m tensor_A n)+b' dot (m' tensor_A n'),p)&= G(m tensor_A (n b)+m' tensor_A (n' b'), p) \
      &= overline(F)_p (m tensor_A (n b)+m' tensor_A (n' b'))\ 
      &= m tensor_A ((n b) tensor_B p) + m' tensor_A ((n' b') tensor_B p)\ 
      &= m tensor_A ((n tensor_B p)b) + m' tensor_A ((n' tensor_B p)b')\ 
      &= b dot (m tensor_A (n tensor_B p))+b' dot (m' tensor_A (n' tensor_B p))\ 
      &= b dot overline(F)_p (m tensor_A n)+ b' dot overline(F)_p (m' tensor_A n')\ 
      &= b dot G(m tensor_A n,p)+b' dot G(m' tensor_A n',p) $
      $ G(m tensor_A n, b p+b' p') &= F_(b p+b' p')(m tensor_A n)\ 
      &= m tensor_A (n tensor_B (b p+b' p'))\ 
      &= m tensor_A (b dot (n tensor_B p)+b' dot (n tensor_B p'))\ 
      &= b dot (m tensor_A (n tensor_B p)) + b' dot (m tensor_A (n tensor_B p'))\ 
      &= b dot overline(F)_p (m tensor_A n)+b' dot overline(F)_(p')(m tensor_A n)\
      &= b dot G(m tensor_A n, p)+b' dot G(m tensor_A n, p') $
      Since $G$ is $B$-bilinear, there exists a unique $B$-linear map $overline(G): (M tensor_A N)tensor_B P -> M tensor_A (N tensor_B P)$ by $overline(G)((m tensor_A n) tensor_B p) = m tensor_A (n tensor_B p)$.

      \ 

    2. #text(weight: "bold")[$A$-linear map:]

      Similarly, fix arbitrary $m in M$, and define a map $H_m: N times P -> (M tensor_A N) tensor_B P$ by $(n,p) mapsto (m tensor_A n) tensor_B p$ for all $(n,p) in N times P$. Using the same logic in the previous part, one can prove that $H_m$ is $B$-bilinear, hence inducing a unique $B$-linear map $overline(H)_m:N tensor_B P -> (M tensor_A N) tensor_B P$ by $overline(H)_m (n tensor_B p) = m tensor_A (n tensor_B p)$.

      Then, one defines another map $L:M times (N tensor_B P)-> (M tensor_A N) tensor_B P$ as follow:
      $ L(m, sum_(i=1)^k n_i tensor_B p_i) := overline(H)_m (sum_(i=1)^k n_i tensor_B p_i) $
      Similar to the previous part, we in fact have $L$ being $A$-bilinear after running through the computation. Hence, this induces a unique $A$-linear map $overline(L):M tensor_A (N tensor_B P)-> (M tensor_A N) tensor_B P$ by $overline(L)(m tensor_A (n tensor_B p)) = (m tensor_A n) tensor_B p$.

      \ 

    3. #text(weight: "bold")[Isomorphism:]

      Given the $B$-linear map $overline(G):(M tensor_A N) tensor_B P -> M tensor_A (N tensor_B P)$, and the $A$-linear map $overline(L):M tensor_A (N tensor_B P)-> (M tensor_A N) tensor_B P$, if we first look at the two modules' abelian group structure, one have this for all $m in M, n in N, p in P$:
      $ &overline(L) compose overline(G)((m tensor_A n) tensor_B p) = overline(L)(m tensor_A (n tensor_B p))= (m tensor_A n) tensor_B p\ 
      &overline(G) compose overline(L)(m tensor_A (n tensor_B p)) = overline(G)((m tensor_A n) tensor_B p) = m tensor_A (n tensor_B p) $
      Hence, as homomorphism of abelian grouops, $overline(G), overline(L)$ are mutual inverses (since the compositions act as identity on all the generators of the two spaces, in the right composition order).

      Now, it suffices to check that $overline(G), overline(L)$ are in fact both $A$-linear and $B$-linear. 
      - For $overline(G)$, we've constructed it as a $B$-linear map, so it suffices to prove the $A$-linear structure (in particular, suffices to prove it preserves the $A$-action, since additivity is given by the fact that $overline(G)$ is a homomorphism of abelian group). Given any $a in A$, and $(m tensor_A n) tensor_B p in (M tensor_A N) tensor_B P$, one has the following:
        $ overline(G)(a dot ((m tensor_A n) tensor_B p)) &= overline(G)((a dot (m tensor_A n)) tensor_B p)\ 
      &= overline(G)(((a m) tensor_A n) tensor_B p)\ 
      &= (a m) tensor_A (n tensor_B p)\ 
      &= a dot (m tensor_A (n tensor_B p))\ 
      &= a dot overline(G)((m tensor_A n) tensor_B p) $
        (Note: Here we use the fact that $(M tensor_A N) tensor_B P$ has an $A$-module structure by letting $A$ act on $M tensor_A N$, which is proven in #text(weight: "bold")[I], because $M,N$ can be arbitrary).

        Hence, $overline(G)$ preserves $A$-action, which is $A$-linear.

      \ 

      - Similarly, for $overline(L)$, it's constructed as an $A$-linear map, so it sufices to prove it preserves the $B$-action. Given any $b in B$, and $m tensor_A (n tensor_B p) in M tensor_A (N tensor_B P)$, one has the following:
        $ overline(L)(b dot (m tensor_A (n tensor_B p))) &= overline(L)(m tensor_A (b dot (n tensor_B p)))\ 
        &= overline(L)(m tensor_A (n tensor_B (b p)))\ 
        &= (m tensor_A n) tensor_B (b p)\ 
        &= b dot ((m tensor_A n) tensor_B p)\ 
        &= b dot overline(L)(m tensor_A (n tensor_B p)) $
        (Note: Again, we use the fact that $M tensor_A (N tensor_B P)$ has $B$-module structure by letting $B$ act on $N tensor_B P$, proven in #text(weight: "bold")[II]).

        Hence, $overline(L)$ preserves $B$-action, which is a $B$-linear map.

        \ 

      This realizes $overline(G), overline(L)$ as mutual inverses as both $A$-linear and $B$-linear map, hence proving that $(M tensor_A N) tensor_B P tilde.equiv M tensor_A (N tensor_B P)$, as $(A,B)$-bimodule. In particular, an isomorphism (as both $A$ and $B$-module) between them that's constructed above, has the following form:
      $ &phi_(M N P):(M tensor_A N) tensor_B P arrow.tilde M tensor_A (N tensor_B P)\ 
      &phi_(M N P)((m tensor_A n) tensor_B p) = m tensor_A (n tensor_B p), quad forall m in M, n in N, p in P $
  ]

  \ 

  Since $S$ is an $(R,S)$-bimodule (where it's both an $R$-module and $S$-module, while any $r in R$, $s,t in S$ has $(r dot t)s = (phi(r)t) s = phi(r) (t s) = r dot (t s)$, where the dot $dot$ represents the $R$-action on $S$), then one has the following isomorphism, for any $S$-module $P$:
  $ phi_(M S P):(M tensor_R S) tensor_S P arrow.tilde M tensor_R (S tensor_S P), quad phi_(M S P)((m tensor_R s) tensor_S p) = m tensor_R (s tensor_S p) $
  Now, given any injective $S$-linear map $f:P arrow.hook P'$ between two $S$-modules, one simply has $(id_S)tensor_S f: S tensor_B P arrow.hook S tensor_B P'$ be injective (since tensor an $S$-module over $S$ is isomorphic to the original module). 

  However, $(id_S)tensor_S f$ is also an injective $R$-linear map, since it's additive, and for all $r in R$, $s in S$, and $p in P$, one has the following:
  $ ((id_S)tensor_S f)(r dot (s tensor_B p)) &= ((id_S)tensor_S f)((r dot s) tensor_B p)\ 
  &= (r dot s) tensor_B f(p)\ 
  &= r dot (s tensor_B f(p))\ 
  &= r dot ((id_S) tensor_S f)(s tensor_B p) $
  Hence, with $M$ being a flat $R$-module, the $R$-linear map $id_M tensor_R ((id_S) tensor_S f):M tensor_R (S tensor_S P) arrow.hook M tensor_R (S tensor_S P')$ is also injective. 

  Similar to the previous one, we also have $id_M tensor_R ((id_S) tensor_S f)$ being an injective $S$-linear map, since it's additive, and also for any $m in M$, $s,t in S$, and $p in P$, one has the following:
  $ (id_M tensor_R ((id_S)tensor_S f))(s dot (m tensor_R (t tensor_S p))) &= (id_M tensor_R ((id_S)tensor_S f))(m tensor_R (s dot (t tensor_S p)))\ 
  &= m tensor_R (((id_S)tensor_S f)((s t) tensor_S p))\ 
  &= m tensor_R ((s t) tensor_S f(p))\ 
  &= m tensor_R (s dot (t tensor_S f(p)))\ 
  &= s dot (m tensor_R (t tensor_S f(p)))\ 
  &= s dot [(id_M tensor_R ((id_S)tensor_S f))(m tensor_R (t tensor_S p))] $
  For simplicity, let's define $psi:= id_M tensor_R ((id_S)tensor_S f)$ as the injective $S$-linear map.
  
  Finally, one has the following diagram:
  #set align(center)
  #diagram($
             (M tensor_R S) tensor_S P edge("d","hook->>", phi_(M S P)) edge("rr",->, script((id_(M)tensor_R S) tensor_S f)) && (M tensor_R S) tensor_S P'\ 
             M tensor_R (S tensor_S P) edge("rr","hook->", script(psi),#right) && M tensor_R (S tensor_S P') edge("u", "hook->>", phi_(M S P')^(-1))
           $)
  #set align(left)
  Notice that this big diagram commutes, because for all $m in M$, $s in S$, and $p in P$, one has the following:
  $ ((id_M tensor_R S) tensor_S f)((m tensor_R s)tensor_S p) = (m tensor_R s)tensor_S f(p) $
  $ phi^(-1)_(M S P') compose psi compose phi_(M S P)((m tensor_R s)tensor_S p) &= phi^(-1)_(M S P') compose psi (m tensor_R (s tensor_S p))\ 
  &= phi^(-1)_(M S P')(m tensor_R (s tensor_S f(p)))\ 
  &= (m tensor_R s)tensor_S f(p) $
  This shows that $phi^(-1)_(M S P') compose psi compose phi_(M S P) = (id_M tensor_R S)tensor_S f$ as $S$-linear maps. Hence, with each map on the LRS being injective, the RHS $(id_M tensor_R S)tensor_S f$ is also injective.

  This shows that $(M tensor_R S)tensor_S (\_)$ is an exact functor (as it preserves injectivity), hence $M tensor_R S$ can be realized as a flat $S$-module.
]

#pagebreak()

= D//5
#problem[
  Let $phi:R-> S$ be a ring homomorphism such that $M$ is projective as an $R$-module. Prove or disprove that $M tensor_R S$ is projective as $S$-module.
][
  We'll prove that if $M$ is projective as $R$-module, then $M tensor_R S$ is projective as $S$-module.

  \ 

  Since $M$ is projective as an $R$-module, there exists another $R$-module $N$, such that $M plus.circle N tilde.equiv plus.circle.big_(i in I) R e_i$ a free $R$-module (where each $R e_i tilde.equiv R$ as $R$-module). Then, since tensor product "commutes" with direct sum (up to isomorphism), hence one has the following isomorphism as $R$-modules:
  $ (M tensor_R S) plus.circle (N tensor_R S) &tilde.equiv (M plus.circle N)tensor_R S tilde.equiv (plus.circle.big_(i in I)R e_i)tensor_R S tilde.equiv plus.circle.big_(i in I)(R e_i tensor_R S)  $
  As a remark, all these isomorphism respects the $S$-module structure: Given any family of $R$-modules ${M_i}_(i in Lambda)$, the $R$-linear isomorphism $phi:(plus.circle.big_(i in Lambda)M_i)tensor_R S arrow.tilde plus.circle.big_(i in I)(M_i tensor_R S)$ is given as: 
  $ phi(((m_i)_(i in Lambda)) tensor s) = (m_i tensor s)_(i in Lambda) $
  Which, this map is also $S$-linear, as any $(m_i)_(i in Lambda) in plus.circle.big_(i in Lambda)M_i$, and $s,t in S$, satisfy the following:
  $ phi(s dot ((m_i)_(i in Lambda) tensor t)) &= phi((m_i)_(i in Lambda) tensor (t s)) = (m_i tensor (t s))_(i in Lambda)\ 
  &= (s dot (m_i tensor t))_(i in Lambda) = s dot (m_i tensor t)_(i in Lambda) $
  Hence, $phi$ is also an $S$-linear isomorphism. Apply this logic to the 1st and 3rd isomorphism relation, $(M tensor_R S) plus.circle (N tensor_R S) tilde.equiv plus.circle.big_(i in I)(R e_i tensor_R S)$ as $S$-module.

  \ 

  Now, look at each $R e_i tilde.equiv R$, one has each $R e_i tensor_R S tilde.equiv S$ as $R$-module (and a specific $R$-linear isomorphism is given by $phi:R tensor_R S arrow.tilde S$, $phi(r tensor s) = r dot s = phi(r)s$).

  However, notice that this $phi$ is also an $S$-linear map, because it's additive, and also every $r in R$ and $s,t in S$ satisfy the following:
  $ phi(s dot (r tensor t)) &= phi(r tensor (t s)) = r dot (t s) = phi(r)(t s) = (phi(r)t)s = s dot (r dot t) = s dot phi(r tensor t) $
  (Note: Here the $S$-module structure on $R tensor_R S$ is by letting $S$ act on $S$).

  Hence, it's not only an $R$-linear isomorphism, but in fact an $S$-linear isomorphism. As a consequence, with the $S$-module structure on $R tensor_R S$ being isomorphic to $S$, one has:
  $ (M tensor_R S)plus.circle (N tensor_R S) tilde.equiv plus.circle.big_(i in I)(R e_i tensor_R S) tilde.equiv plus.circle.big_(i in I)S $
  Where the final part is a free $S$-module. This realizes $M tensor_R S$ as a direct summand of a free $S$-module, hence it's projective as $S$-module.
]

#pagebreak()

= D//6
#problem[
  Let $phi:R -> S$ be a ring homomorphism and let $M$ be an injective $R$-module such that $M tensor_R S != 0$. Prove or disprove that $M tensor_R S$ is injective $S$-module.
][
  /*Counterexample: $R=ZZ$, $S=ZZ[x]$, and $M=QQ$ injective $ZZ$-mod. Then, prove that $QQ tensor_ZZ ZZ[x] tilde.equiv QQ[x]$ as $ZZ$-algebra, and hence the $ZZ[x]$-module structure is given by $ZZ[x] arrow.hook QQ[x]$. But, $QQ[x]$ is not injective $ZZ[x]$-module, because it's not divisible.*/
  We'll disprove the statement, by providing a counterexample.

  \ 

  Consider the ring $R=ZZ$, $S=ZZ[x]$, and the ring homomorphism $phi:ZZ arrow.hook ZZ[x]$ as the inclusion. Let $M:= QQ$ be the injective $ZZ$-module (by the divisibility, and the equivalence of divisible and injective modules over $ZZ$, a PID). Here, we claim that $QQ tensor_ZZ ZZ[x]$ is not an injective $ZZ[x]$-module.

  \ 

  Consider the fact that tensor product of two commutative $R$-algebra serves as fibre coproduct in the category of commutative rings, in this category we have the following diagram:
  #set align(center)
  #diagram($
             ZZ edge("d","hook->", script(iota_x))edge("hook->", script(iota_QQ)) & QQ edge("d", "hook->", script(alpha))\ 
             ZZ[x] edge("hook->", script(beta), #right) & QQ tensor_ZZ ZZ[x]
           $)
  #set align(left)
  Where, any $q in QQ$ satisfies $alpha(q) = q tensor 1$, and any integer polynomial $f(x) in ZZ[x]$ satisfies $beta(f(x))= 1 tensor f(x)$.

  Then, consider the ring $QQ[x]$, we claim that as $ZZ$-algebra it's isomorphic to $QQ tensor_ZZ ZZ[x]$: It has two inclusions $iota_1:QQ arrow.hook QQ[x]$, and $iota_2:ZZ[x] arrow.hook QQ[x]$, and both inclusions preserve $ZZ$ element wise (hence $iota_1 compose iota_QQ = iota_2 compose iota_x$). Then, using the universality of fibre coproduct, one realizes a unique $ZZ$-algebra homomorphism $h:QQ tensor_ZZ ZZ[x] -> QQ[x]$, such that the following holds:
  #set align(center)
  #diagram($
             ZZ edge("d","hook->", script(iota_x))edge("hook->", script(iota_QQ)) & QQ edge("ddr", "hook->", script(iota_1), bend: #20deg) edge("d", "hook->", script(alpha))\ 
             ZZ[x] edge("drr", "hook->", script(iota_2), bend: #(-20deg)) edge("hook->", script(beta)) & QQ tensor_ZZ ZZ[x] edge("dr", "..>", script(exists ! h))\ 
             && QQ[x]
           $)
  #set align(left)
  In particular, the description is given by $h(q tensor f(x)) = iota_1 (q) iota_2 (f(x)) = q f(x)$. 
  
  \ 
  
  Now, let's construct an inverse: Define a map $j:QQ[x] - QQ tensor_ZZ ZZ[x]$, such that every monomial $q x^n in QQ[x]$ has $j(q x^n):= q tensor x^n$, and for general polynomials $f(x)=sum_(i=0)^n q_i x^i$, it satisfies $j(f(x)):= sum_(i=0)^n q_i tensor x^i$. To verify this is a well-defined $ZZ$-algebra homomorphism, given any $f(x)=sum_(i=0)^n q_i x^i$ and $g(x) = sum_(j=0)^m p_j x^j$ in $QQ[x]$ (WLOG, say $n>=m$), one has the following:
  $ j(f(x)+g(x)) &= j(sum_(j=0)^m (q_j+p_j)x^j + sum_(i=m+1)^n q_i x^i)\ 
  &= sum_(j=0)^m (q_j+p_j) tensor x^j + sum_(i=m+1)^n q_i tensor x^i\ 
  &= sum_(i=0)^m q_i tensor x^i + sum_(i=m+1)^n q_i tensor x^i + sum_(j=0)^m p_j tensor x^j\ 
  &= sum_(i=0)^n q_i tensor x^i + sum_(j=0)^m p_j tensor x^j\ 
  &= j(f(x))+j(g(x)) $
  This proves the additivity of $j$. Also, we have the following:
  $ j(f(x) g(x)) &= j(sum_(i=0)^n sum_(j=0)^m q_i p_j x^(i+j))\ 
  &= sum_(i=0)^n sum_(j=0)^m (q_i p_j) tensor x^(i+j)\ 
  &= sum_(i=0)^n sum_(j=0)^m (q_i tensor x^i) dot (p_j tensor x^j)\ 
  &= (sum_(i=0)^n q_i tensor x^i)(sum_(j=0)^m p_j tensor x^j)\ 
  &= j(f(x)) dot j(g(x)) $
  This proves $j$ is multiplicative, hence it's a well-defined $ZZ$-algebra homomorphism.

  Now, notice that $h,j$ are mutual inverses of each other: Given any $q tensor x^n in QQ tensor_ZZ ZZ[x]$, and $q x^n in QQ[x]$ (the generators of each algebra), one has the following:
  $ j compose h(q tensor x^n) = j (q x^n) = q tensor x^n, quad h compose j(q x^n) = h(q tensor x^n) = q x^n $
  Since both compositions act as identity on the generators of each algebra, they're mutual inverses. Hence, it proves $QQ tensor_ZZ ZZ[x] tilde.equiv QQ[x]$ as $ZZ$-algebra. Moreover, it's $ZZ[x]$-module structure is given by the inclusion $iota_2: ZZ[x] arrow.hook QQ[x]$.

  \ 

  Finally, realize that $QQ[x]$ is not an injective $ZZ[x]$-module: Given the element $x in ZZ[x]$, the multiplication map $x dot (\_): QQ[x] -> QQ[x]$ has all $f(x) in QQ[x]$
  satisfies $f(x) mapsto x f(x)$. In particular, if $f(x)!=0$, one has $deg(x f(x))>= deg(x)>=1$. Hence, the image of $x dot (\_)$ doesn't contain any nonzero constant polynomial, showing it's not surjective.

  Hence, as a $ZZ[x]$-module, $QQ[x] tilde.equiv QQ tensor_ZZ ZZ[x]$ is not divisible, hence not injective.

  \ 

  With $R=ZZ$, $S=ZZ[x]$ (with module structure induced by inclusion $phi: ZZ arrow.hook ZZ[x]$), and $M=QQ$ an injective $ZZ$-module, we have $M tensor_R S tilde.equiv QQ[x]$ as $R$-algebra. Yet, it is not an injective $S$-module, which provides a counterexample to the statement.
]

#pagebreak()

= D//7
#problem[
  Let $phi:R->S$ be a ring homomorphism such that $S$ is flat $R$-algebra. Prove or disprove that $phi$ is injective.
][
  /*
  We'll disprove it by providing a counterexample.

  \ 

  Consider the ring $R=ZZ\/6ZZ$, recall that it has a projection $phi:R->> ZZ\/3ZZ$ by $phi(overline(1)_6)=overline(1)_3$, this realizes $ZZ\/3ZZ$ as an $R$-algebra, while the map $phi$ is not injective (since $phi(overline(3)_6)=overline(3)_3 = 0$).

  (Basically, the idea is that as $R$-modules, $ZZ\/6ZZ tilde.equiv ZZ\/2ZZ plus.circle ZZ\/3ZZ$ because the section $ZZ\/3ZZ-> ZZ\/6ZZ$ by $overline(1)_3 mapsto overline(2)_6$ splits, as a result $S=ZZ\/3ZZ$ is a projective $R$-mod, hence flat)..
  */
  We'll disprove it by providing a counterexample.

  \ 

  Consider the ring $R=ZZ\/6ZZ$, recall that it has a projection $phi:R->> ZZ\/3ZZ$ by $phi(overline(1)_6)=overline(1)_3$, this realizes $ZZ\/3ZZ$ as an $R$-algebra, while the map $phi$ is not injective (since $phi(overline(3)_6)=overline(3)_3 = 0$).

  Now, consider the ideal $I={overline(0)_6, overline(2)_6, overline(4)_6} subset R$, which it can be obtained using another projection $pi_2:ZZ\/6ZZ ->> ZZ\/2ZZ$ by $pi_2 (overline(n)_6) = overline(n)_2$. Which, $overline(n)_2 = overline(0)_2$ iff $n$ is odd iff $overline(n)_6 in {overline(0)_6, overline(2)_6, overline(4)_6}$, showing $ker(phi)=I$.

  However, this ideal also has a ring structure: It's closed under addition and multiplication by the ideal property, so it suffices to find the multiplicative identity. Consider the following multiplication relation:
  $ overline(0)_6 dot overline(4)_6 = overline(0)_6, quad overline(2)_6 dot overline(4)_6 = overline(8)_6 = overline(2)_6, quad overline(4)_6 dot overline(4)_6 = overline(16)_6 = overline(4)_6 $
  This shows that all $overline(a)_6 in I$ satisfies $overline(a)_6 dot overline(4)_6 = overline(a)_6$, which $overline(4)_6$ is the multiplicative identity of $I$.

  \ 

  Notice that $I$ as a ring with the above structure is isomorphic to $ZZ\/3ZZ$: As an additive abelian group because both $I$ and $ZZ\/3ZZ$ has order 3, they must be isomorphic, and one abelian group isomorphism can be considered as $j:ZZ\/3ZZ arrow.tilde I$, $j(overline(1)_3) = overline(4)_6$ (since both are cyclic with prime order, then any nonzero element is a generator), implying $j(overline(2)_3)=overline(2)_6$.

  Yet, $j$ is also a ring homomorphism, because of the following (for anything multiplied by zero, it's sent to zero by group homomorphism property, so we don't need to check):
  $ j(overline(1)_3 dot overline(2)_3) = j(overline(2)_3) = overline(2)_6 = overline(4)_6 dot overline(2)_6 = j(overline(1)_3) dot j(overline(2)_3) $
  $ j(overline(1)_3 dot overline(1)_3) = j(overline(1)_3) = overline(4)_6 = overline(4)_6 dot overline(4)_6 = j(overline(1)_3) dot j(overline(1)_3) $
  $ j(overline(2)_3 dot overline(2)_3) = j(overline(1)_3) = overline(4)_6 = overline(2)_6 dot overline(2)_6 = j(overline(2)_3) dot j(overline(2)_3) $
  Hence, this realizes $ZZ\/3ZZ tilde.equiv I$ as rings, and even stronger -- as $R$-algebras. This suffices to check the $R$-action on $overline(1)_3$ (as the rest follows directly by adding $overline(1)_3$ to itself):
  $ &j(overline(1)_6 dot overline(1)_3)= j(overline(1)_3)=overline(4)_6 = overline(1)_6 dot overline(4)_6 = overline(1)_6 dot j(overline(1)_3)\
  &j(overline(2)_6 dot overline(1)_3)= j(overline(2)_3)=overline(2)_6 = overline(2)_6 dot overline(4)_6 = overline(2)_6 dot j(overline(1)_3)\
  &j(overline(3)_6 dot overline(1)_3)= j(overline(0)_3)=overline(0)_6 = overline(3)_6 dot overline(4)_6 = overline(3)_6 dot j(overline(1)_3)\
  &j(overline(4)_6 dot overline(1)_3)= j(overline(1)_3)=overline(4)_6 = overline(4)_6 dot overline(4)_6 = overline(4)_6 dot j(overline(1)_3)\
  &j(overline(5)_6 dot overline(1)_3)= j(overline(2)_3)=overline(2)_6 = overline(5)_6 dot overline(4)_6 = overline(1)_6 dot j(overline(1)_3) $
  This proves the $R$-linearity of $j$, hence $j:ZZ\/3ZZ arrow.tilde I$ is in fact an $R$-linear isomorphism.

  \ 

  As a result, this is actually a section of the map $phi:R ->> ZZ\/3ZZ$ when viewed as an $R$-linear map:
  $ phi compose j(overline(1)_3) = phi(overline(4)_6) = overline(1)_3 $
  And, with $overline(1)_3$ being a generator of $ZZ\/3ZZ$ additive wise, this proves that $phi compose j = id_(ZZ\/3ZZ)$. Hence, the $R$-linear map $phi:R->>ZZ\/3ZZ$ splits, showing that $ZZ\/3ZZ$ is a direct summand of $R$ (which is a free $R$-module).
  
  This proves that $ZZ\/3ZZ$ is a projective $R$-module, which in particular is flat. However, as a flat $R$-algebra, the map $phi:R ->> ZZ\/3ZZ$ is not injective, which provides a counterexample to our statement.
]

#pagebreak()

= D//8
#problem[
  Let $phi:R->S$ be an injective ring homomorphism such that $S$ is a field. Prove or disprove that $S$ is a flat $R$-algebra. 
][
  /*Notice that $R$ is a subring of a field, hence an integral domain. Given $K$ as fraction field of $R$, one realizes $S$ as a field extension of $K$, hence $S tilde.equiv plus.circle.big_(i in I)K$ as $K$-vector space. Notice that they're also isomorphic as $R$-modules (simply because a $K$-linear map is also an $R$-linear map, by restricting the scalars). So, it suffices to argue that $K$ is flat or not (since direct sum commutes with tensor).

  \ 

  $K$ is injective: Consider any inclusion of ideals $I arrow.hook R$, w claim that $I tensor_R K -> R tensor_R K tilde.equiv K$ is injective:
  - First, its image are characterized by finite sum of $a_i dot p_i/q_i$, where $a_i in I$ and $p_i/q_i in K$ (or, $p_i,q_i in R$). As a result, one has $a_i dot p_i/q_i in I K$ (the finite sum of products of elements in $I$ and elements in $K$).

  - Now, notice that we have an inverse: Every element in $I K$ can be written as $a_i / q_i$ where $a_i in I$ and $q_i in R$, hence define the inverse by $a_i/q_i mapsto a_i tensor 1/q_i$. This is well-defined as multiplying by $r in R$ has: $r a_i/q_i mapsto a_i tensor r/q_i = r (a_i tensor 1/q_i)$. On the other hand, it can be checked that this is a mutual inverse.
  So, $I arrow.hook R$ has $I tensor_R K arrow.hook R tensor_R K$, showing $K$ is flat.

  If $R$ is a field then we're done (everything is flat).

  If $R$ is not a field, how to characterize flatness? We know $K$ definitely can't be free, and there are cases where it's not projective (EX: $QQ$ over $ZZ_((p))$ covered in class). */
  We'll prove that $S$ is a flat $R$-algebra.

  \ 

  First, since $phi:R arrow.hook S$ is injective, we can identify $R$ as a subring of $S$, and $phi$ as a simple inclusion. As a side note, $R$ is an integral domain.

  Now, consider any inclusion of nonzero ideal $iota: I arrow.hook R$, and consider its map after tensoring with $S$ over $R$, say $iota tensor id_S:I tensor_R S -> R tensor_R S$. The goal is to proof this map is injective (in fact, we'll prove that it's an isomorphism): Consider the isomorphism as $R$-modules $R tensor_R S arrow.tilde S$ by $r tensor s mapsto r$. Then, $iota tensor id_S$ can also be identified as follow:
  $ iota tensor id_S:I tensor_R S -> S, quad (iota tensor id_S)(a tensor s) = a s $
  Which, fix a nonzero $a in I$, define the map $g: S -> I tensor_R S$ by $g(s) := a tensor s/a$. Notice that this is well-defined, as for any nonzero $a,b in I$ and any $s in S$, one has the following:
  $ a tensor s/a = a tensor (b s)/(b a) = (a b) tensor s/(b a) = b tensor (a s)/(b a) = b tensor s/b $
  Hence, the image is in fact independent of the choice in $I$. Now, notice that $g$ is also an $R$-linear map. For all $r in R$ and $s,t in S$, one has the following:
  $ g(s+t) = a tensor (s+t)/a=a tensor (s/a+t/a) = a tensor s/a+a tensor t/a = g(s)+g(t) $
  $ g(r dot s) = a tensor (r s)/a = r dot (a tensor s/a) = r dot g(s) $
  Finally, recognize that $g$ is a mutual inverse of $iota tensor id_S$, as for all $s in S$ and $b in I$, one has the following;
  $ g compose (iota tensor id_S)(b tensor s) = g(b s) = a tensor (b s)/a = (a b) tensor s/a = b tensor (a s)/a = b tensor s $
  (Note: since $b in I$, then with $a b$ on the left one can factor out $a$, and still have $b tensor (a s)/a in I tensor_R S$).
  $ (iota tensor id_S) compose g(s) = (iota tensor id_S)(a tensor s/a) = a dot s/a =s $
  This shows that $iota tensor id_S$, $g$ are mutual inverses on the generators of $I tensor_R S$ and $S$, hence are mutual inverses on the two $R$-modules. 

  This proves injectivity of $iota tensor id_S$. And, since $I arrow.hook R$ is arbitrary inclusion of nonzero ideals (while the zero ideal case is trivial), this implies $S$ is a flat $R$-algebra.
]

#pagebreak()

= D//9
#problem[
  Let $R$ be a dedekind domain and let $I subset R$ be an ideal. Prove or disprove that $I$ is a flat $R$-module.
][
  /*Over a Dedekind Domain, a module is torsion free $<==>$ it's flat (look up how localization makes this work, it's in 3/5's notes).
  Hence, any $I subset R$ ideal is torsion free, hence flat.

  \ 

  First, prove that under localization of a dedekind domain, every ideal must be some product of prime ideals (by pulling it back to the dedekind domain itself, and use the unique factorization property). Then, use the fact that in a dedekind domain, all nonzero prime ideal is actually maximal, hence this reduces the ideal to a power of the maximal ideal (in the localization).

  Now, if $m^2=m$ ($m$ the maximal ideal), bc it's actually an $R$-module (with $m$ being the maximal ideal), then Nakayama's Lemma states that $m^2=m$ implies $m=0$, or $R$ is a field (i.e. localize at $0$).

  Else if $m^2 subset.neq m$, find $r in m\\m^2$, we claim that $(r)=m$: It's clear $(r) subset.eq m$ by definition; for the reverse, */
  We'll prove that $I$ is a flat $R$-module.

  \ 

  Recall that flatness is a local property, given any $R$-module $M$, one has $M$ being $R$-flat $<==>$ $M_P$ is $R_P$-flat for all prime ideal $P subset.eq R$. 
  
  For this, let's recall some important properties for dedekind domain, that its Noetherian, all proper ideal factors into primes, and every prime ideal is maximal. Using these two properties, one has the following:
  #lemma[
    Given $R$ a dedekind domain, any prime ideal $P subset.eq R$ has the localization $R_P$ being a PID.
  ][
    Let's fix a prime ideal $P subset.eq R$, take any ideal $J subset.eq R_P$. Recall that $J^(c e) = J$ (the property of localization in general).

    Look at the ideal $J^c subset.eq R$, by the ideal factorization property of dedekind domain, one has $J^c = Q_1...Q_n$, where each $Q_i subset.eq R$ is a prime (hence maximal) ideal. Then, since extension of ideals under localization preserves products of ideals, one has the following:
    $ J = J^(c e) = (Q_1...Q_n)^e = Q_1^e ... Q_n^e $
    Now, notice that for any ideal $I subset.eq R$, one has $I^e != R_P$ iff $I sect R\\P=emptyset$, or $I^e$ is not unit ideal iff $I subset.eq P$. Hence, for any prime ideal $Q_i$ mentioned above, one has $Q_i^e != R_P$ iff it's a prime ideal contained in $P$; yet, since all prime ideals in $R$ is maximal, $Q_i^e != R_P$ iff $Q_i subset.eq P$ iff $Q_i=P$. So, one has $J = (P^e)^k$ for some $k in NN$ (where $k$ indicates the number of prime ideals $Q_i = P$).

    \ 

    Then, since $P^e subset.eq R_P$ is the maximal ideal, the above shows all ideals of $R_P$ is a power of its maximal ideal. Hence, it suffices to prove the maximal ideal $P^e$ is principal (as $P^e = (a)$ implies $(P^e)^l = (a^l)$ for any $l in NN$). There are two cases to consider:
    - If $(P^e)^2 = P^e$, then when realizing $P^e$ as an $R_P$-module (which is finitely generated, since $P subset.eq R$ is finitely generated). Apply Nakayama's Lemma, because $R_P$ is a local ring with maximal ideal $P^e$, $(P^e)^2 = P^e$ forces $P^e=0$. Hence, $R_P$ is a field, which is trivially a PID.

    \  

    - Else if $(P^e)^2 subset.neq P^e$, take any $r in P^e\\(P^e)^2$, we claim that $(r)=P^e$: By the factorization above, $(r)=(P^e)^n$ for some $n in NN$, however if $n>=2$ one has $(r)=(P^e)^n subset.eq (P^e)^2$, contradicting the assumption $r in.not (P^e)^2$. Also, $n!=0$ as $(r)=(P^e)^0 = R$ is another contradiction to $(r) subset.eq P^e$ (since $P^e$ is not unit ideal). So, $n=1$, and $(r)=P^e$. This shows that $P^e$ is a principal ideal, implying $R_P$ is a PID.
  ]

  Now, notice that for any ideal $I subset.eq R$, one has the localization $I_P$ being  the extension $I^e$ under the map $phi:R -> R_P$, which $I^e = (a/s)$ for some $a/s in R_P$ by the previous lemma. Hence, as $R$-module $I^e = (a/s) tilde.equiv R_P$ via the map $I^e -> R_P$ by $a/s mapsto 1$, showing $I^e$ is a free $R_P$-module, hence flat $R_P$-module.

  This shows the localization $I_P$ around any prime ideal is flat $R_P$-module, hence $I$ itself must be flat $R$-module.
]

#pagebreak()

= D//10
#problem[
  Let $R$ be a PID and let $M$ be a finitely generated flat $R$-module. Prove or disprove that $M$ is a free $R$-module.
][
  /*Known information: All submodules of a finitely generated free module over $R$ (a PID) is finitely generated and free. 

  Which, the quotient is of the form $R^n plus.circle R/I_1 plus.circle...plus.circle R/I_l$. So, it suffices to prove that if $M$ is of such form, it must be free (or prove that some $R\/I$ over a PID can be flat).

  However, $R\/I$ is not flat (since it's torsion), which implies it can't be in the direct summand, which must be just $R^n$, which is free.*/
  We'll prove that $M$ is a free $R$-module.

  \ 

  Given that $M$ is a finitely generated flat $R$-module, define $n:=$ minimum number of generators needed for $M$, and use $x_1,...,x_n in M$ to denote a set of generators of $M$ with minimum length. We'll do induction on the number $n$.

  \ 

  \

  For the base case $n=1$, if $M = R x_1$, then there exists a surjective $R$-linear map $phi: R->> M$, given by $phi(r) := r x_1$. Then, as $R$-module, one has $R\/ ker(phi) tilde.equiv M = R x_1$, given by $overline(r) mapsto r x_1$. However, based on the flatness of $M$, this enforces $ker(phi)=0$: Suppose the contrary $ker(phi)!=0$, there exists nonzero element $a in ker(phi)$, as a consequence $a x_1 = 0$ (since under the map $R\/ker(phi)-> M$, one has $overline(0)=overline(a) mapsto a x_1$). Then, the multiplication map $a dot (\_): M -> M$ is not injective, showing $M$ is torsion. Yet, this contradicts the flatness condition of $M$, hence one must have $ker(phi)=0$, further implying $M tilde.equiv R\/ker(phi) tilde.equiv R$. So, $M$ is a free $R$-module with rank $1$.

  \ 

  \

  Now, suppose for all case $k<n$, $M$ having minimum number of $k$ generators implies $M$ is a free $R$-module, then consider the case for $n$, one has $M = sum_(i=1)^n R x_i$. Define $N:= sum_(i=1)^(n-1)R x_i$, by the minimality of number of generators, one must have $x_n in.not N$ (or else $M = N$ and hence only needs $(n-1)$ number of generators, contradicting the minimality of $n$). 

  \

  Here, we claim that $R x_n sect N = 0$, and hence $M tilde.equiv N plus.circle R x_n$: 

  \
  
  Suppose the contrary that the intersection is nonzero, there exists some $a in R$, such that $a x_n in N$ (and with $x_n in.not N$, $a$ is non-unit). Define the ideal $I := {a in R | a x_n in N}$, then by the PID property, one has $I = (b)$ for some nonzero $b in R$. On the other hand, $I$ is not the unit ideal.

  Then, define the multiplication map $f = b dot (\_):M -> M$. Since any $m in M$ has $f(m) = b m in I M$, $f(M) subset.eq I M$, with the assumption $M$ is finitely generated, one can apply "Cayley-Hamilton Theorem" covered in class, there exists some $k in NN$, and some $c_1,...,c_k in R$ (or $c_1 b,...,c_k b in I=(b)$), such that the endomorphism $f^k + c_1 b f^(k-1)+...c_(k-1)b f+c_k b=0$ on $M$. In particular, one can choose $k$ to be the minimum natural number with such property. 
  
  Here, recognize the endomorphism $0=f^k + c_1 b f^(k-1)+...+c_(k-1)b f+c_k b$ is given by a multiplication map:
  $ forall m in M, quad (f^k + c_1 b f^(k-1)+... c_(k-1) b f+c_k b)(m) &= (b^k + c_1 b^(k)+...+c_(k-1)b^2+c_k b)m\  
  &= 0 $
  Since $M$ is flat (in particular, torsion-free), then all nonzero element $r in R$ must have the multiplication map be injective (since $R$ is an integral domain). Hence, the above multiplication map is $0$ implies $b^k + c_1 b^k + ... c_(k-1)b^2 + c_k b = b(b^(k-1) + c_1 b^(k-1)+...+c_(k-1)b+c_k)=0$. With the assumption $b!=0$, one has $b^(k-1) + c_1 b^(k-1)+...+c_(k-1)b+c_k=0$.
  In particular, this implies the following:
  $ b^(k-1)+c_1 b^(k-1)+...+c_(k-1)b = -c_k $
  Which implies that $c_k in (b) = I$.

  Now, let's consider the endomorphism $f^(k-1)+c_1 b f^(k-2)+...+c_(k-1)b + c_k$: Notice that it's monic (as polynomial of $f$), together with all non-leading coefficients $c_1 b,..., c_(k-1)b+c_k in I$. Also, any $m in M$ satisfies the following:
  $ (f^(k-1)+c_1 b f^(k-1)+...+c_(k-1)b+c_k)m &= (b^(k-1)+c_1 b^(k-1)+...+c_(k-1)b+c_k)m \
  &= 0 dot m=0 $
  Which, $f^(k-1)+c_1 b f^(k-1)+...+c_(k-1)b+c_k$ is a monic polynomial with coefficients in $I$, such that it evaluates to be $0$ on $M$. This contradicts the assumption that $k$ is the smallest natural number with such polynomial exists; as a result, one must have $N sect R x_n = 0$, showing $M = N plus.circle R x_n$.

  \ 

  Finally, since $M$ is flat, then all of its direct summand must be flat. Hence, $R x_n$ is flat (implying $R x_n tilde.equiv R$ with our base case), and $N = sum_(i=1)^(n-1)R x_i$ is flat. Which, since $N$ only requires $<= n-1$ generators, our induction hypothesis guarantees $N$ to be free, or $N tilde.equiv plus.circle.big_(i=1)^l R$ for some $l in NN$.

  This proves that $M tilde.equiv plus.circle.big_(i=1)^(l+1)R$, which is a free $R$-module, and finishes our induction.
  
  \

  \

  Hence, over $R$ a PID, any finitely generated flat $R$-module $M$ must be a free $R$-module.
]

#pagebreak()

= D//11
#problem[
  Let $R$ be a PID and let $M$ be an $R$-module. Prove that $M$ is a submodule of an injective $R$-module.
][
  /*Consider $K$ as the fraction field of $R$, then any $plus.circle.big_(i in I)K$ is injective (because it's divisible coordinate wise!)

  For any $M$ an $R$-module, there exists free $R$-module $plus.circle.big_(i in J)R$ that surjects onto $M$, hence $M tilde.equiv (plus.circle.big_(i in J)R)\/L$ for some submodule $L$ of the free module.

  Now, consider the inclusion of $R$-modules $L arrow.hook plus.circle.big_(i in J)R arrow.hook plus.circle.big_(i in J)K$, and the quotient $plus.circle.big_(i in J)K ->> (plus.circle.big_(i in J)K)\/L$. Then, then map $plus.circle.big_(i in J)R -> (plus.circle.big_(i in J)K)\/L$ has kernel precisely $L$, showing $(plus.circle.big_(i in J)R)\/L arrow.hook (plus.circle.big_(i in J)K)\/L$ by its natural identification.

  So, $M$ injects into $(plus.circle.big_(i in J)K)\/L$, which is divisible (since it's a module theoretic quotient of $plus.circle.big_(i in J)K$ which is divisible).*/
  Recall that over $R$ a PID, injective and divisible modules are equivalent. In particular, let $K$ be the fraction field of $R$, then since $K$ is divisible as $R$-module, hence it's injective.

  \ 

  Given the inclusion $R arrow.hook K$, any index set $I$ generates an inclusion $plus.circle.big_(i in I)R arrow.hook plus.circle.big_(i in I)K$ by coordinate wise inclusion. In particular, notice that $plus.circle.big_(i in I)K$ is also divisible (since for any nonzero $r in R$, any $(x_i)_(i in I) in plus.circle.big_(i in I)K$ has $r dot (x_i/r)_(i in I)= (r dot x_i/r)_(i in I)= (x_i)_(i in I)$). So, any quotient of $plus.circle.big_(i in I)K$ (as $R$-module) is also divisible, which is injective.

  \ 

  Now, for any $R$-module $M$, we know there exists some index set $I$, such that the free $R$-module $plus.circle.big_(i in I)R$ has a surjection onto $M$ (for the most extreme case, choose $I:= M$, and associate each element of $M$ with a copy of $R$). Hence, one has $M tilde.equiv (plus.circle.big_(i in I)R) \/ L$ for some submodule $L arrow.hook plus.circle.big_(i in I)R$.

  Then, consider the composition of inclusions $L arrow.hook plus.circle.big_(i in I)R  arrow.hook plus.circle.big_(i in I)K$, this realizes $L$ as a submodule of $plus.circle.big_(i in I)K$. Hence, one can consider the module theoretic quotient $(plus.circle.big_(i in I)K)\/L$. Which, this generates an $R$-linear map $phi: plus.circle.big_(i in I)R arrow.hook plus.circle.big_(i in I)K ->> (plus.circle.big_(i in I)K)\/L$. Notice that one has an element $(a_i)_(i in I) in ker(phi)$ iff $(a_i)_(i in I)in L$ (since when including into $plus.circle.big_(i in I)K$, it must lie in $L$), showing that $ker(phi) = L$. As a result, it factors uniquely to an injective $R$-linaer map $overline(phi):(plus.circle.big_(i in I)R)\/L arrow.hook (plus.circle.big_(i in I)K)\/L$:
  #set align(center)
  #diagram($
             plus.circle.big_(i in I)R edge("dr",->>, script(pi), #right) edge("rr",->, script(phi)) && (plus.circle.big_(i in I)K)\/L\
             & (plus.circle.big_(i in I)R)\/L edge("ur", "hook->", script(overline(phi)), #right)
           $)
  #set align(left)
  And, with $M tilde.equiv (plus.circle.big_(i in I)R)\/L$, we have an inclusion of $M$ into the injective $R$-module $(plus.circle.big_(i in I)K)\/L$, finishing the desired claim.
]

#pagebreak()

= D//12
#problem[
  Let $R$ be a commutative ring and let $m$ be a given maximal ideal of $R$. Suppose $M$ is an $R$-module such that $M_m = 0$. Prove or disprove that $M=0$.
][
  /*I guess we can take $R=ZZ$, $m = 2ZZ$, and $M = ZZ\/3ZZ$. Then, $M_m$ denotes all the elements of the form $overline(a)_3/d$, where $d in.not 2ZZ$ (i.e. we can divide by 3!) So in particular, one has the following:
  $ 3 dot (1 dot overline(a)_3-1 dot overline(0)_3) = 3 dot overline(a)_3 = overline(0)_3 in M $
  This shows that $overline(a)_3/1 = 0/1$ in $M_m$, showing $M_m=0$, while $M!=0$.

  (But if swapping to all maximal ideal $m$ I think it's true).*/
  We'll disprove the statement by providing a counterexample.

  \ 

  Consider the ring $R=ZZ$, its maximal ideal $m= 2ZZ$, and consider the $ZZ$-module $M=ZZ\/3ZZ$. It's clear that $M!=0$. However, $M_m = 0$, since one of the descripction of $M_m$ is all element $m/s$, where $m in M$ and $s in ZZ\\2ZZ$ (or, $s$ is an odd number). Hence, recall that $3 dot m=0$ for all $m in M=ZZ\/3ZZ$, then one has the following:
  $ forall m in M," " s in ZZ\\2ZZ, quad m/s = (3 dot m)/(3 s) = 0/(3 s)=0 $
  The reason is because $3 in ZZ\\2ZZ$, so the multiplication $3 s in ZZ\\2ZZ$ makes sense. As a result, $M_m = 0$.

  \ 

  Hence, we have $m subset.eq R$ is a maximal ideal, $M!=0$, but $M_m = 0$, which is a desired counterexample to the statement.
]

#pagebreak()

= D (Referred to Problem 2)//13
#problem[
  Let $R xarrow(phi)S xarrow(psi)T$ be two ring homomorphisms such that $S$ is $R$-flat and $T$ is $S$-flat. Prove or disprove that $T$ is $R$-flat.
][
  /*Consider the following isomorphism as $(R,S)$-bimodules:
  $ (R tensor_R S) tensor_S T tilde.equiv R tensor_R (S tensor_S T) tilde.equiv R tensor_R T tilde.equiv T $
  As a result, if $I arrow.hook R$ is inclusion of ideal, one has the injection $I tensor_R S arrow.hook R tensor_R S tilde.equiv S$ as $R$-module (which is also an injective $S$-linear map, bc $S$ is an $(R,S)$-bimodule). This is by $R$-flatness of $S$.

  As a result, one has the following injection:
  $ (I tensor_R S)tensor_S T arrow.hook (R tensor_R S)tensor_S T tilde.equiv S tensor_S T tilde.equiv T $
  Which, using the bimodule isomorphism proven in problem 2, we have:
  $ I tensor_R T tilde.equiv I tensor_R (S tensor_S T) arrow.hook R tensor_R (S tensor_S T) tilde.equiv R tensor_R T $
  Hence, $T$ is also $R$-flat.*/
  We'll prove that $T$ is also $R$-flat, via the isomorphism proved in #text(weight: "bold")[Problem 2], i.e. the isomorphism $(M tensor_R N) tensor_S P tilde.equiv M tensor_R (N tensor_S P)$, where $M in RMod$, $P in sans("S-Mod")$, and $N$ an $(R,S)$-bimodule.

  \ 

  Let's first verify the $(R,S)$-bimodule structure on both $S,T$.

  Given any $r in R$, $s,s' in S$ and $t in T$, one has the following:
  $ r dot (s dot s') = phi(r)(s s') = (phi(r)s)s' = (s phi(r))s' = s dot (phi(r) s') = s dot (r dot s') $
  $ r dot (s dot t) = psi(phi(r))(psi(s)t) = psi(phi(r)s)t = psi(s phi(r))t = psi(s)(psi(phi(r))t) = s dot (r dot t) $
  Since the actions of $R,S$ commutes (if assuming they're commutative, under most cases we work with), these realize $S,T$ as $(R,S)$-bimodules, hence the isomorphism can be used.

  \ 

  Now, we have the following isomorphism as both $R$ and $S$-module:
  $ T arrow.tilde S tensor_S T, quad t mapsto 1_S tensor_S t $
  Also, for any inclusion of ideals $iota: I arrow.hook R$, based on the $R$-flatness of $S$, we have $I tensor_R S arrow.hook R tensor_R S$ being injective. Then, when viewed this as an $S$-linear map, the $S$-flatness of $T$ guarantees the map $(I tensor_R S) tensor_S T arrow.hook (R tensor_R S) tensor_S T$ being injective.

  \ 

  Finally, when consider the inclusion of ideals $iota: I arrow.hook R$, it's tensor with $T$ generates the following commutative diagram (based on all isomorphisms mentioned above):
  #set align(center)
  #diagram($
            I tensor_R T edge("d","hook->>") edge(->, script(iota tensor id_T)) & R tensor_R T \ 
            I tensor_R (S tensor_S T) edge("d","hook->>") edge(->, script(iota tensor id_(S tensor_S T))) & R tensor_R (S tensor_S T) edge("u", "hook->>")\ 
            (I tensor_R S) tensor_S T edge("hook->", script((iota tensor_R id_S) tensor_S id_T)) & (R tensor_S S) tensor_S T edge("u", "hook->>")
           $)
  #set align(left)

  \ 

  As a result, since $I tensor_R T tilde.equiv(I tensor_R S)tensor_S T$, $(R tensor_S S) tensor_S T tilde.equiv R tensor_R T$, and the flatness conditions on $S,T$ provides the injection $(I tensor_R S)tensor_S T arrow.hook (R tensor_R S)tensor_S T$, one has the map $iota tensor_R id_T: I tensor_R T -> R tensor_R T$ also be injective.

  With the inclusion $iota:I arrow.hook R$ be arbitrary ideal of $R$, this shows that $T$ is $R$-flat, proving the statement.
]

#pagebreak()

= D//14
#problem[
  Let $R xarrow(phi)S xarrow(psi)T$ be ring homomorphisms such that $T$ is $R$-flat. Prove or disprove that $phi$ can not be surjective.
][
  /*Consider the isomorphism $ZZ\/30ZZ tilde.equiv ZZ\/2ZZ plus.circle ZZ\/3ZZ tilde.equiv ZZ\/5ZZ$, I think this is also a $ZZ\/30ZZ$-mod. Then, take successive quotient we're good.*/
  We'll disprove it by providing a counterexample.

  \

  Consider the rings $R=ZZ\/2ZZ plus.circle ZZ\/3ZZ plus.circle ZZ\/5ZZ$, $S=ZZ\/2ZZ plus.circle ZZ\/3ZZ$, and $T=ZZ\/2ZZ$ (each with coordinate-wise addition and multiplication). For the homomorphisms, consider $phi:R->>S$ as the projection onto the first two coordinates $phi(overline(a)_2,overline(b)_3,overline(c)_5) = (overline(a)_2,overline(b)_3)$, and $psi:S->> T$ as the projection onto the first coordinate $psi(overline(a)_2,overline(b)_3) = overline(a)_2$.

  Notice the composition $psi compose phi:R ->> T$ is the projection onto the first factor $psi compose phi(overline(a)_2,overline(b)_3, overline(c)_5)=psi(overline(a)_2,overline(b)_3)=overline(a)_2$. Meanwhile, if viewing $T$ as an $R$-module, notice $psi compose phi$ as $R$-linear map has a section: Define $j:T -> R$ by $j(overline(a)_2)=(overline(a)_2,overline(0)_3,overline(0)_5)$. Let's verify it's $R$-linear:
  $ &forall overline(a)_2,overline(b)_2 in T, quad j(overline(a)_2+overline(b)_2)=(overline(a_2)+overline(b)_2,0,0)=(overline(a)_2,0,0)+(overline(b)_2,0,0)=j(overline(a)_2)+j(overline(b)_2) $
  $ forall (overline(a)_2,overline(b)_3,overline(c)_5) in R," " overline(d)_2 in T, quad &j((overline(a)_2,overline(b)_3,overline(c)_5) dot overline(d)_2) = j(psi compose phi(overline(a)_2,overline(b)_3,overline(c)_5) overline(d)_2)\ 
  &= j(overline(a)_2 overline(d)_2) = (overline(a)_2 overline(d)_2,0,0) = (overline(a)_2,overline(b)_3,overline(c)_5) (overline(d)_2,0,0)\ 
  &= (overline(a)_2,overline(b)_3,overline(c)_5) j(overline(d)_2) $
  These verified $j$ is $R$-linear. And, consider the composition $(psi compose phi) compose j:T-> T$, we get:
  $ forall overline(a)_2 in T, quad (psi compose phi) compose j(overline(a)_2) = (psi compose phi)(overline(a)_2,0,0)=overline(a)_2 $
  Hence, $j$ is indeed a section of $psi compose phi:R->>T$, showing this surjection splits. As a consequence, it realizes $T$ as a direct summand of $R$, hence $T$ is projective as $R$-module, which is flat.

  \ 

  This is a counterexample to the statement, as $T$ is $R$-flat under $psi compose phi: R->>T$, while $phi:R->>S$ is a projection, which is surjective.
]

= D//15
#problem[
  Let $R xarrow(phi)S xarrow(psi)T$ be ring homomorphisms such that $T$ is $R$-flat. Prove or disprove that $psi$ can not be surjective.
][
  We'll disprove the statement by using the same counterexample in #text(weight: "bold")[Problem 14].

  \ 

  In the previous problem we constructed $R=ZZ\/2ZZ plus.circle ZZ\/3ZZ plus.circle ZZ\/5ZZ$, $S=ZZ\/2ZZ plus.circle Z\/3ZZ$, and $T=ZZ\/2ZZ$; the homomorphisms are projections $phi:R->>S$ and $psi:S->>T$. 

  Then, $T$ is projective as $R$-module (as it's a direct summand of $R$), hence $R$-flat. However, the second map $psi:S->>T$ here is a projection, hence surjective. It's a desired counterexample to this statement also.
]

#pagebreak()

= D//16
#problem[
  Let $R xarrow(phi)S$ be ring homomorphism which is flat. Let $M$ be an $R$-module such that $M tensor_R S$ is torsion-free $S$-module. Is $M$ torsion-free $R$-module?
][
  We'll prove that $M$ is not necessarily a torsion-free $R$-module, by constructing a counterexample.

  \ 

  Consider the ring $R:= ZZ plus.circle QQ$ (with coordinate-wise addition and multiplication). Then, the projection onto the second coordinate $pi_2:R->> QQ$ defines $QQ$ as an $R$-algebra. Now, notice that as $R$-linear map, $pi_2$ has a section, given by $j:QQ -> R$ as $j(q)=(0,q)$. Let's verify it has $R$-linear structure:
  $ forall q,r in QQ, quad j(q+r) = (0,q+r) = (0,q)+(0,r)=j(q)+j(r) $
  $ forall (n,p) in R, quad j((n,p) dot q) j((pi_2 (n,p)) q) = j(p q) = (0, p q) = (n,p) dot (0,q) $
  Hence, $j$ is indeed an $R$-linear map. And, notice that any $q in QQ$ satisfies $pi_2 compose j(q) = pi_2 (0,q) = q$, showing the projection $pi_2$ splits.

  This realizes $QQ$ as a direct summand of $R$ when viewed as an $R$-module. Hence, $QQ$ is a direct summand of a free $R$-module, which is a projective $R$-module, in particular is flat. 
  
  Afterward, we'll denote $pi_2$ as $phi$, and $QQ$ as $S$, so $phi:R -> S$ defines $S$ as a flat $R$-module.

  \ 

  \

  Now, consider $M:=ZZ\/2ZZ plus.circle QQ$ as a ring (with coordinate-wise addition and multiplication again), and another projection map $psi: R ->> M$ by $psi(n,p):= (overline(n),p)$ (where $overline(n) in ZZ\/2ZZ$ is the quotient of $n$). This again realizes $M$ as an $R$-module. 
  
  Notice that $M$ as an $R$-module is not torsion-free: Consider the element $(2,1) in R$, and $(overline(1),0) in M$. The former element is not a zero-divisor in $R$, as if any $(n,p) in R=ZZ plus.circle QQ$ satisfies $(2,1) dot (n,p) = (2n, p) = (0,0)$, one requires $p=0 in QQ$ and $2n=0 in ZZ$, which also implies $n=0 in ZZ$; on the other hand, $(overline(1),0) in M$ is a nonzero element. However, notice the action of $(2,1) in R$ on $(overline(1),0) in M$ is as follow:
  $ (2,1) dot (overline(1),0) = (psi(2,1)) (overline(1),0) = (overline(2),1) (overline(1),0) = (overline(0),1)(overline(1),0)=(overline(0),0) $
  So, the multiplication by $(2,1)$ (an element that's not zero-divisor) is not injective, showing $M$ has torsion elements as $R$-module.

  \ 

  \ 

  Finally, we ought to prove that $M tensor_R S$ is a torsion-free $S$-module. For this, let's recall the map $psi:R->> M$ given by $psi(n,p) = (overline(n),p)$. Hence, one has $(n,p) in ker(phi)$ iff $overline(n)=0 in ZZ\/2ZZ$ and $p=0 in QQ$, which is equivalent to $n in 2ZZ$ and $p = 0 in QQ$. Therefore, $ker(phi) = {(2n,0) in R | n in ZZ}$.

  Now, consider the following exact sequence of $R$-modules:
  #set align(center)
  #diagram($
             0 edge(->) & ker(phi) edge("hook->", script(iota)) & R edge(->>, script(psi)) & M edge(->) & 0
           $)
  #set align(left)
  where $iota$ is the inclusion of ideals. By the flatness of $S$ as an $R$-module proven before, we get the following exact sequence of $R$-modules:
  #set align(center)
  #diagram($
             0 edge(->) & ker(phi) tensor_R S edge("hook->", script(iota tensor id_S)) & R tensor_R S edge(->>, script(psi tensor id_S)) & M tensor_R S edge(->) & 0
           $)
  #set align(left)
  Here, we claim that $ker(phi) tensor_R S$ is $0$: From above, its generators are of the form $(2n,0) tensor p$, where $(2n,0) in ker(phi)$ (or $n in ZZ$) and $p in S=QQ$. But, based on the way we define their $R$-module structure, we have the following:
  $ (2n,0) tensor p &= ((1,0) (2n,0)) tensor (1 p) = (1,0) dot_R ((2n,0) tensor (phi(0,1)p))\ 
  &= (1,0) dot_R ((2,0) tensor ((0,1) dot_R p)) = (1,0) dot_R ((0,1) dot_R ((2n,0)tensor p))\ 
  &= ((1,0)(0,1)) dot_R ((2n,0) tensor p) = (0,0) dot_R ((2n,0)tensor p) = 0 $
  (Note: To prevent confusion, here the $R$-action is denoted using $dot_R$, while the regular multiplication in each ring is without a dot).

  Which, all generators of $ker(phi) tensor_R S$ is $0$, showing that $ker(phi) tensor_R S=0$. As a result, one has $R tensor_R S xarrow(psi tensor id_S) M tensor_R S$ being an isomorphism by the exactness, and as $R$-module one has $R tensor_R S tilde.equiv S$, so $M tensor_R S tilde.equiv S$ as $R$-module.

  Then, when realized as $S$-module, since $S=QQ$, then $M tensor_R S tilde.equiv S$ is in fact a $1$-dimensional $S$-vector space, which is torsion free as $S$-module.

  \ 

  \

  Hence, the above example shows a ring homomorphism $R xarrow(phi) S$ which is flat, $M$ an $R$-module such that $M tensor_R S$ is torsion-free as an $S$-module, yet $M$ itself is not torsion-free as $R$-module. This provides a counterexample to the statement.
]