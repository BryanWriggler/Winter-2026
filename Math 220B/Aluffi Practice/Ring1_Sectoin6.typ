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
  title: "Aluffie Ring 1st Chapter Section 6",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= 6.8//1
#problem[
  Let $R$ be a ring. If $A$ is any set, prove that $Hom_(RMod)(R^(plus.circle A),R)$ satisfies the universal property of the product $R^A$. So, in general $Hom_(RMod)(R^(plus.circle A),R) tilde.equiv.not R^(plus.circle A)$.
][
  First, let's define a projection: Given any $f in Hom_(RMod)(R^(plus.circle A),R)$, define the projection $p_a:R^(plus.circle A) arrow.r R$ by $p_a (f) = f(e_a)$ for all $a in A$. this is clearly a module homomorphism.

  Now, given any $M in RMod$, and for any $a in A$ it associates with a module homomorphism $phi_a:M arrow.r R$. Suppose $h:M arrow.r Hom_(RMod)(R^(plus.circle A),R)$ is a module homomorphism satisfying $p_a compose h = phi_a$ for all $a in A$, then for any $m in M$, one has the following:
  $ phi_a (m)=p_a compose h(m) = h(m)(e_a) $
  Which, $h(m):R^(plus.circle A)-> R$ satisfies $h(m)(e_a) = phi_a (m)$ for all $a in A$. This shows that "if $h(m)$ is well-defined", it is already uniquely determined (since it fixes all the basis elements on $R^(plus.circle A)$). As a result, $h$ is in fact uniquely determined (since it's determined for all $m in M$).

  \ 

  First question: Is $h(m)$ well-defined? Yes, because the maps only tells us how it behaves on the basis elements, but didn't talk about how these elements interact. Therefore, one can define $h(m)(sum r_a e_a) := sum r_a h(m)(e_a) = sum r_a phi_a (m)$, which is clearly well-defined as it is a finite sum. This also shows that $h(m)$ is a module homomorphism.

  \ 

  Second question: Is $h$ itself a module homomorphism? Yes, because one has the following:
  $ h(r m + s n)(e_a) = phi_a (r m+s n)= r dot phi_a (m)+s dot phi_a (n) = r dot h(m)(e_a)+s dot h(n)(e_a) $
  Hence, since it works on all the basis elements, one can say that $h(r m+s n)=r dot h(m)+s dot h(n)$ as module homomorphisms. So, $h$ is itself a module homomorphism.

  \ 

  Finally, this shows that $Hom_(RMod)((R^(plus.circle A)),R)$ is a product $R^A$, since it satisfies the following commutative diagram:

  #diagram($
              & M edge("dl",->,phi_a) edge("dr",->,phi_b) edge("d","..>", script(exists ! h))\ 
              R_a & Hom_(RMod)(R^(plus.circle A),R) edge("l",->, p_a, #left) edge(->, p_b, #right) & R_b
           $)

  where the dashed line is the unique $h$ defined, and it's satisfied for all $a,b in A$.
]

#pagebreak()

= 6.9
#problem[
  Let $R$ be a ring, $F$ a nonzero free $R$-module, and let $phi:M -> N$ be a homomorphism of $R$-modules. Prove that $phi$ is surjective iff for all $R$-module homomorphism $alpha:F -> N$, there exists an $R$-module homomorphism $beta:F-> M$ such that $alpha = phi compose beta$, i.e. $F$ is projective.

  #diagram($
             M edge(->>,script(phi)) & N\ 
             F edge("ur",->,script(forall alpha), #right) edge("u", ->, script(exists beta), #left)
           $)
][
  Here, we'll let $A$ denote the index set of the canonical basis of $F$.

  \ 
  
  $==>:$ 
  
  First, suppose $phi$ is surjective, then given any $alpha:F -> N$, for all $a in A$, since the set map $j_N:A -> N$ by $j_N (a) := alpha(e_a)$ generates $alpha$ based on the universal property of free modules as follow:

  #diagram($
             F edge(->, script(alpha)) & N\
             A edge("u",->, script(iota), #left) edge("ur",->,script(j_N), #right)
           $)

  where $iota:A -> F$ is the canonical inclusion by $a mapsto e_a$.

  Since $phi$ is surjective, for all $a in A$, there exists some $m_a in M$ such that $phi(m_a)  alpha(e_a)$. Which, define the set map $j_M:A -> M$ by $j_M (a) := m_a$. Based on the universal property of free modules, there exists a unique module homomorphism $beta:F-> M$, such that the following diagram commutes:

  #diagram($
             F edge("..>", script(exists ! beta)) & M\ 
             A edge("u", script(iota), #left) edge("ur",->, script(j_M), #right)
           $)

  Hence, for all $a in A$, one has $beta(e_a) = j_M (a) = m_a$. Hence, the composition $phi compose beta(e_a) = phi(m_a) = alpha(e_a)$. Because $phi compose beta$ and $alpha$ are module homomorphisms that agree on the basis elements of $F$, one has $alpha = phi compose beta$.

  \ 

  $<==:$

  Now, for the converse we'll prove the contrapositive. Suppose $phi$ is not surjective, there exists $n in N\\im(phi)$. Then, take the module homomorphism $alpha:F -> N$ by $alpha(e_a) = n$ for all $a in A$. For $alpha$, there doesn't exists any module homomorphism $beta:F -> M$ such that $phi compose beta = alpha$, since $im(phi compose beta) subset.eq im(phi)$, which doesn't contain $n in im(alpha)$.

  Hence, if $phi:M->N$ is not surjective, there exists module homomorphism $alpha:F-> N$, such that for all $beta:F-> M$, $alpha != phi compose beta$. Turning the contrapositive, one gets for any module homomorphism $alpha: F-> N$, there exists $beta:F-> M$, such that $alpha = phi compose beta$, implies $phi$ is surjective.

  \ 

  This finishes the equivalence.
]

