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
  title: "Extra Notes on Direct Limits",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline()

Here, we'll fix $I$ as a directed set (a preorder + every two elements has an upper bound).

= Abelian Category Structure of $[I,Ab]$

Recall that for a directed system in $Ab$, one can take its direct limit. However, if fixing a direct system $I$, and consider the functor category $[I, Ab]$ (sometimes even stronger, $[I, CRing]$), it has a natural abelian category structure:

#proposition[
  $[I,Ab]$ has a natural Abelian Category structure.
][
  1. #text(weight: "bold")[Zero Object:] 
  
    If taking the "zero system" $z:I -> Ab$ by $z(i) = 0$, and $z f_(i j): z(i)->z(j)$ to be the zero morphism, then for any other direct system $F:I -> Ab$, the only possible natural transformation from $z$, say $mu:z -> F$, is $mu(i) = 0:z(i)=0-> F(i)$; and the only possible natural transformation to $z$, say $rho:F -> z$, is $rho(i) = 0:F(i) -> z(i)=0$ (since $0$ the trivial group is both initial and final in $Ab$).

    Notice that this altumatically makes $mu, rho$ as natural transformations, as these two diagrams commute:
    #set align(center)
    #diagram($
               z(i) edge(->, script(0)) edge("d",->, script(mu_i=0)) & z(j) edge("d",->, script(mu_j=0), #left) \ 
               F(i) edge(->, script(f_(i j)), #right) & F(j)
             $)
    #set align(left)
    #set align(center)
    #diagram($
               F(i) edge(->, script(f_(i j))) edge("d",->, script(rho_i = 0), #right) & F(j) edge("d",->, script(rho_j = 0), #left) \ 
               z(i) edge(->, script(0), #right) & z(j)
             $)
    #set align(left)
    So, we indeed have a zero object in this category.

    \ 

  2. #text(weight: "bold")[Kernels and Cokernels:] 

    If given a morphism $phi: F-> G$ between two directed systems, for each $i in I$, there exists a group homomorphism $phi_i:F(i) -> G(i)$, and hence one can define $K(i)$ as the set-theoretic kernel of $F(i)$, and the morphism $ker(phi)_i: K(i) arrow.hook F(i)$ as the inclusion.

    for the morphism $f_(i j):F(i) -> F(j)$ and $g_(i j):G(i)-> G(j)$, notice we have the following naturality square, regarding the kernels:
    #set align(center)
    #diagram($
               K(i) edge("hook->", script(ker(phi)_i)) & F(i) edge("d",->, script(f_(i j))) edge(->, script(phi_i)) & G(i) edge("d",->, script(g_(i j)), #left) \
               K(j) edge("hook->", script(ker(phi)_j)) & F(j) edge(->, script(phi_j)) & G(j)
             $)
    #set align(left)
    Which, notice that one has $0 = g_(i j) compose (phi_i compose ker(phi)_i)= phi_j compose (f_(i j) compose ker(phi)_i)$, so the morphism $f_(i j) compose ker(phi)_i$ uniquely factors through $ker(phi)_j:K(j)arrow.hook F(j)$, say some $k_(i j):K(i)-> K(j)$:
    #set align(center)
    #diagram($
               K(i) edge("d", ->, script(k_(i j))) edge("hook->", script(ker(phi)_i)) & F(i) edge("d",->, script(f_(i j))) edge(->, script(phi_i)) & G(i) edge("d",->, script(g_(i j)), #left) \
               K(j) edge("hook->", script(ker(phi)_j), #right) & F(j) edge(->, script(phi_j), #right) & G(j)
             $)
    #set align(left)
    Note the universality of kernels make $K:I -> F$ by $i mapsto K(i)$ and $K(i-> j) = k_(i j)$ as a functor (or a directed system over $I$).

    Now, we claim that $K$ together with the morphism $ker(phi):K -> F$ is indeed a kernel of $phi:F -> G$: Suppose some other morphism $psi: L -> F$ satisfies $phi compose psi = 0$, then each index $i in I$ satisfies $phi_i compose psi_i : L(i) -> F(i) -> G(i)$ being $0$. So, the map uniquely factors through $ker(phi)_i:K(i) -> F(i)$, say as $overline(psi)_i:L(i) -> K(i)$, as follow:
    #set align(center)
    #diagram($
               K(i) edge("dr", ->, script(k_(i j)), #right) edge("rr", "hook->", script(ker(phi)_i)) && F(i) edge("dr", ->, script(f_(i j))) edge("rr", ->, script(phi_i)) && G(i) edge("dr", ->, script(g_(i j))) \ 
              & K(j) edge("ur", ->) edge("rr", "hook->", script(ker(phi)_j), #right) && F(j) edge("rr", ->, script(phi_j), #right) && G(j)\ 
              L(i) edge("uu", "..>", script(exists ! overline(psi)_i), #left) edge("dr", ->, script(l_(i j)), #right) edge("ur", script(psi_i))\ 
              & L(j) edge("uu", "..>", script(exists ! overline(psi)_j)) edge("uurr", ->, script(psi_j), #right)
             $)
    #set align(left)
    Which, the square between $L(i),L(j),K(i), K(j)$ is a naturality square, because of the following diagram chase:
    $ ker(phi)_j compose (k_(i j) compose overline(psi)_i) &= f_(i j) compose (ker(phi)_i compose overline(psi)_i) = f_(i j) compose psi_i\ 
    &= psi_j compose l_(i j) = ker(phi)_j compose (overline(psi)_j compose l_(i j)) $
    Finally, using the fact that $ker(phi)_j$ is a kernel in $Ab$ (hence a monomorphism), this concludes that $k_(i j) compose overline(psi)_i = overline(psi)_j compose l_(i j)$, hence it's a naturality square. With $i,j$ being arbitrary, one concludes that $overline(psi):L -> K$ is a natural transformation (wich each component being $overline(psi)_i$).

    The uniqueness of $overline(psi)$ (as a morphism in $[I, Ab]$) follows the universality of each $ker(phi)_i$ as a kernel in $Ab$, proving that $ker(phi):K -> F$ is indeed a kernel in $[I, Ab]$.

    #text(weight: "bold")[Note:] For the cokernel case, just put the arrows on the other side, the proof works similarly.

    \ 

  3. #text(weight: "bold")[Equivalence of Monomorphism and Component-Wise Monomorphism:]

    (#text(weight: "bold")[Note:] The dual notion is epimorphism and component-wise epimorphism, where the proof follows similarly.)

    It's clear that if a morphism $phi:F->G$ is component-wise monomorphic, it must be a monomorphism in $[I,Ab]$ (just because the left cancellative property applies to each component will prove the equality globally).

    Now, suppose $phi:F -> G$ is a monomorphim in $[I,Ab]$ (i.e. given any two morphism $rho,mu:L -> F$, one has $phi compose rho=phi compose mu$ implies $rho=mu$), then we claim the kernel of each component is $0$ (which is equivalent to being monomorphic in $Ab$). Note that part 2 above helped us realize the kernel of the morphism as component-wise kernel. So, if consider the zero morphism $0:K -> F$ and the kernel morphism $ker(phi):K -> F$, notice that $phi compose 0 = phi compose ker(phi)$, which the left cancellative property implies $0 = ker(phi)$, or each component has $0= ker(phi)_i:K(i)->F(i)$, proving each $phi_i:F(i) -> G(i)$ is a monomorphism.

    \ 

  4. #text(weight: "bold")[Equivalence of Monomorphism and Kernel:]

    (#text(weight: "bold")[Note:] The dual notion is epimorphism and cokernel, the proof also follows similarly).

    Since kernel of a morphism is a component-wise kernel (cf. part 2), and kernel is the same as monomorphism in $Ab$, then part 3 guarantees the kernel morphism in $[I,Ab]$ to be a monomorphism (as it's component-wise monomorphic).

    Conversely, given a monomorphism $phi:F arrow.hook G$, running through similar proof of part 2 guarantees it has a cokernel $coker(phi):G -> C$ (where it's taken as cokernel component-wise). Then, since for every component $phi_i:F(i)->G(i)$ is a kernel of $coker(phi)_i:G(i)->C(i)$ (in $Ab$, a monomorphism is a kernel of its own cokernel), hence globally $phi:F arrow.hook G$ is a kernel of $coker(phi):G->C$, proving that $phi$ is a kernel in $[I,Ab]$.

    \ 

  5. #text(weight: "bold")[Existence of Product, Coproduct, and Finite Biproduct:]

    Given two direct systems $F,G in [I,Ab]$, for each index $i in I$, define the "biproduct" $(F plus.circle G)(i) := F(i) plus.circle G(i)$, which it naturally associates with projections $pi_(F,i):(F plus.circle G)(i) ->> F(i)$ and $pi_(G,i):(F plus.circle G)(i)->> G(i)$, also with inclusions $iota_(F,i):F(i) arrow.hook (F plus.circle G)(i)$ and $iota_(G,i):G(i) arrow.hook (F plus.circle G)(i)$.

    Now, we claim for every $i->j$ in $I$, there exists a natural morphism $h_(i j):(F plus.circle G)(i)-> (F plus.circle G)(j)$. Let's consider the following diagram:
    #set align(center)
    #diagram($
               F(i) edge("d", ->, script(f_(i j))) & (F plus.circle G)(i) edge("l",->>, script(pi_(F,i))) edge(->>, script(pi_(G,i))) edge("d", "..>", script(exists ! h_(i j))) & G(i) edge("d",->, script(g_(i j)), #left) \ 
               F(j) & (F plus.circle G)(j) edge("l",->>, script(pi_(F,j)), #left) edge(->>, script(pi_(G,j)), #right) & G(j)
             $)
    #set align(left)
    Where, the uniqueness of $h_(i j)$ is given by the two maps $f_(i j) compose pi_(F,i):(F plus.circle G)(i) -> F(j)$, $g_(i j) compose pi_(G,i):(F plus.circle G)(i)-> G(j)$, and the fact that $(F plus.circle G)(j)$ (with the two projections) is a product of $F(j),G(j)$ in $Ab$.

    Then, the association $F plus.circle G: I -> Ab$ by $i mapsto (F plus.circle G)(i)$, and $F plus.circle G(i->j) = h_(i j)$ is a functor by the universality of product.

    (Note: If using the inclusions as the proof, we'll still get the same morphism, as the biproduct property guarantees the $h_(i j)$ to agree, regardless if we use projections of inclusions to derive it). Also, the "projections" and "inclusions" component wise clearly form a naturality square, showing $pi_F:F plus.circle G-> F$ (resp. $pi_G$ for G) and $iota_F:F -> F plus.circle G$ (resp. $iota_G$ for $G$) are all morphisms in $[I,Ab]$.

    \ 

    Finally, we claim the universality of $F plus.circle G$ as a biproduct (which we'll prove the product part, as the coproduct part is with similar proof).

    Consider another direct system $L$ together with two morphisms $p_F:L -> F$ and $p_G: L->G$, then notice that component wise, the universlity of $(F plus.circle G)(i)$ as product of $F(i), G(i)$ guarantees a unique morphism $p_i:L(i)-> (F plus.circle G)(i)$ as follow:
    #set align(center)
    #diagram($
               & L(i) edge("dl",->, script(p_(F,i))) edge("dr", ->, script(p_(G,i))) edge("d","..>", script(exists ! p_i))\ 
               F(i) & (F plus.circle G)(i) edge("l",->>, script(pi_(F,i)), #left) edge(->>, script(pi_(G,i)), #right) & G(i)
             $)
    #set align(left)
    Which, given any morphism $i-> j$, one has the following large "commutative tent":
    #set align(center)
    #diagram($
               & L(i) edge("rrr",->, script(l_(i j))) edge("ddl", ->, script(p_(F,i))) edge("ddddr", ->, script(p_(G,i))) edge("ddd", ->, script(p_i)) &&& L(j) edge("ddl",->, script(p_(F,j))) edge("ddddr",->, script(p_(G,j))) edge("ddd",->, script(p_j), #left) \ 
               \ 
               F(i) edge("rrr",->, script(f_(i j))) &&& F(j)\ 
               & (F plus.circle G)(i) edge("rrr",->, script(h_(i j)), #right) edge("ul", ->>, script(pi_(F,i)), #left) edge("dr",->>, script(pi_(G,i)), #right) &&& (F plus.circle G)(j) edge("ul",->>, script(pi_(F,j))) edge("dr",->>, script(pi_(G,j)))\ 
               && G(i) edge("rrr",->, script(g_(i j)), #right) &&& G(j)
             $)
    #set align(left)
    Which, notice the middle "verticle square" is also a naturality square, based on the following observation:
    $ pi_(G,j) compose (h_(i j) compose p_i) &= g_(i j) compose (pi_(G,i) compose p_i) = g_(i j) compose p_(G,i)\ 
    &= p_(G,j) compose l_(i j)= pi_(G,j) compose (p_j compose l_(i j)) $
    Repeating similar proof for the other side of the tent, we also have the following:
    $ pi_(F,j) compose (h_(i j) compose p_i) = pi_(F,j) compose (p_j compose l_(i j)) $
    Where this is based on the fact that $p_F, p_G$  are natural transformations, and the product property of morphisms $h_(i j)$ and $p_i, p_j$.

    Also, consider the fact that the morphism $p_(F,j) compose l_(i j):L(i)-> F(j)$ and $p_(G,j) compose l_(i j):L(i)-> G(j)$, they factor uniquely through $(F plus.circle G)(j)$, and the unique factored morphism has composition with the projections that recovers the two listed morphisms.

    Then, based on (1.2), (1.3) two equations, we know that $p_j compose l_(i j), (h_(i j) compose p_i): L(i) -> (F plus.circle G)(j)$ both satisfy such requirement (since $pi_(F,j) compose (p_j compose l_(i j)) = p_(F,j) compose l_(i j)$, and $pi_(G,j) compose (p_j compose l_(i j)) = p_(G,j) compose l_(i j)$). Hence, this enforces $p_j compose l_(i j)=h_(i j) compose p_i$ using the universality of product. This proves the middle is a naturality square, or $p:L -> F plus.circle G$ is well-defined.

    Finally, the morphism $p$ is unique, simply because component wise it must be realied as a product morphism, hence must be unique. This proves the universality of $F plus.circle G$ as a product in $[I,Ab]$. (Note: Repeat the proof with inclusions, and reverse the tent provides the case for coproduct :)

    Using similar proof, one can also construct arbitrary small product and coproduct in similar sense (except over infinite direct systems they'll be different).

  \ 

  So, with all these conditions, $[I,Ab]$ is an abelian category.
]

#pagebreak()

= Direct Limits and Exactness

Given the Functor Category $[I,Ab]$, all direct system $F in [I,Ab]$ has direct limit $colim F$ (well-defined up to isomorphism), in particular we'll choose this to be the classical construction through direct sums and quotients. Now, we claim that similar ideas can be done on the morphisms:

#proposition[
  Given morphism $phi:F -> G$ in $[I,Ab]$, it descends to a homomorphism of direct limits, denoted as $overline(phi):colim F-> colim G$.
][
  Notice that every $i in I$ corresponds to a morphism $phi_i:F(i) -> G(i)$, composing with each inclusion $iota_(G,i): G(i) arrow.hook plus.circle.big_(i in I)G(i)$, one gathers a family of map $(iota_G compose phi)_i:F(i) -> plus.circle.big_(i in I)G(i)$. Hence, using the universality of biproduct, one gets $plus.circle phi:plus.circle.big_(i in I)F(i) -> plus.circle.big_(i in I)G(i)$ (intuitively, it's a component-wise map, each being the $phi_i$).

  \ 

  Now, given the direct limit is constructed as a suitable quotient, one has projection $pi_F: plus.circle.big_(i in I)F(i)->> colim F$ and $pi_G: plus.circle.big_(i in I)G(i)->> G$. Then, the composition of morphisms give the morphism $pi_G compose (plus.circle phi):plus.circle.big_(i in I)F(i) -> colim G$. The goal is to prove this uniquely factors through $colim F$.

  \ 

  Let's recall the equivalence relation for direct limit: Given $a_i in F(i)$ and $a_j in F(j)$, one has $a_i tilde a_j$ iff there exists an upper bound $k>= i,j$, such that $f_(i k)(a_i) = f_(j k)(a_j)$ in $F(k)$.

  However, if $a_i tilde a_j$, then notice that $phi_i (a_i) in G(i)$ and $phi_j (a_j) in G(j)$ satisfies the following:
  $ g_(i k) compose phi_i (a_i) = phi_k compose f_(i k)(a_i) = phi_k compose f_(j k)(a_j) = g_(j k) compose phi_j (a_j) $
  This shows that $phi_i (a_i) tilde phi_j (a_j)$ in direct system $G$, or $pi_G (phi_i (a_i) - phi_j compose (a_j))=0$.

  As a result, since $(plus.circle phi)(a_i - a_j) = phi_i (a_i)-phi_j (a_j)$ (since it's component-wise morphism), so $pi_G compose (plus.circle phi)(a_i-a_j)=0$, showing the subgroup of equivalence relation in direct system $F$ is inside the kernel of the map.

  Hence, this uniquely factors through the quotient of $plus.circle.big_(i in I)F(i)$ with the equivalence relation, namely the direct limit $colim F$, which can be denoted as a morphism $overline(phi):colim F-> colim G$, such that $pi_G compose (plus.circle phi) = overline(phi) compose pi_F$.
]

\

As a remark, this assignment $(phi:F->G) mapsto (overline(phi):colim F-> colim G)$ is functorial (because the composition of homomorphisms between direct sums of elements in the direct system, is equivalent to compose the morphisms betweenn direct systems first, then take the homomorphism between the direct sums). Hence, this generates a functor $D:[I,Ab]-> Ab$, by $F mapsto colim F$, and morphism $(phi:F->G) mapsto (overline(phi):colim F-> colim G)$.

\ 

Now, we wish to claim something even stronger, that $D$ not only is a functor, but also preserves additive structure, and exactness.
#theorem[
  $D:[I,Ab]-> Ab$ is an additive functor between abelian categories.
][
  There are two ways to approach: Either proving that $D$ preserves biproduct (the hard way), or do an element-wise proof. We'll choose the latter (simply because I'm lazy :)

  \ 

  Recall that given morphism $phi:F->G$, one has induced homomorphism $(plus.circle phi):plus.circle.big_(i in I)F(i)-> plus.circle.big_(i in I)G(i)$, and the induced homomorphism on direct limits $overline(phi):colim F-> colim G$ that satisfy the following commutative diagram:
  #set align(center)
  #diagram($
             plus.circle.big_(i in I)F(i) edge("d",->>, script(pi_F), #right) edge(->, script(plus.circle phi)) & plus.circle.big_(i in I)G(i) edge("d",->>, script(pi_G), #left) \ 
             colim F edge(->, script(overline(phi)), #right) & colim G
           $)
  #set align(left)
  Now, given any $phi,psi:F->G$, notice that $phi+psi$ is a morphism that has addition component wise. Hence, the general homomorphism $(plus.circle (phi+psi)):plus.circle.big_(i in I)F(i)-> plus.circle.big_(i in I)G(i)$ in fact equals the addition $(plus.circle phi)+(plus.circle psi)$ (since the morphism generated between coproducts preserve the component wise addition). As a result, one has the following:
  $ overline(phi+psi) compose pi_F &= pi_G compose (plus.circle(phi+psi)) = pi_G compose (plus.circle phi+plus.circle psi)\ 
  &= pi_G compose (plus.circle phi)+pi_G compose (plus.circle psi) = overline(phi) compose pi_F + overline(psi) compose pi_F\ 
  &= (overline(phi)+overline(psi)) compose pi_F $
  Then, using the fact that $pi_F$ is an epimorphism (which is right-cancellative), one guarantees $overline(phi+psi)=overline(phi)+overline(psi)$. Hence, $D(phi+psi) = D phi+D psi $, proving the additive property of $D$.
]

\ 

And, here is the claim on exactness:
#theorem[
  $D:[I,Ab]-> Ab$ as an additive function, is exact.
][
  Here, we'll also try and work with element-wise proof (the general categorical claim is too hard to be honest). Here, let's fix two morphisms $phi:F->G$ and $psi:G->H$ in $[I,Ab]$. We'll still proceed with several smaller claims:

  \ 

  \

  #text(weight: "bold")[I. Equivalence of Exactness and Component-Wise Exactness:]

  For detail, we claim that the sequence $0->F->G->H->0$ is exact, iff every index $i in I$ has the homomorphisms $phi_i:F(i)->G(i)$ and $psi_i:G(i)->H(i)$ satisfy $0->F(i)->G(i)->H(i)->0$ being exact.

  \ 

  Notice that $0->F->G->H->0$ is exact $<==>$ $phi$ is monomorphism, $psi$ is epimorphism, and the morphisms $im(phi) = ker(psi)$.

  However, notice that all of these are equivalent to component-wise properties:
  - $phi$ is monomorphic $<==>$ each $phi_i$ is monomorphic.
  - $psi$ is epimorphic $<==>$ each $psi_i$ is epimorphic.
  - $im(phi)=ker(psi)$ $<==>$ each $im(phi_i) = ker(psi_i)$.
  Which, all three conditions are equivalent to $0->F(i)->G(i)->H(i)->0$ being exact for all $i in I$.

  \ 

  \ 

  #text(weight: "bold")[II. Equivalence of Component-Wise Exactness and Direct Sums' Exactness:]

  (#text(weight: "bold")[Remark:] This statement is not true in any abelian category, only in Grothendieck Categories).

  \ 

  For detail, we claim that each index $i in I$ has $0->F(i)->G(i)->H(i)->0$ being exact $<==>$ the gathered homomorphisms $(plus.circle phi):plus.circle.big_(i in I)F(i)-> plus.circle.big_(i in I)G(i)$ and $(plus.circle psi):plus.circle.big_(i in I)G(i)->H(i)$ satisfy $0-> plus.circle.big_(i in I)F(i) -> plus.circle.big_(i in I)G(i)-> plus.circle.big_(i in I)H(i)->0$ being exact.

  \ 

  First, about $plus.circle phi$ being monomorphic, the set-theoretic side guarantees that if $(plus.circle phi)((a_i)_(i in I))= (phi_i (a_i))_(i in I)=0$ iff each $phi_i (a_i)=0$ iff each $a_i in ker(phi_i)$. So, $ker(plus.circle phi)=plus.circle.big_(i in I)ker(phi)$. Hence, $plus.circle phi$ is a monomorphism $<==>$ each direct summand (or each $ker(phi_i)$) is $0$, which is equivalent to component-wise monomorphism. This takes care of the left most part.

  \ 

  Then, about $plus.circle psi$ being epimorphic, again set-theoretic side guarantees that if each $psi_i$ is surjective, then $plus.circle psi$ is surjective (as all element $(b_i)_(i in I)$ in $plus.circle.big_(i in I)H(i)$, each has some $a_i in G(i)$, where $psi_i (a_i)=b_i$, so $(plus.circle psi)((a_i)_(i in I)) = (psi_i (a_i))_(i in I)=(b_i)_(i in I)$; this is well-defined because only finitely many $b_i!=0$, so only finitely many $a_i$ needs to be chosen as nonzero). On the other hand, if $plus.circle psi$ is surjective, then each $psi_i$ must also be surjective (since looking at any element $a_i in H(i) arrow.hook plus.circle.big_(i in I)H(i)$, it is mapped to by some $(a_i)_(i in I)$ in $plus.circle.big_(i in I)G(i)$, so in particular one has $psi_i (a_i)=b_i$). Hence, the epimorphism part is also equivalent.

  \ 

  Finally, about the middle part, since one has $ker(plus.circle psi) = plus.circle.big_(i in I)ker(psi_i)$, and $im(plus.circle phi) = plus.circle.big_(i in I)im(phi_i)$, then the two are equal $<==>$ each $im(phi_i)=ker(psi_i)$, happens iff it's exact at the middle of every component.

  This finishes the proof of the equivalence.

  \ 

  \ 

  #text(weight: "bold")[III. Direct Sum Exactness implies Direct Limit Exactness:]

  Now, we know $0-> plus.circle.big_(i in I)F(i)-> plus.circle.big_(i in I)G(i)->plus.circle.big_(i in I)H(i)->0$ is exact (because $0->F->G->H->0$ is, and the previous two parts). Let's conclude it for the direct limits:

  1. Given $(plus.circle psi):plus.circle.big_(i in I)G(i)->>plus.circle.big_(i in I)H(i)$ being surjective, consider this commutative diagram:
    #set align(center)
    #diagram($
               plus.circle.big_(i in I)G(i) edge("d",->>, script(pi_G)) edge(->>, script(plus.circle psi)) & plus.circle.big_(i in I)H(i) edge("d",->>, script(pi_H), #left) \ 
               colim G edge(->, script(overline(psi)), #right) & colim H
             $)
    #set align(left)
    Which, $overline(psi) compose pi_G = pi_H compose (plus.circle psi)$, while the latter is surjective, this enforces $overline(psi)$ to be surjective.

    \ 

  2. Given $(plus.circle phi):plus.circle.big_(i in I)F(i) arrow.hook plus.circle.big_(i in I)H(i)$ being injective, consider the commutative diagram:
    #set align(center)
    #diagram($
               plus.circle.big_(i in I)F(i) edge("d",->>, script(pi_F), #right) edge("hook->", script(plus.circle phi)) & plus.circle.big_(i in I)G(i) edge("d",->>, script(pi_G), #left) \ 
               colim F edge(->, script(overline(phi)), #right) & colim G
             $)
    #set align(left)
    Which, given any $overline(a) in ker(overline(phi))$, take a representative $a in plus.circle.big_(i in I)F(i)$, then one has $overline(phi) compose pi_F (a)=overline(phi)(overline(a))=0$, so $pi_G compose (plus.circle phi)(a) = overline(plus.circle phi(a))=0$, showing $(plus.circle phi)(a)$ is inside the subgroup generated by the equivalence relation in $G$.

    Yet, notice that this enforces $a$ to also be in the subgroup generated by the equivalence relation in $F$ (which we'll check that the relations in $F$ must be precisely carried over to $G$, no new relations can be created in the image):

    If $a_i, b_j$ in $F$ satisfies $phi_i (a_i) tilde phi_j (b_j)$ in $G$, then one has some upper bound $k>=i,j$ in $I$, such that $g_(i k) compose phi_i (a_i)=g_(j k) compose phi_j (a_j)$, using the naturality of $phi$, one gets $phi_k compose f_(i k)(a_i) = phi_k compose f_(j k)(a_j)$, then the injectivity of $phi_k$ implies $f_(i k)(a_i)=f_(j k)(a_j)$, or $a_i tilde a_j$.

    Hence, if $(plus.circle phi)(a)$ lives in the subgroup generated by the equivalence relation of $G$, its preimage (namely $a$ only by injectivity) must live in the subgroup generated by the equivalence relation of $F$. Hence, one has $pi_F (a)=overline(a)=0$, proving the injectivity of $overline(phi)$.

    \ 

  3. Since the big commutative diagram commutes (i.e. $overline(psi) compose overline(phi) compose pi_F = overline(psi) compose pi_G compose (plus.circle phi) = pi_H compose (plus.circle psi) compose (plus.circle phi) = 0$, with $pi_F$ being epimorphic, then $overline(psi) compose overline(phi) = 0$).

    On the other hand, any $overline(b) in ker(overline(psi))$ has its representative $b in plus.circle.big_(i in I)G(i)$ satisfies $0 = overline(psi)(overline(b)) = overline(psi) compose pi_G (b) = pi_H compose (plus.circle psi)(b) = overline(plus.circle psi(b))$, which $plus.circle psi(b)$ is in the subgroup generated by the equivalence relations of direct limits in $H$.

    Now, the goal is to prove, then $b$ is itself equivalent to something inside the image of $plus.circle phi$ (which suffices to check for the generators): Given $a_i in G(i)$ and $a_j in G(j)$ such that $psi_i (a_i) tilde psi_j (a_j)$, then there exists $k>=i,j$ in $I$, where $h_(i k) compose psi_i (a_i)=h_(j k) compose psi_j (a_j)$. Hence:
    $ psi_k compose g_(i k)(a_i)=h_(i k) compose psi_i (a_i)=h_(j k) compose psi_j (a_j)= psi_k compose g_(i k)(a_j) $
    As a result, one has $psi_k (g_(i k)(a_i)-g_(j k)(a_j))=0$, showing $g_(i k)(a_i) - g_(j k)(a_j) in ker(psi_k)$.

    Therefore, by exactness component-wise, there exists $z_k in F(k)$, such that $phi_k (z_k)  = g_(i k)(a_i)-g_(j k)(a_j)$, hence one has the following:
    $ overline(a_i-a_j) = overline(g_(i k)(a_i)-g_(j k)(a_j)) = overline(phi_k (z_k)) = pi_G compose (plus.circle phi)(z_k) = overline(phi) compose pi_F (z_k) = overline(phi)(overline(z_k)) $
    This shows that if any two generators have difference in $ker(overline(psi))$, one can find it in $im(overline(phi))$, then in particular $ker(overline(psi)) subset.eq im(overline(phi))$, proving the exactness.

  Hence, we're done.
]

\ 

= Consequences of Exactness

Because additivity preserves direct sums and products, and exactness preserves kernels and cokernels, in particular it preserves every possible limit constructed out of all of these - This includes equalizers and fibre products (of course and their dual notions). Then, whenever one talks about stalks in Presheaf/Sheaf Theory over Abelian Groups, it automatically preserves any limit within the category of presheaves/sheaves.
