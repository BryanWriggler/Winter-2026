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
  title: "Hartshorne Chapter 2 Section 1: Sheaves",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline(title: "Table of Content:")

= Presheaves and Sheaves//1
#defn[Presheaves][
  Given a topological space $X$, let $Top(X)$ denotes the category of partial orders on open subsets of $X$, with morphisms being inclusions. 
  
  A presheaf $F$ of abelian groups on $X$ is a functor $F:Top(X)^op -> Ab$, where: 
  1. For any inclusion of open subsets $V arrow.hook U$, there exists a "restriction" group homomorphism $rho_(U V):F(U) -> F(V)$.
  2. The morphism satisfies $rho_(U U) = id_F(U)$, and given open subsets $W arrow.hook V arrow.hook U$, one has $rho_(U W) = rho_(V W) compose rho_(U V)$.

  Sometimes there is an extra restriction $F(emptyset)=0$
]
For convenience, given any $s in F(U)$,and say $V arrow.hook U$, $rho_(U V)(s)$ will be denoted as $s|_V$ (or $s$ restricted to $V$). And, the group $F(U)$ will be denoted by $Gamma(U, F)$.

\ 

#defn[Sheaves][
  Given a presheaf $F$ on a topological space, it's called a #emph[Sheaf] if it satisfies the following two aximos:
  1. #text(weight: "bold")[Separation Axiom:] Given $U$ an open set, with an open cover ${U_i}$, if $s in F(U)$ satisfies $s|_(U_i) = 0$ for all index $i$, then $s=0$.
  2. #text(weight: "bold")[Gluing Axioms:] If $U$ is an open set, with an open cover ${U_i}$. If each index $i$ has an associated $s_i in F(U_i)$, such that every index pair $i,j$ satisfies $s_i|_(U_i sect U_j)=s_j|_(U_i sect U_j)$, then there exists an $s in F(U)$, such that $s|_(U_i)=s_i$ for alll index $i$.
]
Which, the Separation Axiom guarantees the uniqueness of the gluing in the Gluing Axiom: Suppose $s,s' in F(U)$ are both gluings of ${s_i in U_i}$, then one has $s|_(U_i)=s'|_(U_i) = s_i$. Using the group homomorphism property, $0 = s_i -s_i = s|_(U_i)-s'|_(U_i) = (s-s')|_(U_i)$ for all index $i$, hence separation axiom guarantees $s-s'=0$, or $s=s'$ using the Abelian Group Property.

\ 

If given these two axioms, one must have $F(emptyset)= 0$: Given any two elements $s,s' in F(emptyset)$ notice that they agree on $emptyset sect emptyset = emptyset$, so there must exists $s'' in F(emptyset)$, such that $s''|_emptyset = s' = s''$, showing there must be only one element, namely $0$. So, the condition that $F(emptyset) = 0$ technically can be omitted from the presheaf definition.

\ 

#example[Classical Sheaves][
  Given a topological space $X$, smooth real manifold $M$, and complex manifold $H$. Let $U:Top(X)^op -> Ab$ denotes $U(V)$ as all continuous functions $V-> RR$, let $C^infinity:Top(M)^op -> Ab$ denotes $C^infinity (V)$ as all smooth functions $V-> RR$, and $Holo:Top(H)^op -> CC$ be all the holomorphic functions $H -> CC$. Also, the restriction map is the classical restriction of domains.

  Then, by the gluing lemma, all of these satisfied gluing conditions; and, if a function is locally $0$ every, it's $0$ globally (on a given open subset). Hence, these are sheaves.
]
#example[Regular Functions on Varieties][
  Given $X$ a variety over a field $k=overline(k)$, let $Holo:Top(X)^op -> Ab$ satisfies $Holo(U)$ being a collection of regular functions $U-> k$, together with restrictions being the restriction of domains. 

  It's a sheaf, because a function who's locally $0$ everywhere is $0$ globally (on an open set); also, if the regular functions on open subsets agree on their overlap, then they glue o a regular function.
]

\ 

#example[Constant Presheaves \& Sheaves][
  Fix $A in Ab$ a nonzero abelian group. The #text(weight: "bold")[Constant Presheaf] $cat(A):Top(X)^op -> Ab$ on $X$ satisfies $cat(A)(U) = A$ for all open subset $U subset.eq X$, and all inclusions are mapped to identity.

  This is a presheaf (since identity vacuously composed to identity), but not a sheaf, since it no longer has the property $F(emptyset)=0$.

  \ 

  As a modification, given $A$ a discrete topology, and let $cal(A):Top(X)^op -> Ab$ be a presheaf of $X$, such that $cal(A)(U) = Hom_Top (U,A)$, where open subset $U subset.eq X$ induces the subspace topology, while $A$ maintains the discrete topology. Also, the restriction maps are by restriction of domains.

  This is well-defined, as given $A$ discrete topology, its addition $A times A-> A$ is clearly continuous, which induces a pointwise addition structure on $Hom_Top (U,A)$ by $(f+g)(a) = f(a)+g(a)$ (a continuous map by composing $(f,g):U -> A times A$ and $+:A times A->A$).

  Also, since each set are continuous maps, then the gluing axioms (together with uniqueness) both are satisfied here, hence it's a sheaf.

  Finally, the reason it's called "constant sheaf", is by the fact that if $U$ is connected, then $Hom_Top (U,A) tilde.equiv A$ (since all $a in A$ defines a connected component, so alll continuous function must be constant since it sends $U$ connected to a connected subset, which can only be singleton). So, given any $V$ with $c$ being its collection of connected component, one has $Hom_Top (V, A) tilde.equiv V^(times c)$, the direct product with a copy for each connected component of $V$.
]