#pagebreak()

= 6.10
#problem[
  Let $M,N,Z in RMod$, and let $mu:M-> Z$, $nu:N -> Z$ be module homomorphisms. 

  Prove that $RMod$ has #emph[fiber product], namely there exists an $R$-module $M times_Z N$ with homomorphisms $pi_M:M times_Z N-> M$, $pi_N:M times_Z N->N$, such that $mu compose pi_M = nu compose pi_N$; and, such pair is final with respect to such propert. Namely, the following diagram commutes:

  #set align(center)
  #diagram($
             P edge("drr", ->, script(p_N), bend: #20deg) edge("ddr",->, script(p_M), bend:#(-20deg), #right) edge("dr","..>", script(exists ! h))\ 
              & M times_Z N edge(->, script(pi_N)) edge("d",->, script(pi_M)) & N edge("d",->,script(nu))\
              & M edge(->, script(mu), #right) & Z
           $)
  #set align(left)
][
  First, take the product moduel $M times N$ with canonical projections $pi_M:M times N-> M$ and $pi_N:M times N-> N$. Then, the composition $mu compose pi_M, nu compose pi_N:M times N -> Z$ are two module homomorphisms. 

  Now, given the map $alpha := mu compose pi_M - nu compose pi_N$, define $M times_Z N:= ker(alpha) subset.eq M times N$, and take $pi_M:M times_Z N-> M$ and $pi_N:M times_Z N-> N$ as restrictions of the original projections. Then, for any $(m,n) in M times_Z N = ker(alpha)$, one has the following:
  $ 0=alpha(m,n) = mu compose pi_M (m,n)-nu compose pi_N (m,n)= mu(m)-nu(n) $
  This implies $mu(m) = nu(n)$ for all $(m,n) in M times_Z N$, hence $mu compose pi_M (m,n) = nu compose pi_N (m,n)$, showing the commutativity of the square.

  \ 

  Now, to show the universal property, given any $P in RMod$ with module homomorphisms $p_M:P-> M$ and $p_N:P-> N$ such that $mu compose p_M = nu compose p_N$. If there exists module homomorphism $h:P-> M times_Z N subset.eq M times N$ such that $pi_M compose h=p_M$ and $pi_N compose h=p_N$, by the universality of product $M times N$, such map $h$ is unique if it exists. Hence, it suffices to show the existence.

  For existence, the universality of the product $M times N$ gives a module homomorphism $h:P -> M times N$ such that $p_M = pi_M compose h$ and $p_N = pi_N compose h$. Now, for any $p in P$, since $mu compose p_M = nu compose p_N$, one has the following:
  $ mu compose pi_M (h(p)) = nu compose pi_N (h(p))==> alpha(h(p)) = (mu compose pi_M-nu compose pi_N)(h(p))=0 $
  hence, $h(p) in ker(alpha) = M times_Z N$ set wise. Therefore, the map $h:P -> M times_Z N$ is well-defined (by restricting the codomain), which proves the desired existence.
]

