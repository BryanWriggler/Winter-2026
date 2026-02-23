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

Recall that for a directed system in $Ab$, one can take its direct limit. However, if fixing a direct system $I$, and consider the functor category $[I, Ab]$ (sometimes even stronger, $[I, CRing]$), it has a natural abelian category structure:

#proof[
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
               K(j) edge("hook->", script(ker(phi)_j)) & F(j) edge(->, script(phi_j)) & G(j)
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

  + #text(weight: "bold")[Equivalence of Monomorphism and Component-Wise Monomorphism:]

    (#text(weight: "bold")[Note:] The dual notion is epimorphism and component-wise epimorphism, where the proof follows similarly.)

    It's clear that if a morphism $phi:F->G$ is component-wise monomorphic, it must be a monomorphism in $[I,Ab]$ (just because the left cancellative property applies to each component will prove the equality globally).

    Now, suppose $phi:F -> G$ is a monomorphim in $[I,Ab]$ (i.e. given any two morphism $rho,mu:L -> F$, one has $phi compose rho=phi compose mu$ implies $rho=mu$), then we claim the kernel of each component is $0$ (which is equivalent to being monomorphic in $Ab$). Note that part 2 above helped us realize the kernel of the morphism as component-wise kernel. So, if consider the zero morphism $0:K -> F$ and the kernel morphism $ker(phi):K -> F$, notice that $phi compose 0 = phi compose ker(phi)$, which the left cancellative property implies $0 = ker(phi)$, or each component has $0= ker(phi)_i:K(i)->F(i)$, proving each $phi_i:F(i) -> G(i)$ is a monomorphism.

    \ 

  + #text(weight: "bold")[Equivalence of Monomorphism and Kernel:]

    (#text(weight: "bold")[Note:] The dual notion is epimorphism and cokernel, the proof also follows similarly).

    Since kernel of a morphism is a component-wise kernel (cf. part 2), and kernel is the same as monomorphism in $Ab$, then part 3 guarantees the kernel morphism in $[I,Ab]$ to be a monomorphism (as it's component-wise monomorphic).

    Conversely, given a monomorphism $phi:F arrow.hook G$, running through similar proof of part 2 guarantees it has a cokernel $coker(phi):G -> C$ (where it's taken as cokernel component-wise). Then, since for every component $phi_i:F(i)->G(i)$ is a kernel of $coker(phi)_i:G(i)->C(i)$ (in $Ab$, a monomorphism is a kernel of its own cokernel), hence globally $phi:F arrow.hook G$ is a kernel of $coker(phi):G->C$, proving that $phi$ is a kernel in $[I,Ab]$.

    \ 

  + #text(weight: "bold")[Existence of Finite Biproduct:]

    Given two direct systems $F,G in [I,Ab]$, for each index $i in I$, define the "biproduct" $(F plus.circle G)(i) := F(i) plus.circle G(i)$, which it naturally associates with projections $pi_(F,i):(F plus.circle G)(i) ->> F(i)$ and $pi_(G,i):(F plus.circle G)(i)->> G(i)$, also with inclusions $iota_(F,i):F(i) arrow.hook (F plus.circle G)(i)$ and $iota_(G,i):G(i) arrow.hook (F plus.circle G)(i)$.

    Now, we claim for every $i->j$ in $I$, there exists a natural morphism $h_(i j):(F plus.circle G)(i)-> (F plus.circle G)(j)$. Let's consider the following diagram:
    #set align(center)
    #diagram($
               F(i) edge("d", ->, script(f_(i j))) & (F plus.circle G)(i) edge("l",->>, script(pi_(F,i))) edge(->>, script(pi_(G,i))) edge("d", "..>", script(exists ! h_(i j))) & G(i) edge("d",->, script(g_(i j)), #left) \ 
               F(j) & (F plus.circle G)(j) edge("l",->>, script(pi_(F,j))) edge(->>, script(pi_(G,j))) & G(j)
             $)
    #set align(left)
    Where, the uniqueness of $h_(i j)$ is given by the two maps $f_(i j) compose pi_(F,i):(F plus.circle G)(i) -> F(j)$, $g_(i j) compose pi_(G,i):(F plus.circle G)(i)-> G(j)$, and the fact that $(F plus.circle G)(j)$ (with the two projections) is a product of $F(j),G(j)$ in $Ab$.

    Then, the association $F plus.circle G: I -> Ab$ by $i mapsto (F plus.circle G)(i)$, and $F plus.circle G(i->j) = h_(i j)$ is a functor by the universality of product.

    (Note: If using the inclusions as the proof, we'll still get the same morphism, as the biproduct property guarantees the $h_(i j)$ to agree, regardless if we use projections of inclusions to derive it). Also, the "projections" and "inclusions" component wise clearly form a naturality square, showing $pi_F:F plus.circle G-> F$ (resp. $pi_G$ for G) and $iota_F:F -> F plus.circle G$ (resp. $iota_G$ for $G$) are all morphisms in $[I,Ab]$.

    \ 

    Finally, we claim the universality of $F plus.circle G$ as a biproduct (which we'll prove the product part, as the coproduct part is with similar proof).
]