#pagebreak()

= Stalks and Direct Limits of Presheaves

As a review, let's talk about direct limits:
#defn[Direct System][
  Given $(I, <=)$ a preordered set, it satisfies:
  1. #text(weight:"bold")[Reflexivity:] $a<=a$ for all $a$
  2. #text(weight:"bold")[Transitivity:] $a<=b$ and $b<=c$ implies $a<=c$
  
  Yet, it doesn't require antisymmetry, so $a<=b$ and $b<=a$ doesn't imply $a=b$; preorder is different from partial order because the lack of antisymmetry). 

  \ 

  Now, $(I, <=)$ is called a #emph[Direct System], if any finite set has an upper bound. Equivalently, given any $i,j in I$, there exists $k in I$ satisfying $i, j<= k$. 

  Note that it forms a category due to Reflexivity.
]

\ 

#defn[Direct System in Category][
  A direct system in a category $cat(C)$, is given by a direct system $(I,<=)$ and a functor $F:I -> cat(C)$. 
  
  Hence, for any $i<=j$, it corresponds to a morphism $f_(i j):F(i)->F(j)$.
  
  Given $i<=j$ and $j<=k$, one has $i<=k$, where they correspond to morphisms $f_(i j):F(i)->F(j)$, $f_(j k):F(j)->F(k)$, and $f_(i k):F(i)->F(k)$. Which, transitivity states $f_(i k)=f_(j k) compose f_(i j)$.

  And, given any $i,j in I$, there exists $k$, such that $i,j <=k$ translates to the existence of morphisms $f_(i k):F(i)-> F(k)$ and $f_(j k):F(j)-> F(k)$ for some $k in I$.
]

\ 

#defn[Direct Limit in Category][
  Given a category $cat(C)$ with a direct system $F:I -> cat(C)$, a #emph[Direct Limit], denoted as $lim_(->\ i in I)F$, is formally defined as $colim F$.
]

As an example, let's take $Ab$, a category where all limits / colimits exist:
#example[Direct Limit in $Ab$][
  Let $I$ be a direct system, a direct system in $Ab$ based on $I$, is a collection of abelian groups ${A_i}_(i in I)$, where $i<=j$ corresponds to a group homomorphism $f_(i j):A_i -> A_j$, and any $i,j$ has a corresponding $k in I$, where there exists group homomorphisms $f_(i k), f_(j k)$.

  \ 

  Then, the direct limit is the group $A := plus.circle.big_(i in I)A_i \/ tilde$, where $tilde$ is the relation satisfying $a_i tilde a_j$ for $a_i in A_i$ and $a_j in A_j$, if there exists $k in I$ with $f_(i k), f_(j k)$ being well-defined, such that $f_(i k)(a_i) = f_(j k)(a_j)$.

  This is an equivalence relation, hence form a well-defined subgroup:
  1. All $f_(i i)(a_i)=f_(i i)(a_i)$, showing any $a_i in A_i$ satisfies $a_i tilde a_i$, proving reflexivity.
  2. If $a_i tilde a_j$, there exists $k in I$ with $f_(i k)(a_i)=f_(j k)(a_j)$, reversing the equality provides $a_j tilde a_i$.
  3. If $a_i tilde a_j$ and $a_j tilde a_k$, there exists $l_1, l_2 in I$, where $f_(i l_1)(a_i) = f_(j l_1)(a_j)$, and $f_(j l_2)(a_j) = f_(k l_2)(a_k)$. Now, find an upper bound of $l_1, l_2$, say $r in I$. Then, one has the following:
    $ f_(i r)(a_i) = f_(l_1 r)compose f_(i l_1)(a_i) = f_(l_1 r) compose f_(j l_1)(a_j) = f_(j r)(a_j)= f_(l_2 r) compose f_(j l_2)(a_j) = f_(l_2 r)compose f_(k l_2)(a_k) = f_(k r)(a_k) $ 
    So, $a_i tilde a_k$, prove the transitivity.

  Finally, the map $A_i -> A$ is defined by the composition of inclusion $A_i arrow.hook plus.circle.big_(i in I)A_i$ and projection $plus.circle.big_(i in I)A_i ->> A$.

  \ 

  To show it's indeed a colimit of the given functor, suppose $B$ is another abelian group with group homomorphisms $g_i:A_i -> B$ that forms a cocone of the given functor. Which, given any $f_(i j):A_i -> A_j$, one has $(g_i:A_i -> B) = (g_j compose f_(i j):A_i -> A_j -> B)$. 
  
  Then, for any element $a_i in A_i$ and $a_j in A_j$, such that $a_i tilde a_j$ under our equivalence relation, then there exists $k in I$, such that $f_(i k)(a_i) = f_(j k)(a_j)$. As a result, one has the following:
  $ g_i (a_i) = g_k compose f_(i k)(a_i) = g_k compose f_(j k)(a_j) = g_j (a_j)  $
  So, they have the same image in $B$.

  Then, if gather the map into a coproduct map $g:plus.circle.big_(i in I)A_i -> B$ (where each $iota_i:A_i arrow.hook plus.circle.big_(i in I)A_i$ has $g compose iota_i = g_i$), then any $a_i$, $a_j$ has the same image under $g$, which naturally has $a_i - a_j in ker(g)$. Hence, the equivalence relation is contained in $ker(g)$, where the map naturally factors through $A = plus.circle.big_(i in I)A_i \/ tilde$, say $overline(g):A -> B$. And, this $overline(g)$ is unique based on the kernel and coproduct property.

  So, $A$ is the desired direct limit. 
]