#pagebreak()

= 6.11
#problem[
  Given any $M,N,A in RMod$ together with module homomorphisms $mu:A-> M$ and $nu:A-> N$, show that #emph[fiber coproduct] exists in $RMod$, i.e. an $R$-module $M plus.circle_A N$ together with $iota_M: M-> M plus.circle_A N$ and $iota_N:N -> M plus.circle_A N$, such that the following universal property is achieved in the diagram:

  #set align(center)
  #diagram($
             A edge(->, script(nu)) edge("d",->, script(mu)) & N edge("d",->, script(iota'_N)) edge("ddr",->, script(i_N), bend: #20deg)\
             M edge(->, script(iota'_M), #right) edge("drr", ->, script(i_M), bend: #(-20deg)) & M plus.circle_A N edge("dr", "..>", script(exists ! overline(h)))\ 
              & & C
           $)
  #set align(left)
][
  First, take the coproduct / direct sum module $M plus.circle N$ with canonical inclusions $iota_M:M-> M plus.circle N$ and $iota_N:N -> M plus.circle N$. Then, the compositions $iota_M compose mu, iota_N compose nu:A -> M plus.circle N$ are two module homomorphisms that generates $beta := iota_M compose mu-iota_N compose nu$.

  Now, define $M plus.circle_A N:= coker(beta)= (M plus.circle N)\/im(beta)$, and let $iota'_M: M-> M plus.circle_A N$ and $iota'_N:N -> M plus.circle_A N$ be the compositions of the original inclusions with the canonical projection $p:M plus.circle N -> M plus.circle_A N$. Then, for any $a in A$, one has the following:
  $ 0 = p compose beta(a) = (p compose iota_M) compose mu(a)-(p compose iota_N) compose nu(a) = iota'_M compose mu(a)-iota'_N compose nu(a) $
  This shows that $iota'_M compose mu(a)=iota'_N compose nu(a)$ for all $a in A$, showing the commutativity of the given square.

  \ 

  Now, for the universality, given $C in RMod$ with module homomorphism $i_M:M -> C$ and $i_N:N -> C$ such that $i_M compose mu = i_N compose nu$, first by the universality of the coproduct $M plus.circle N$, there exists a unique module homomorphism $h:M plus.circle N-> C$ such that $h compose iota_M = i_M$ and $h compose iota_N = i_N$. Then, given any $a in A$, one has the following:
  $ 0 = i_M compose mu(a) - i_N compose nu(a) = h compose (iota_M compose mu(a)-iota_N compose nu(a))= h compose beta(a) $
  Hence, this demonstrates $im(beta) subset.eq ker(h)$, meaning $h$ uniquely factors through the cokernel of $beta$, $ plus.circle_A N = coker(beta)$. Hence, there exists unique $overline(h):M plus.circle_A N-> C$, such that together with projection $p:M plus.circle N-> M plus.circle_A N$, we have $h=overline(h) compose p$.

  Therefore, one has $i_M = h compose iota_M = overline(h) compose p compose iota_M = overline(h) compose iota'_M$, and similar logic states $i_N = overline(h) compose iota'_N$.

  \ 
  
  Finally, to show the uniqueness of $overline(h)$, if $overline(h)':M plus.circle_A N-> C$ also satisfies the property, one has $h' = overline(h)' compose p$ satisfies $h' compose iota_M = overline(h)' compose (p compose iota_M) = overline(h)' compose iota'_M = i_M$ and $h' compose iota_N = overline(h)' compose iota'_N = i_N$ using the same logic. Hence, by the universality of coproduct $M plus.circle N$, it enforces $h' = h$, hence $overline(h) compose p= overline(h)' compose p$. Using the epimorphic property of $p$ (since it's surjective), one has $overline(h)=overline(h)'$. This finishes the uniqueness, hence the uinversality.
]

#pagebreak()

= 6.13
#problem[
  Prove that every homomorphic image of a finitely generated module is finitely generated.
][
  Given $M,N in RMod$ with $M$ being finitely generated, say $M$ is generated by $m_1,...,m_k in M$. Then, with module homomorphism $phi:M -> N$, one has $im(phi)$ generated by $phi(m_1),...,phi(m_k)$: 
  
  Given any $n in im(phi)$, there exists $m in M$, such that $phi(m)=n$. Yet, by finitely generated claim of $M$, there exists $r_1,...,r_k in R$, such that $sum_(i=1)^k r_i m_i = m$. So, $n = phi(m) = sum_(i=1)^k r_i phi(m_i)$, showing $im(phi)$, can bbe generated by $phi(m_i)$, $i=1,...,k$.
]

\ 

= 6.14
#problem[
  Prove that the ideal $(x_1,x_2,...)$ of the ring $R=ZZ[x_1,x_2,...]$ is not finitely generated (as an ideal, i.e. as an $R$-module).
][
  Suppose the contrary that the given ideal is finitely generated, then there exists $f_1,...,f_n in R$, such that $(f_1,...,f_n) = (x_1,x_2,...)$.

  \ 

  First, by definition each of these polynomials each have only finitely many indeterminates involved, WLOG say $f_1,...f_n$ only have $x_1,...,x_N$ involved. Then, it's clear that $(x_1,x_2,...)=(f_1,...,f_n) subset.eq (x_1,...,x_N)$.

  However, if looking at $x_(N+1)$, there exists $g_1,...,g_N in R$, such that $x_(N+1) = g_1 dot x_1+...+g_N dot x_N$. Let's say with the involvement of $g_1,...,g_N$, the list of indeterminates it includes expand to ${x_1,...,x_N, x_(N+1),...,x_M}$ for some $M>N$. Then, consider the following evaluation map $phi:ZZ[x_1,...,x_M]->ZZ$ by $phi(x_1)=...=phi(x_N)=phi(x_(N+2))=...=phi(x_M)=0$, while $phi(x_(N+1))=1$.

  Notice that $x_(N+1), g_1,...,g_N, x_1,...,x_N in ZZ[x_1,...,x_M]$ based on construction, then one has $phi(x_(N+1))=1$, while $phi(g_1 x_1+...+g_N x_N) = 0$. Yet, this is a contradiction based on the assumption $x_(N+1)=g_1 x_1 +...+g_N x_N$. Hence, our assumption is wrong, $(x_1,x_2,...)$ can't be finitely generated module over $R$.
]

\ 

= 6.15 (ND)
#problem[
  Let $R$ be a commutative ring. Prove that a #emph[commutative] $R$-algebra $S$ is finitely generated as an #emph[algebra] over $R$ iff it's finitey generated as a #emph[commutative algebra] over $R$.
][]

#pagebreak()

= 6.16
#problem[
  Let $R$ be a ring. A (left) $R$-module $M$ is #emph[cyclic] if $M=langle m rangle$ for some $m in M$. Prove that simple modules are cyclic. Prove that an $R$-module $M$ is cyclic iff $M tilde.equiv R\/I$ for some (left) ideal $I$. Prove that every quotient of a cyclic module is cyclic.
][
  1. Given $M$ a simple module (which doesn't have nontrivial proper submodule). Pick nonzero element $m in M$, and consider the submodule $R m subset.eq M$. It's clear that $R m!=0$, so by simplicity of $M$, one must have $R m = M$, showing $M= langle m rangle$.

    \ 

  2. $==>:$

    Suppose $M$ is cyclic, $M=langle m rangle$. Define a map $phi:R-> M$ by $phi(r) = r m$ for all $r in R$. This is clearly a module homomorphism (since $phi(s r_1+t r_2) = (s r_1+t r_2)m = s(r_1 m)+t (r_2 m) = s dot phi(r_1)+t dot phi(r_2)$). And, since $M = langle m rangle$, one has $phi$ being surjective. Hence, there exists some submodule $I subset.eq R$, such that $M tilde.equiv R\/I$. As a result, $I$ is that (left) ideal.

    \ 

    $<==:$

    Suppose $M tilde.equiv R\/I$ for some (left) ideal $I$. Then, take the isomorphism map $phi':R\/I arrow.tilde M$, compose it with the "$RMod$" canonical projection $p:R->>R\/I$, one has $phi := phi' compose p:R->> M$ be a surjective module homomorphism.

    Which, let $m:= phi(1) in M$. Since $phi$ is surjective, all $m' in M$ has some $r in R$, such that $phi(r)=m'$. Hence, $m' = phi(r) = r dot phi(1) = r m$, showing that $m' in langle m rangle$. So, $M = langle m rangle$, showing it's cyclic.

    \ 

  3. Given $M = langle m rangle$, and let $N subset.eq M$ be a submodule. Then, the projection map $p:M ->> M\/N$ is surjective, and it's clearly generated by $overline(m) in M\/N$ by the surjectivity (all $overline(m)' in M\/N$ has some $m' in M$ as its preimage, since $m' = r m$ for some $r$, one has $overline(m)' = p(m') = p(r m)=r dot overline(m)$, showing $M\/N = langle overline(m) rangle$).
]