For sheaf theory, the use of direct limit in commutative rings will also be essential:
#example[Direct Limit in $CRing$][
  $CRing$ is a natural subcategory of $Ab$, which for any direct system in $CRing$ (with ring homomorphisms), it can also be realized as a direct system in $Ab$ (with ring homomorphisms, while only recognize the addition structure).

  Hence, say ${A_i}_(i in I)$ is a directed system in $CRing$, any $i<=j$ in $I$ has a canonical ring homomorphism $f_(i j):A_i -> A_j$. Then, we know $A:= plus.circle.big_(i in I)A_i \/ J$, where $J$ is the subgroup generated by all relations $a_i tilde a_j$, if there exists $k>=i,j$, such that $f_(i k)(a_i)=f_(j k)(a_j)$.

  \ 

  Now, the goal is to claim a ring structure on $A$: Which, we define any $overline(a_i), overline(a_j) in A$ to have multiplication $overline(a_i) dot overline(a_j) := overline(f_(i k)(a_i)dot f_(j k)(a_j))$, where $k>=i,j$ in the preorder $I$.

  - First, this is well-defined. If given any $a_i' tilde a_i$, and $a_j' tilde a_j$, and say $k'>= i',j'$ in $I$ (so $f_(i' k')(a_i') dot f_(j' k')(a_j')$ makes sense). Then, take common upper bound for $k,k'$ (denote as $l in I$), which $l>=i,i',j,j'$. So, we have the following:
    $ f_(k l)(f_(i k)(a_i) dot f_(j k)(a_j)) &= (f_(k l) compose f_(i k)(a_i)) dot (f_(k l) compose f_(j k)(a_j))\ 
  &= f_(i l)(a_i) dot f_(j l)(a_j)\ 
  &= f_(i' l)(a_(i'))dot f_(j' l)(a_j')\ 
  &= (f_(k' l) compose f_(i' k')(a_i')) dot (f_(k' l) compose f_(j' k')(a_j'))\ 
  &= f_(k' l)(f_(i' k')(a_i') dot f_(j' k')(a_j')) $
    This proves that $f_(i k)(a_i) dot f_(j k)(a_j) tilde f_(i' k')(a_i') dot f_(j' k')(a_j')$, so their quotient in $A$ are the same, which is well-defined.

    \ 

  - Associativity, commutativity, and distributivity all comes from the property of each $A_i$ as a commutative ring, so $A$ under this definition is a commutative ring.

    \ 

  - Finally, to verify that the unique map factored through direct limit is also a ring homomorphism, suppose $B$ is a commutative ring, together with ring homomorphisms $g_i: A_i -> B$ that forms a cocone. By the property of direct limit in $Ab$, there exists a unique group homomorphism $g:A->B$, such that each $g_i = g compose iota_i$, where $iota_i:A_i -> A$ is the natural "inclusion" (i.e. include to direct sum, then take the quotient).

    Yet, for any generator $overline(a_i), overline(a_j) in A$ (say $i,j in I$), say $overline(a_i) dot overline(a_j) = overline(f_(i k)(a_i) dot f_(j k)(a_j))$ for some $k>=i, j$. Then, one has the following:
    $ g(overline(a_i) dot overline(a_j)) &= g(overline(f_(i k)(a_i) dot f_(j k)(a_j)))\ 
    &= g compose iota_k (f_(i k)(a_i) dot f_(j k)(a_j))\ 
    &= g_k (f_(i k)(a_i) dot f_(j k)(a_j))\ 
    &= (g_k compose f_(i k)(a_i)) dot (g_k compose f_(j k)(a_j))\ 
    &= g_i (a_i) dot g_j (a_j)\ 
    &= g(overline(a_i)) dot g(overline(a_j)) $
    So, this shows that $g$ is preserving multiplication, hence a ring homomorphism.

  \ 

  Therefore, Direct limit also exists in $CRing$.
]

\ 

Now, given a presheaf $F in PreSh(X)$, to collect its local information at a point, notice that the collection of open subsets $O(X)$ with inclusion forms a partial order, moreover any two element has a lower bound / upper bound: Given $U,V in O(X)$, then $U union V$ is an upper bound, while $U sect V$ is a lower bound. So, $O(X)$ with inclusion forms not only a partial order, but also a #emph[Preorder]. 

Moreover, notice that for any $P in X$, the subcollection $O(X)_P$ (all open subset $U in.rev P$) also forms a preorder, such that all lower bound is nonempty (since the intersection always contains $P$). Which, it gives rise to the local information:
#defn[Stalk][
  Let $F in Sh(X)$ be a sheaf of abelian groups (which, as a functor $F:O(X)^op -> Ab$, which the lower bound of $O(X)$ becomes an upper bound of $O(X)^op$). Given any point $P in X$. The #text(weight: "bold")[Stalk] of $F$ at point $P$, is the following:
  $ F_P := colim_(O(X)_P^op)(F) $
  More in detail, consider the sub-preorder $O(X)_P$, and restrict the sheaf to $F|_(O(X)_P^op)$, and $F_P$ is the colimit of this functor.
]

\ 

In a more concrete sense, it "classifies" the restriction of elements up to the similarity in a common open subset around $P$. If the topological space is $K=RR$ or $CC$, and the sheaf is the sheaf of smooth / analytic functions, then the classical restrictions have the stalk at a point being all functions, up to an equivalence relation of $f tilde g$ iff there exists $U,V subset.eq K$ open subsets, such that $P in U sect V$, and $f|_(U sect V)=g|_(U sect V)$ (for convenience, we'll just state there exists an open neighborhood of $P$, where the two elements agree).

\ 

For any two presheaves $F,G in PreSh(X)$, let $mu:F->G$ be a natural transformation (which is a morphism in $PreSh(X)$), it induces a morphism $mu_P: F_P -> G_P$ for any point $P in X$ (since $mu_P$ preserves the equivalence relation for direct limit). Notice that if $mu$ is a natural isomorphism, then it's also isomorphic on each stalks (simply because each summand in the direct limit is isomorphic, and the equivalence relation is preserved).

But, the question is: How far does its converse hold? If we know isomorphisms on stalks, what can we say about sheaves?

In general, being isomorphic on stalks for presheaves don't imply it's isomorphic as presheaves. Yet, this is true for sheaves:

#pagebreak()

#thm[
  Given sheaves $F,G in Sh(X)$, together with morphism of sheaves $phi:F -> G$. Then, $phi$ is an isomorphism iff the induced map on the stalk $phi_P:F_P -> G_P$ is an isomorphism for every $P in X$.
][
  $==>:$ 
  
  This part is clear (and is also true for presheaves).

  \ 

  $<==:$

  Suppose $phi_P:F_P -> G_P$ is an isomorphism for every $P in X$, the goal is to prove that $phi(U):F(U) -> G(U)$ is an isomorphism for all open subset $U subset.eq X$.

  \ 

  First, we'll prove injectivity: Suppose $s in F(U)$ satisfies $phi(U)(s) = 0$ (i.e. in the kernel of $phi(U)$), then notice that for any point $P in U$, the following commutative diagram commutes:
  #set align(center)
  #diagram($
             F(U) edge(->, script(phi(U))) edge("d", ->, script(iota_(F(U))), #right) & G(U) edge("d",->,script(iota_(G(U))))\ 
             F_P edge(->, script(phi_P), #right) & G_P
           $)
  #set align(left)
  So, take the representative $langle s, U rangle in F_P$, one has the following:
  $ phi_P (langle s,U rangle) = phi_P compose iota_(F(U))(s) = iota_(G(U)) compose phi(U)(s) = iota_(G(U))(0) = 0 $
  Hence, by injectivity of $phi_P$, one has $langle s,U rangle = 0$, i.e. there exists an open neighborhood $P in V_P subset.eq U$, such that $s|_(V_P) = 0|_(V_P)$. Then, because the ${V_P}_(P in U)$ forms an open cover of $U$, such that $s|_(V_P) = 0$ for all $P in U$, based on the separation axiom of sheaves, $s = 0$, proving the injectivity.

  \ 

  Then, to prove surjectivity, pick any $t in G(U)$, and for any $P in U$, consider its image $iota_(G(U))(t) = langle t,U rangle in G_P$. Since $phi_P$ is an isomorphism, we know there exists a unique $langle s_P, V_P rangle in F_P$, such that $phi_P (langle s_P,V_P rangle) = langle t, U rangle$. 
  
  WLOG, since one can intersect $V_P$, the domain of $s_P$, with $U$ and still not change the image of $s_P$ in the stalk, one can assume each $V_P subset.eq U$; moreover, one can also claim that $phi(V_P)(s_P) in G(V_P)$ satisfies $phi(V_P)(s_P) = t|_(V_P)$ based on this). Hence, one can assume ${V_P}_(P in U)$ forms an open cover in $U$.

  Now, consider each $s_P in F(V_P)$ for all $P in U$, we claim that they glue together: Suppose $V_P, V_(P')$ are two open subsets such that $V_P sect V_(P') != emptyset$. Which, the previous claim says that $t, phi(V_P)(s_P)$ agrees on $V_P$, and $t,phi(V_P')(s_P')$ agrees on $V_P'$.

  However, remember that the injectivity claim of $phi(U)$ holds FOR ALL open subset $U subset.eq X$, in particular it holds for $V_P sect V_P'$. Then, since $phi(V_P)(s_P)$ and $phi(V_P')(s_P')$ restricting to $V_P sect V_P'$ must agree with $t|_(V_P sect V_P')$, one has $phi(V_P sect V_P')(s_P|_(V_P sect V_P')) = phi(V_P sect V_P')(s_(P')|_(V_P sect V_(P')))$, then by injectivity $s_P|_(V_P sect V_P') = s_P'|_(V_P sect V_P')$.

  This shows that all $s_P in F(V_P)$ agrees on the intersection of $V_P$'s, hence the gluing axiom of sheaves guarantees that there exists a $s in F(U)$, such that $s_|(V_P) = s_P$ for all $P in U$. As a result, one must have $phi(U)(s) = t$, as the restriction to any of the $V_P$'s they agree. This finishes the surjectivity.
]

\ 

For me personally, this theorem is pretty astonishing results, as knowing local information restricts the whole sheaf.

#pagebreak()

= Abelian Category Structure of $Sh(X)$

Since the category of presheaves $PreSh(X) = [O(X)^op, Ab]$ (as functor categories), then it naturally inherits all abelian category structur of $Ab$ (a result in homological algebra). In particular, the kernels and cokernels of the maps are defined by taking the kernels and cokernels of each individual piece in the natural transformation (and, one can construct $im := ker(coker)$, and $coim := coker(ker)$ for each morphism of presheaves).

To construct similar concepts in $Sh(X)$, one do need to make extra observations though (in particular, problems arise for cokernel). Regardless, let's start with kernels in sheaf:
#prop[
  Given sheaves $F,G in Sh(X)$, and morphism $phi in Hom_(Sh(X))(F,G) = Hom_(PreSh(X))(F,G)$, one has $ker(phi)$ (as a kernel in $PreSh(X)$) also be a kernel in $Sh(X)$.
][
  First, let's fix the notation: Define $K in PreSh(X)$ by $K(U) = ker(phi(U))$ for all open subset $U subset.eq X$ (where $phi(U):F(U) -> G(U)$ is a morphism of abelian groups). Which, the defined $ker(phi)(U):K(U) arrow.hook F(U)$ as the canonical inclusion. (Note: the restriction map of $K$ can be directly inherited from $F$, as we chose specifically that $K(U)$ as a subgroup of $F(U)$).

  \ 

  Notice that $ker(phi)$ clearly satisfies the desired property as a kernel in $PreSh(X)$. To check that it's the right kernel in $Sh(X)$, it suffices to prove that $K in Sh(X)$ (since $Sh(X)$ is a full subcategory of $PreSh(X)$, so $K in Sh(X)$ automatically promotes $ker(phi)$ to a kernel in sheaves also). Let's check the two essential axioms:
  1. Given any open subset $U subset.eq X$ together with open cover ${V_i}_(i in I)$ in $U$, suppose $s in K(U)$ satisfies $s|_(V_i)=0$ for all $i in I$, then notice that such statement also holds in $F$, which the separation axiom on $F$ enforces $s=0$. This checks out separation property for $K$.

  \ 

  2. Given open subset $U subset.eq X$ and an open cover ${V_i}_(i in I)$ in $U$, suppose given any elements $s_i in K(V_i)$ that satisfies $s_i|_(V_i sect V_j)=s_j|_(V_i sect V_j)$ for any index $i,j in I$, then notice that when including $K(V_i) arrow.hook F(V_i)$, the gluing axiom on $F$ guarantees a unique global section $s in F(U)$, such that $s|_(V_i) = s_i$ for any index $i in I$. 
    
    Then, to check that $s in K(U)$, notice one has the following:
    $ phi(U)(s)|_(V_i) = phi(V_i)(s|_(V_i)) = phi(V_i)(s_i) = 0 $
    So, since $phi(U)(s)$ restricts to $0$ on any $V_i$, the separation axiom on $G$ guarantees that $phi(U)(s)=0$, or $s in ker(phi(U))= K(U)$. THis shows the gluing property for $K$.

    \ 

  With the two axioms being satisfied, $K in Sh(X)$, and finishes the existence of kernel in $Sh(X)$.
]

As a corollary, one has the following:
#corollary[
  The forgetful functor $"For":Sh(X) -> PreSh(X)$ is left exact, since it preserves kernel.
][]