\ 

= 6.17
#problem[
  Let $M$ be a cyclic $R$-module, so that $M tilde.equiv R\/I$ for a (left) ideal $I$, and let $N$ be another $R$-module.
  - Prove that $Hom_(RMod)(M,N) tilde.equiv {n in N | forall r in I, a n=0}$.
  - Special case: For all $a,b in ZZ$, prove that $Hom_(Ab)(ZZ\/a ZZ, ZZ\/b ZZ) tilde.equiv ZZ\/ gcd(a,b)ZZ$.
][
  Since $M tilde.equiv R\/I$, this is equivalent to say $Hom_(RMod)(R\/I, N) tilde.equiv {n in N | forall a in I, a n=0}$.

  \ 

  Define a map $phi:Hom_(RMod)(R\/I, N)-> N$ by $phi(f) = f(overline(1))$. This is clearly a module homomorphism, since $phi(r dot f+s dot g) = (r dot f+s dot g)(overline(1)) = r dot f(overline(1))+s dot g(overline(1)) = r dot phi(f)+s dot phi(g)$.

  First, it's injective, since if $phi(f)=f(overline(1))=0$, all $r in R$ has $f(overline(r)) = f(r dot overline(1)) = r dot f(overline(1))=0$, showing $f=0$.

  Then, any $f in Hom_(RMod)(R\/I, N)$ has the following: For all $a in I$, $a dot phi(f) = a dot f(overline(1)) = f(a dot overline(1))= f(overline(a)) = f(overline(0))=0$, so $im(phi) subset.eq {n in N | forall a in I, a n=0}$.

  Finally, to show the image is the same as the desired set, given any $n in N$ such that $a n=0$ for all $a in I$, define $f:R-> N$ by $f(r) := r dot n$. Since for all $a in I$ one has $f(a)=a n=0$, one has $a in ker(f)$, or $I subset.eq ker(f)$. Hence, this module homomorphism uniquely factors through $R\/I$, generating a module homomorphism $overline(f):R\/I -> N$ such that $overline(f)(overline(r)) = f(r) = r dot n$. As a result, $phi(overline(f)) = overline(f)(overline(1)) = 1 dot n = n$, showing that $n in im(phi)$.

  Hence, $im(phi) = {n in N | forall a in I, a n=0}$. And, with the injectivity of $phi$, $Hom_(RMod)(R\/I, N) tilde.equiv {n in N | forall a in I, a n=0}$.
]

\ 

= 6.18
#problem[
  Let $M$ be an $R$-module, and let $N$ be submodule of $M$. Prove that if $N$ and $M\/N$ are both finitely generated, then $M$ is finitely generated.
][
  Let $n_1,...,n_k in N$ generates $N$, $m_1,...,m_l in M$ such that their image in $M\/N$ generates $M\/N$. Then, the list of $n_i$'s and $m_j$'s in fact generate $M$:

  \ 

  Given any $m in M$, its image $overline(m) in M\/N$ can be written as $overline(m) = sum_(j=1)^l r_i overline(m_i) = overline(sum_(i=1)^l r_i m_i)$, showing that $m - sum_(i=1)^l r_i m_i in N$. As a result, there exists $s_1,...,s_k in R$, such that $m-sum_(i=1)^l r_i m_i=sum_(j=1)^k s_j n_j$. So, $m=sum_(j=1)^k s_j n_j + sum_(i=1)^l r_i m_i$, showing that $M$ can be generated by the $n_i$'s and $m_j$'s.
]