\ 

Now, to consider the case for cokernels, unfortunately the cokernels for morphisms between sheaves (in presheaves) need not be a sheaf. Here's an example from complex analysis:
#ex[Cokernel for Sheaf of analytic functions][
  Take $CC$ with Euclidean topology, take $F=Holo:O(CC)^op -> Ab$ by $Holo(U) := $ all analytic functions $U -> CC$ (with point wise addition as group operation), and $G = Holo^times: O(CC)^op -> Ab$ by $Holo^times (U) := $ all invertible analytic function on $U$ (with point wise multiplication as group operation). Consider the exponential map $exp: F-> G$ by $exp(U)(f):= exp(f)$ for any $f in F(U) = Holo(U)$, which $exp(f) in G(U) = Holo^times (U)$ is clear, and it's also a group homomorphism by exponential property. Take $coker(phi)$ by $coker(phi)(U):G(U) -> C(U)$ (where $C(U)$ is the cokernel of $phi(U)$ set wise).

  \ 

  Now, consider the open subset $U = CC\\{0}$, and consider the function $f(z)=z$ in $G(U)$. Notice that $f in.not im(exp(U))$ (since $U$ is not simply-connected while omitting $0$, so there's no well-defined log function for $z$ on $U$, so there doesn't have a function $h in Holo(U)$, such that $exp(h)=f$; in other words one has $overline(f) != 0$ in $coker(phi(U))$.

  However, if consider the two open subset $U_1 = CC\\[0,infinity)$ and $U_2 = CC\\(-infinity,0]$, notice that $f in G(U_1),G(U_2)$ are both in the image of $phi(U_1),phi(U_2)$ respectively (as these two open subsets are simply-connected while not containing $0$, so log functions can be defined; hence, one can define $h_1 in Holo(U_1), h_2 in Holo(U_2)$, such that $exp(h_1)=f$ and $exp(h_2)=f$). As a result, $overline(f) = 0$ in $coker(phi(U_1)), coker(phi(U_2))$.

  \ 

  Then, because $U = U_1 union U_2$, with the commutative diagram of presheaf's restriction, one has $overline(f)|_(U_1) = 0$ and $overline(f)|_(U_2)=0$ based on the above construction. Yet, this cannot be the case if $coker(phi)$ is a sheaf (as restriction to be $0$ on an open cover should imply $overline(f)$ itself is $0$, by separation axiom).

  This shows that $coker(phi)$ is not a morphism of sheaves (as the chosen cokernel $C$ CANNOT be a sheaf).
]

\ 

So, to fix this problem, one needs a modification for cokernel. Let's introduce a tool for such construction:
#theorem("Sheafification Functor")[
  Given the forgetful functor $"For":Sh(X) -> PreSh(X)$, it has a left adjoint, called #text(weight: "bold")[Sheafification Functor], denoted as $(\_)^Sh:PreSh(X) -> Sh(X)$.

  \ 

  More concretely, for any presheaf $F in PreSh(X)$ and sheaf $G in Sh(X)$, the two sets are canonically isomorphic:
  $ Hom_(Sh(X))(F^Sh, G) tilde.equiv Hom_(PreSh(X))(F, G) $
  In particular, $F^Sh$ is equipped with a canonical morphism of presheaves $phi: F -> F^(Sh)$, so that given any morphism of presheaf $mu:F -> G$, there exists a unique morphism of sheaf $overline(mu):F^Sh -> G$, with the following universal property of diagrams:
  #set align(center)
  #diagram($
             F edge("rr", ->, script(phi)) edge("rd", ->, script(forall mu), #right) && F^Sh edge("dl", "..>", script(exists ! overline(mu)), #left)\
             & G
           $)
  #set align(left)
  (i.e. in the category of morphisms from $F$ to a sheaf, $F^Sh$ is initial).
][
  Here's a construction of the sheaf $F^Sh$:

  \ 

  Let $U subset.eq X$ be open. Define $F^Sh (U):= {"functions " s:U -> union.sq.big_(x in U)F_x}$, such that:
  1. for any $x in U$, $s(x) in F_x$.
  2. For any $x in U$, there exists a neighborhood $x in V subset.eq U$ and $t in F(V)$, such that $s(y) = langle t,V rangle in F_y$, for all $y in V$ (in the future, this is denoted as $t_y$).

  Here, we define the restriction on $F^Sh$ as the restriction of functions, and the morphism $phi:F -> F^Sh$ satisfies $phi(U):F(U) -> F^Sh(U)$ by $phi(U)(s):U -> union.sq.big_(x in U)F_x$ with $x mapsto s_x in F_x$ for all $s in F(U)$.

  \ 

  #text(weight: "bold")[I. The defined functor $F^Sh$ is a sheaf of abelian group on X:]

  The part that it's a presheaf of abelian group is fine, as the point wise addition in $F^Sh(U)$ makes sense (because any $s,t in F^Sh(U)$ has $s(x),t(x) in F_x$, so $(s+t)(x):= s(x)+t(x)$ is well-defined and associative; the existence of identity is by $z(x)=0 in F_x$ for all $x in U$, and $(-s)(x):= - s(x)$. For $z$, the chosen condition can be $V=U$, and $t=0 in F(U)$; on the other hand, for $(-s)$, one can choose $V subset.eq U$ fixed for $s$, and $-t in F(V)$ for $t in F(V)$ chosen for $s$).

  \ 

  To verify that it's a sheaf, consider the following two proof:
  - Given open subset $U subset.eq X$ with open cover ${V_i}$, suppose $s in F^Sh (U)$ satisfies $s|_(V_i) = z: V_i -> union.sq.big_(x in V_i)F_x$ (the "zero" function in $F^Sh (V_i)$), then notice that for all $x in U$, choose an index $i$ such that $x in V_i$, one has $s(x) = s|_(V_i)(x) = 0$ (the definition of canonical restriction of domain). Hence, $s=z$ in $F^Sh (U)$, verifying the separation axiom.

  \ 

  - Again, given open subset $U subset.eq X$ with open cover ${V_i}$, suppose $s_i in F^Sh (V_i)$ all agrees on all finite intersection, then it's clear they "glue" to a set function $s:U -> union.sq.big_(x in U)F_x$, such that $s|_(V_i)=s_i$ by definition. Notice that this $s$ automatically satisfies the condition $s(x) in F_x$ for all $x in U$ (since $s|_(V_i)(x) = s_i (x) in F_x$ if $x in V_i$); on the other hand, for the second condition, if $x in V_i$, choose the corrsponding $x in V'_i subset.eq V_i$, and $t in F(V'_i)$, such that $s_i(y) = t_y in F_y$ for all $y in V'_i$. Then, it satisfies $s(y) = s_i (y) = t_y in F_y$ for all $y in V'_i$, when view $x in V'_i subset.eq U$ as the open neighborhood.

  \ 

  So, the sheaf condition is satisfied, $F^Sh in Sh(X)$.

  \ 

  \ 

  #text(weight: "bold")[II. The Morphism $phi$ is a Natural Transformation in $PreSh(X)$:]

  It suffices to verify the group homomorphism property, and the following diagram is true for all inclusion of open subsets $V subset.eq U$:
  #set align(center)
  #diagram($
             F(U) edge(->,script(phi(U))) edge("d", ->, script(rho_(U V)), #right) & F^Sh (U) edge("d",->, script(rho_(U V)), #left)\ 
             F(V) edge(->, script(phi(V)),#right) & F^Sh (V)
           $)
  #set align(left)
  Given any $s in F(U)$, notice that for any $x in V subset.eq U$, one has $s_x = (s|_(V))_x in F_x$ (because they agree on $V$). As a result, $phi(U)(s), phi(V)(s|_V)$ satisfies the following:
  $ forall x in V, quad &phi(U)(s)(x):U -> union.sq.big_(y in U)F_y, quad phi(U)(s)(x)(y) = s_y in F_y\
  &phi(V)(s)(x):V -> union.sq.big_(y in V)F_y, quad phi(V)(s)(x)(y) = s_y in F_y $
  This shows that $phi(U)(s)|_V = phi(V)(s)$, so the above commutative diagram does commute, which $phi$ is a natural transformation (as functors over set).

  \ 

  For the group homomorphism property, one has any $s,t in F(U)$ satisfies $phi(U)(s+t)(x)(y)= (s+t)_y = s_y + t_y = phi(U)(s)(x)(y)+phi(U)(t)(x)(y)$, for any $x,y in U$, which $phi(U)(s+t) = phi(U)(s)+phi(U)(t)$, showing it's indeed a group homomorphism. So, $phi$ is also a natural transformation in $Ab$, proving $phi$ is a desired morphism of presheaves.

  \ 

  \ 

  #text(weight: "bold")[III. Universal Property:]

  To verify the universal property, suppose $mu: F -> G$ is a morphism of presheaves, we'll prove several lemmas (used in Krishna's class):

  #lemma("1")[
    For any $x in X$, the induced morphism on stalks $overline(phi)_x:F_x -> F^Sh _x$ is an isomorphism.
  ][
    #text(weight: "bold")[Injectivity:]

    This suffices to prove that $phi$ is injective in all open neighborhoods (since if $s in F_x$ has $overline(phi)_x (s)=0$, then there exists open neighborhood $U in.rev x$, such that $s in F(U)$ equals to $0$ based on injectivity on each open neighborhood).

    Suppose $s_x in F_x$ satisfies $overline(phi)_x (s_x)=0$ in $F^Sh_x$, then notice that pick some representative $s in F(U)$ of $s_x$, it satisfies that $phi(U)(s)$ is a representative of $overline(phi)_x (s_x)=0$. Hence, there exists an open neighborhood $x in V subset.eq U$, such that $phi(U)(s)|_V = 0$, or $phi(V)(s|_V)=0$. As a result, one has all $y in V$ satisfies $y mapsto 0$ via $phi(V)(s|_V)$, in particular $x in V$ satisfies $x mapsto s_x = 0$. So, $overline(phi)$ is injective.

    \ 

    #text(weight: "bold")[Surjectivity:]

    Given any $s_x in F^Sh_x$, there exists an open neighborhood $x in U subset.eq X$, with representative $s in F^Sh (U)$. Notice that condition 2 of sheafification guarantees the existence of an open neighborhood $x in V subset.eq U$, and some $t in F(V)$, such that $s(y)= t_y$ for all $y in V$. Then, if consider $phi(V)(t)$ (with $y mapsto t_y$ for all $y in V$), notice that the behavior is identical to $s$ on $V$, so $phi(V)(t) = s|_V$. Hence, if consider the image in stalk, one has $s_x = phi(V)(t)_x$, where $phi(V)(t)_x = overline(phi)_x (t_x)$ by the following commutative diagram:
    #set align(center)
    #diagram($
               F(V) edge(->, script(phi(V))) edge("d", ->, script(iota_V)) & F^Sh (V) edge("d", ->, script(iota_V))\ 
               F_x edge(->, script(overline(phi)_x), #right) & F^Sh_x
             $)
    #set align(left)
    This verifies the surjectivity of $overline(phi)_x$.
  ]

  \ 

  #lemma("2")[
    Let $F,G in PreSh(X)$ be a sheaf, and $theta:F -> G$ be a morphism of presheaves, there is a corresponding morphism of sheaves $theta^Sh:F^Sh -> G^Sh$, that satisfies the following commutative diagram:
    #set align(center)
    #diagram($
               F edge(->,script(phi_F)) edge("d",->, script(theta)) & F^Sh edge("d",->, script(theta^Sh), #left)\ 
               G edge(->, script(phi_G), #right) & G^Sh
             $)
    #set align(left)
    In particular, $(\_)^Sh:PreSh(X) -> Sh(X)$ is a functor.
  ][
    Given any open subset $U subset.eq X$, one knows there exists morphism $theta(U):F(U) -> G(U)$, and it descends to the morphism on stalks $theta_x:F_x -> G_x$ for all $x in U$.

    Which, notice that they gathered into the following set map:
    $ union.sq theta_x:union.sq.big_(x in U)F_x -> union.sq.big_(x in U)G_x $
    Which, for any $s in U$, define $theta^Sh (s) := (union.sq theta_x) compose s in G^Sh (U)$ 
    
    (Note: $theta^Sh (s)$ is well-defined, as it maps $theta^Sh(s)(x) = union.sq theta_y (s(x)) in G_x$ due to the fact that $s(x) in F_x$; on the other hand, for any $x in U$, pick the open neighborhood $x in V subset.eq U$ and $t in F(V)$ such that $s(y) = t_y$ for all $y in V$, then the morphism guarantees that $(union.sq theta_x) compose s(y) = union.sq theta_x (t_y) = theta_y (t_y)$, where $theta_y$ can be descended from $theta(V):F(V) -> G(V)$, so $theta_y (t_y) = theta(V)(t)_y$, which agrees for the element $theta(U)(t) in G(V)$).

    Hence, one concludes that the morphism $s mapsto union.sq theta_x compose s in G^Sh (U)$ is well-defined, and is a group homomorphism.

    \ 

    Finally, the diagram commutes, simply because any $s in F(U)$ (with $theta(U)(s) in G(U)$) satisfies $union.sq theta_x compose phi_F (s)(y) = union.sq theta_x (s_y) = theta_y (s_y) = theta(U)(s)_y = phi_G (theta(U)(s))(y)$. So, $union.sq theta_x compose phi_F = phi_G compose theta(U)$, showing the desired commutativity.

    \ 

    (Note: If $theta=id: F->F$ is chosen, since $union.sq theta_x$ is identity on each stalk, the composition is trivial, so $id^Sh = id$ of $F^Sh$, showing the funcoriality).
  ]

  \ 

  #lemma("3")[
    Given any $G in PreSh(X)$, then $phi:G -> G^Sh$ is an isomorphism $<==>$ $G$ is a sheaf.
  ][
    $<==:$

    If $G$ is a sheaf, then since $overline(phi)_x:G_x -> G^Sh_x$ is an isomorphism for all $x in X$, the isomorphism on stalks of sheaves guarantees $G tilde.equiv G^Sh$.

    \ 

    $==>:$ Suppose $G tilde.equiv G^Sh$, then $G$ is a sheaf, since $G^Sh$ is.
  ]

  Which, combining these results, given $F in PreSh(X)$ and $G in Sh(X)$, together with a morphism of presheaves $theta: F -> G$, notice that the following diagram commutes:
  #set align(center)
  #diagram($
             F edge(->, script(phi_F)) edge("d",->, theta) & F^Sh edge("d",->, script(theta^Sh))\ 
             G edge(->, script(phi_G), #right) & G^Sh
           $)
  #set align(left)
  Where the bottom part is an isomorphism, so one can interpret $G = G^Sh$ if desired. Which, the uniqueness of $theta^Sh$ is guaranteed by the fact that it must preserve all the induced morphism on stalks $F_x -> G_x$, and the universality of disjoint union sets in $Sets$ guarantees the uniqueness of $union.sq theta_x$ (the composition map). This shows the universality.
]

\ 

Which, with the "best approximation sheaf" of a presheaf, one can define a cokernel:
#definition[Cokernel in $Sh(X)$][
  Given sheaves $F,G in Sh(X)$ and morphism of sheaves $f:F -> G$, define $Cok(f):= (C(f))^Sh$, where $C(f)$ is the image of $coker(f):G -> C(f)$ (the cokernel morphism of $f$). 

  Similarly, define $Im(f):= (im(f))^Sh$ (where $im(f)$ is defined in $PreSh(X)$).
]
In particular, $Cok(f)$ could also be called a "Quotient Sheaf" and denoted as $G\/F$ (or $(G\/F)^Sh$ if more formally), since it's a sheafification of the "Quotient Presheaf" $G\/F:O(X)^op -> Ab$, by $F\/G(U) := G(U)\/F(U)$ via the morphism $f:F->G$.

Associated to this, we wish to define a notion of exactness:
#definition[Exact Sequence in $Sh(X)$][
  Given sheaves $F,G,H in Sh(X)$, with $f:F->G$ and $g:G -> H$ as morphism of sheaves. Then, the sequence is exact at $G$, if $Im(f) tilde.equiv Ker(g)$ as sheaves.
]

\ 

Here, let's talk about another powerful tool of stalks on sheaves:
#theorem("Exactness on Stalks")[
  Given a sequence $F -> G -> H$ in $Sh(X)$. Then, this sequence is exact $<==>$ for every $x in X$, te sequence on stalks $F_x -> G_x -> H_x$ is exact.
][
  Will be done in the practice problems.
]

#pagebreak()

= Sheaves based on Continuous Maps

Finally, let's talk about two related concepts (related to pushforward and pullback of continuous functions) in $Sh(X)$:
#definition[Direct Image Sheaf][
  Given $f:X -> Y$ a continuous map of topological spaces, and any sheaf $F in Sh(X)$. Then, the #text(weight: "bold")[Direct Image Sheaf] $f_* F in Sh(Y)$ is defined by $f_* F(V) = F(f^(-1)(V))$ for any open subset $V subset.eq Y$.
]

Since the subsets are open in $X$, and any open subset $V subset.eq Y$ with open cover ${V_i}$ has the preimage $f^(-1)(V)$ having an open cover ${f^(-1)(V_i)}$, so all the sheaf properties of $F$ can be carried over onto $f_* F$.

#definition[Inverse Image Sheaf][
  Given $f:X -> Y$ a continuous map of topological spaces, and any sheaf $G in Sh(Y)$. Then, the #text(weight: "bold")[Inverse Image Sheaf] $f^(-1)G in Sh(X)$ is defined as the sheafification of the presheaf $f^(-1)G':O(X)^op -> Ab$, by $f^(-1)G'(U) := lim_(->\ V supset.eq f(U))G(V)$ (i.e. the direct limit of all $G(V)$, where $V$ runs over the preorder of open subsets containing $f(U)$).
]

Which, this final ideal is a bit different from the maps between prime spectrums.

\ 

In particular, $f_*: Sh(X) -> Sh(Y)$ is a functor, and similarly $f^(-1):Sh(Y) -> Sh(X)$ is also a functor (which one needs to check the functoriality, but intuitively it's true).

\ 

Finally, here is the sheaf regarding subspace topology:
#definition[Restriction of Sheaves][
  Given $Z subset.eq X$ a subspace (with subspace topology), and $F in Sh(X)$ a sheaf. Take $iota:Z arrow.hook X$ as the inclusion map, then the #text(weight: "bold")[Restriction of Sheaf] $F$ to $Z$, is defined as $iota^(-1)F$. 
]

