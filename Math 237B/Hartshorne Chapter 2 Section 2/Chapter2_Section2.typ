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
  title: "Hartshorne Chapter 2 Section 2: Schemes",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline(title: "Table of Content:")

The goal for this section is to understand the notion of schemes - a generalization of the algebraic sets that was used to be defined in a more embedding sense, using the notion of sheaves, rings, and local rings.

= Prime Spectrum and its Structure

Before starting, let's review some notion on the spectrum of a commutative ring:
#definition[Spectrum of a Commutative Ring and Closed Sets][
  Given a commutative ring $A$, its prime spectrum $Spec(A)$ is defined to be all the prime ideals $P subset.eq A$. Similarly, a maximal spectrum $upright("Max")Spec(A)$ is defined to be all the maximal ideals $M subset.eq A$.

  \
  
  Given any ideal $I subset.eq A$, define the subset $V(I) subset.eq Spec(A)$ as all the prime ideals containing $I$.
]

Which, similar to the topology on traditional algebraic sets, one can define similar notion of "topology" on $Spec(A)$:
#lemma("Closed Set Relation on Spectrum")[
  Given a commutative ring $A$, and $Spec(A)$ the prime spectrum.
  + If $I,J subset.eq A$ are two ideals, then $V(I J) = V(I sect J)=V(I) union V(J)$.
  + If ${I_i}$ is a family of ideals of $A$, then $V(sum I_i) = sect.big V(I_i)$.
  + If $I,J$ are two ideals, then $V(I) subset.eq V(J)$ iff $sqrt(I) supset.eq sqrt(J)$.
][
  + First, for any prime ideal $P in V(I) union V(J)$, since either $P in V(I)$ or $P in V(J)$, one has $I subset.eq P$ or $J subset.eq P$. As a result, $I sect J subset.eq P$, hence $P in V(I sect J)$. This proves that $V(I) union V(J) subset.eq V(I sect J)$.

    Then, since $I J subset.eq I sect J$, then any prime ideal $P in V(I sect J)$ implies $I J subset.eq I sect J subset.eq P$,so $P in V(I J)$, showing $V(I sect J) subset.eq V(I J)$.

    Finally, given any $P in V(I J)$, one must have $P in V(I) union V(J)$, or else if $P in.not (V(I) union V(J))$, one has $P in.not V(I),V(J)$, so $I,J subset.eq.not P$. This shows there exists $i in I\\P$ and $j in J\\P$, which $i j in I J$, yet $i j in.not P$, so $I J subset.eq.not P$ (which it's a contradiction since we assume $P in V(I J)$). So, $P in V(I) union V(J)$, showing $V(I J) subset.eq V(I) union V(J)$.

    \ 

  + Given any prime ideal $P$, one has $P in V(sum I_i)$ iff $sum I_i subset.eq P$,which happens iff $I_i subset.eq P$ for all index $i$, or $P in V(I_i)$ for any index $i$, and finally this happens iff $P in sect.big V(I_i)$. Tis proves that $V(sum I_i) = sect.big V(I_i)$.

    \ 

  + Notice that $V(I) subset.eq V(J)$ iff all prime ideals $I subset.eq P$, one has $J subset.eq P$ also. Which, it's equivalent to say any $P in V(I)$ satisfies $J subset.eq sqrt(J) subset.eq P$, showing that $sqrt(J) subset.eq sect.big_(P in V(I))P = sqrt(I)$ (recall that a radical of an ideal is the intersection of all prime ideals containing it). Which, the converse holds based on the same equality.
]

\ 

Also, notice that $V(A) = emptyset$ (since no prime ideal contains the whole ring $A$), and $V(0) = Spec(A)$ (since all prime ideal contains $0$) s a result, one can define the following topology on the spectrum:
#definition[Zariski Topology on Spectrum][
  Since the "algebraic set" $V(I)$ for any ideal $I subset.eq A$ satisfies the closed set relation of topology, it defines a topology on $Spec(A)$, which is called #text(weight: "bold")[Zariski Topology].
]

As a side note, for any nonzero element $f in A$, the set $D(f):= {P in Spec(A) | f in.not P}$ (all prime ideals not containing $f$) is the complement of $V((f))$, hence open; moreover it forms a basis of the Zariski Topology on $Spec(A)$ (because $D(1)$ clearly covers the whole space, and $D(f) sect D(g) = D(f g)$; finally, if $P in U$ where $U = Spec(A)\\V(I)$ for some ideal $I$, then there exists $a in I\\P$, so $P in D(a)$, while all $Q in D(a)$ satisfies $a in.not Q$, or $I subset.eq.not Q$, hence $Q in Spec(A)\\V(I)$, or $P in D(a) subset.eq U$).

\ 

Now, for the purpose of studying "morphisms" allowed on the more generalized spaces, one associates it with a sheaf of rings.
#definition[Structure Sheaf of a Spectrum][
  Given a commutative ring $A$ with $X = Spec(A)$. Define the #text(weight: "bold")[Structure Sheaf] of $X$, or #text(weight: "bold")[Sheaf of Rings] of $X$, as $cal(O)_X in Sh(X)$, which satisfies the following:

  $cal(O)_X (U) = {"functions "s:U -> union.sq.big_(P in U)A_P}$, such that: 
  1. All prime ideal $P in U$ satisfies $s(P) in A_P$.
  2. For each prime ideal $P in U$, there exists an open neighborhood $P in V subset.eq U$, such that there exists elements $a,f in A$ (with $f in.not Q$ for all prime ideal $Q in V$), satisfying $s(Q) = a/f in A_Q$ for all prime ideal $Q in V$.
  Also, the restriction map is the canonical restriction as set map.
]

As a clarification, since $U$ is an open subset, then every $P in U$ there exists $f in A$ such that $P in D(f) subset.eq U$ (by the basis property). Which, here $V$ can be chosen as a subset of $D(f)$ for $f in A$ to be in the denominator.

Of course, there are things we need to check if such definition is valid as a sheaf:
#prop[
  The Structure Sheaf of $Spec(A)$ is a sheaf.
][
  First, it's a presheaf of commutative rings because the functions can perform pointwise addition / multiplication (because all $s,t in cal(O)_X (U)$ with $P in U$ satisfies $s(P),t(P) in A_P$, hence define $(s+t)(P) := s(P)+t(P)$, and $(s dot t)(P):= s(P)dot t(P)$ defines a ring structure).

  To verify it's a sheaf, consider the following:
  - If $U subset.eq X$ is an open subset with open cover ${V_i}$ in $U$, then if $s in cal(O)_X (U)$ satisfies $s|_(V_i) = 0$ for all index $i$, then all prime ideals $P in U$ (since it lies in some $V_i$), then $s(P) = s|_(V_i)(P) = 0$, showing that $s = 0$. This proves the separation axiom.

  \ 

  - Also, if every cover element has some $s_i in cal(O)_X (V_i)$ such that they agree on arbitrary finite intersection, clearly they glue to a function $s:U -> union.sq.big_(P in U)A_P$, where each $s(P) in A_P$ (since if $P in V_i$, then $s(P) = s|_(V_i)(P) = s_i (P) in A_P$); on the other hand, for each $P in V_i subset.eq U$, one can take the open neighborhood $P in W subset.eq V_i$ together with $a,f in A$ that satisfies $s_i (Q) = a/f in A_Q$ for any $Q in W$, since $s|_(V_i) = s_i$,then $s|_W = s_i|_W$, this proves the second property required for the structure sheaf. Hence, $s in cal(O)_X (U)$, showing the gluing propety.

  As a result, $cal(O)_X$ is indeed a sheaf of rings.
]

\ 

It's kind of weird to call a presheaf a sheaf before proving it is one...anyway, after this we can observe some nice property of this structure sheaf:

#theorem[
  Given $A$ a commutative ring, $(X=Spec(A), cal(O)_X)$ the spectrum of $A$ with its structure sheaf.
  + For any prime ideal $P in Spec(A)$, the stalk $cal(O)_(X,P)$ is isomorphic to the local ring $A_P$.
  + For any element $f in A$, the ring $cal(O)_X (D(f))$ is isomorphic to the localized ring $A_f$.
  + One has $cal(O)_X (A) tilde.equiv A$.
][
  + Notice that if consider the direct limit $cal(O)_(X,P)$, every element $s_P in cal(O)_(X,P)$ has some representative $s in cal(O)_X (U)$ for some open subset $U subset.eq X$. Which, one can define the following map $"ev":cal(O)_(X,P)-> A_P$ by $"ev"(s_P):= s(P) in A_P$ (which is well-defined, as all representative can agree on some open neighborhood of $P$, in particular they all agree on $P$), and it's a ring homomorphism just by definition of additions and multiplications on each $cal(O)_X (U)$.

    \ 

    - To prove surjectivity, notice that for all $a/f in A_P$, with $f in.not P$, one has $P in D(f)$; as a result, choose $D(f) subset.eq X$ as the open neighborhood, then the function $s:D(f) -> union.sq.big_(Q in D(f))A_Q$ by $s(Q) = a/f in A_Q$ is well-defined (as $Q in D(f)$ implies $f in.not Q$), and take $V = D(f)$, with the chosen element $a,f in A$, it clearly satisfies the second condition for the structure sheaf.

      Hence, take its image $s_P in cal(O)_(X,P)$, one has $"ev"(s_P) = s(P) = a/f$, showing surjectivity of $"ev"$.

    \ 

    - To prove injectivity, suppose $"ev"(s_P) = 0$, then its representative has $s(P) = 0$. Which, using the structure sheaf property, there exists some open neighborhood $P in V subset.eq U$, together with $a,f in A$ (with $f in.not Q$ for any $Q in V$), such that $s(Q) = a/f in A_Q$ for all $Q in V$. As a result, $s(P) = a/f = 0 in A_P$, which by the definition of localization, there exists $u in A\\P$, such that $(a dot 1-0 dot f)u = 0$, or $a u = 0$ (where $0 in P$ is by definition). Using the prime property, $u in.not P$ implies that $a in P$. 

      Now, notice that this generalizes to any prime ideal in $V sect D(f) sect D(u)$ (since if $Q in V sect D(f) sect D(u)$, one first has $s(Q) = a/f$ by definition of $V$, and one also has $f,u in.not Q$, showing that $(a dot 1-0 dot f)u = 0$, or $a/f = 0$ in $A_Q$). Hence, within this open neighborhood, one has $s$ restricted to $0$, showing that $s_P = 0$. This proves injectivity.

      \ 

    \ 

  + For this, we'll define another homomorphism $psi: A_f -> cal(O)_X (D(f))$, by mapping all $a/f^n in A_f$, to a map $psi_(a/f^n):D(f) -> union.sq.big_(P in D(f))A_P$ by $psi_(a/f^n)(P):= a/f^n in A_P$. This is a well-defined ring homomorphism, just because addition and multiplication can be performed pointwise; and, it clearly satisfies the second condition for structure sheaf (by choosing $V = D(f)$, and $a, f^n in A$).

    \ 

    - To prove injectivity, suppose one has $psi_(a/f^n)=0$, then for any prime ideal $P in D(f)$, one has $a/f^n = 0 in A_P$. So, there exists $u_P in A\\P$, such that $(a dot 1-0 dot f^n)u_P = 0$, or $a u_P = 0$. If consider the ideal $J = Ann(a)$, one has $u_P in J$, while $u_P in.not P$, this shows that $J subset.eq.not P$, or $P in.not V(J)$.

      Notice that such relation is true for all $Q in D(f)$, hence one has $V(J) sect D(f)=emptyset$. As a result, this implies $V(J) subset.eq V((f))$, in other words $f in sqrt(J)$, so there exists some power $m in NN$, such that $f^m in J = Ann(a)$, or $a f^m = 0$. Hence, within the localization $A_f$, one has $(a dot f^m - 0 dot f^n)=0$, showing $a/f^n = 0$. This proves the injectivity of $psi$.

      \ 

    - To prove surjectivity, given any map $s:D(f) -> union.sq.big_(P in D(f))A_P$, by the definition of structure sheaf, each $P in D(f)$ has an open neighborhood $P in V_P subset.eq D(f)$ with elements $a_P, g_P in A$, such that $s(Q) = a_P/g_P$ for all $Q in V_P$ (in particular, each $g_P in.not Q$ for all $Q in V_P$). This indicates that $V_P subset.eq D(g_P)$; which, by restricting to the basis element, WLOG one can assume $V_P = D(h_P)$ for some $h_P in A$.

      Then, since $D(h_P) subset.eq D(g_P)$, one has $V((h_P)) supset.eq V((g_P))$, indicating that $sqrt((h_P)) subset.eq sqrt((g_P))$. Hence, there exists $m_P in NN$, such that $h_P^(m_P) in (g_P)$, or there exists $c_P in A$, such that $h_P^(m_P) = c_P g_P$. Which, one concludes that $(a_P dot h_P^(m_P) - a_P dot c_P dot g_P)=0$, or $a_P/g_P = (c_P a_P)/h_P^(m_P)$. This shows that on $D(h_P)$ particularly, one has $a_P/g_P = (c_P a_P)/h_P^(m_P)$ for each prime ideal in $D(h_P)$.

      Since $D(h) = D(h^n)$ for any nonzero $h in A$ and $n in NN$ (using the prime property), one can replace $h_P^(m_P)$ with $h_P$ (for notation simplicity), and $c_P a_P$ by $a_P$. So, one has $s$ being represented as $a_P/h_P$ on the open subset $D(h_P)$.

      \ 

      Next, we'll consider reducing the number of $D(h_P)$'s to be finite: Given that $D(f) = union.big D(h_P)$, then one has $V((f)) = sect.big V((h_P)) = V(sum (h_P))$. So, one has $f in sqrt(sum (h_P))$, showing that $f^n in sum (h_P)$ for some natural number $n$. This further implies that there exists finite list $h_1,...,h_m$ within the $h_P$'s (with coefficients $b_1,...,b_m in A$), such that $f^n = sum_(i=1)^m b_i h_i$.

      This indicates that $f in sqrt(sum_(i=1)^m (h_i))$, as a result $V((f)) supset.eq V(sum_(i=1)^m (h_i)) = sect.big_(i=1)^m V((h_i))$. So, $D(f) subset.eq union.big_(i=1)^m D(h_i)$, showing finite choice suffices.

      \ 

      Now, combining the previous two facts, one has $D(f)$ being covered by $D(h_1),...,D(h_m)$, and for each of them $s$ is represented by $a_i/h_i$ for some element $a_i in A$. Then, if consider $D(h_i) sect D(h_j) = D(h_i h_j)$ (and the restriction of $s$ onto this), the two elements $a_i/h_i$ and $a_j/h_j$ represents the same element on $D(h_i h_j)$. Then, consider the ring homomorphism $psi:A_(h_i h_j) -> cal(O)_X (D(h_i h_j))$, the representative of $s$ implies that $s|_(D(h_i h_j)) = psi_(a_i/h_i) = psi_(a_j / h_j)$, hence with injectivity of $psi$, one must have $a_i/h_i=a_j/h_j$ in $A_(h_i h_j)$. As a result, there exists $l_(i j) in NN$, such that the following holds:
      $ (a_i dot h_j-a_j dot h_i)(h_i h_j)^(l_(i j)) = 0 $
      Notice that the collection ${h_i}$ is finite now, so one can choose $N$ as the maximum for all $l_(i j)$, deducing the following equation for arbitrary $i,j$:
      $ (a_i dot h_j - a_j dot h_i)(h_i h_j)^N = 0, quad (a_i h_i^N)(h_j^(N+1)) - (a_j h_j^N)(h_i^(N+1))=0 $

      Finally, replacing each $a_i$ with $h_i^N a_i$, and $h_i$ with $h_i^(N+1)$ (or, denote these replacement as $a_i, h_i$ respectively), then one deduces that each $a_i/h_i$ (after the replacement) still represents the original element, and now we can assume $a_i h_j = a_j h_i$ for any $i,j$.

      Write $f^n = sum_(i=1)^m b_i h_i$ as before (with some newly chosen $b_i$), if consider $a = sum_(i=1)^m b_i a_i$, then it deduces the following:
      $ a h_j = sum_(i=1)^m b_i a_i h_j = sum_(i=1)^m b_i a_j h_i  = a_j sum_(i=1)^m b_i h_i = a_j f^(m) $
      So, this proves that the element $a/f^m = a_j/h_j$ on $D(h_j)$ (within the prime ideals). So, $psi_(a/f^n) = s$ on the whole domain, showing the surjectivity of $psi$.

    This concludes the isomorphism between $A_f$ and $cal(O)_X (D(f))$.

    \ 

  + For the third case, notice that $A_f = A$ for $f=1$. Hence, choosing $D(1) = Spec(A)$, one has $cal(O)_X (Spec(A)) tilde.equiv A_1=A$. Which, it's a special case of 2.    
]

#pagebreak()

= Ringed Space and Locally Ringed Space

With the definitions of prime spectrum, we'd like to have a category regulating simillar objects:
#definition[Category of Ringed Space][
  A #text(weight: "bold")[Ringed Space] is a pair $(X, cal(O)_X)$, where $X$ is a topological space, and $cal(O)_X$ is its structure sheaf (sheaf of ring). 

  A #text(weight: "bold")[morphism] of ringed spaces $(f,f^\#):(X, cal(O)_X) -> (Y, cal(O)_Y)$ consists of a continuous map $f:X -> Y$, and morphism of sheaves $f^\#:cal(O)_Y -> f_* cal(O)_X$ of sheaves of rings on $Y$.

  Together, this forms a category of Ringed Spaces.
]

For extra constraints, we also want to restrict the stalks:
#definition[Category of Locally Ringed Space][
  One define a ringed space $(X,cal(O)_X)$ as a #text(weight: "bold")[Locally Ringed Space], if for each point $P in X$, the stalk $cal(O)_(X,P)$ is a local ring.

  Also, a morphism $(f,f^\#):(X, cal(O)_X)-> (Y, cal(O)_Y)$ is a #text(weight: "bold")[morphism of Locally Ringed Space], if the induced homomorphism $overline(f^\#):cal(O)_(Y,f(P)) -> f_* cal(O)_(X,P)$ is a #emph[local homomorphism] of local rings.

  These collects to a category of Locally Ringed Spaces.
]

For clarification, first let's explain the construction of the morphisms on stalks: Given any open subset $V subset.eq Y$, one has $V in.rev f(P)$ implies $f^(-1)(V) in.rev P$. Hence, if consider the direct limit over a system of $V in.rev f(P)$, hen one has a ring homomorphism $cal(O)_(Y, f(P)) -> lim_(V in.rev f(P))cal(O)_X (f^(-1)(V))$. Which, because the directed system span over a subportion of all $f_* cal(O)_X (V) = cal(O)(f^(-1)(V))$ (with $f^(-1)(V) in.rev P$), one generates a ring homomorphis $lim_(V in.rev f(P))cal(O)_X (f^(-1)(V)) -> f_* cal(O)_(X,P)$. Which, the composition generates the desired orphism on stalks.

Also, given $A,B$ two local rings (wht $m_A, m_B$ the maximal ideals respectively), a ring homomorphism $f:A->B$ is called a #emph[local homomorphism] if $phi^(-1)(m_B) = m_A$ (or equivalently, one has $m_A^e subset.eq m_B$).

\ 

As a side note, within this category, $(f,f^\#)$ is an isomorphism (with two-sided inverse) iff $f$ is a topological homeomorphism, with $f^\#$ being an isomorphism of sheaves.

\ 

Let's get some examples regarding ringed spaces and locally ringed spaces:
#example[Ringed Space that is not Local][
  Consider a connected topological space $X$, with the constant sheaf of $ZZ$, say $F_ZZ$ equipped with. Then, $(X, F_ZZ)$ is a ringed space, but with any localization $F_(ZZ, x) tilde.equiv ZZ$, which is not local.

  So, it's not a locally ringed space.
]

\ 

#example[Morphism of Ringed Space, but not Local][
  Given a local integral domain $A$ (for instance, $A = ZZ_((p))$), together with its fraction field $K = F(A)$, there is an obvious inclusion $iota: A arrow.hook K$, and notice that as an integral domain, for any multiplicatively closed set $S subset A$, the incuded localization map $A -> S^(-1)A$ is injective, and $S^(-1)A$ includes into $K$ by definition.

  \ 

  Now, consider $X = {*}$ a one point space, define $F_A, F_K$ to be the constant sheaf of $A$ and $K$ respectively on $X$, then $(X, F_K), (X,F_A)$ are naturally locally ringed spaces. Which, define the pair $(id_X, f):(X, F_K) -> (X, F_A)$, where $id_X :X -> X$ is the identity as topological homeomorphism, and $f: F_A -> F_K$ is the following morphism:
  $ forall U subset.eq X "open", quad &f(U):F_A (U) = Hom_(Top)(U,A) -> F_K (U) = Hom_(Top)(U, K)\ 
  &f(U)(psi) = iota compose psi $
  Notice that since $A,K$ are endowed with discrete topology, $iota:A arrow.hook K$ is naturally a continuous map, so the above map $f$ is well-defined. So, they actually form a morphism of ringed spaces.

  Yet, it's not a morphism of locally ringed spaces, as the direct limit of both sheaves are $A,K$ respectively, so the induced map on stalk $overline(f):F_(A,*)-> F_(K,*)$ becomes $overline(f):A -> K$, and it's precisely the inclusion, which is not a local homomorphism.
]

\ 


Regarding the theorem of prime spectrum's structure, one has the following characterization:
#theorem("Prime Spectrum as Locally Ringed Space")[
  + Given $A$ a commutative ring, then $(Spec(A), cal(O))$ is a locally ringed space.
  + If $phi:A->B$ is a commutative ring homomorphism, then the map $phi':Spec(B)->Spec(A)$ by $phi'(P) = phi^(-1)(P)$ is a continuous map, and it induces a morphism of locally ringed spaces 
    $ (f, f^\#):(Spec(B), cal(O)_B) -> (Spec(A), cal(O)_A) $
  + If $A,B$ are commutative rings, then any morphism of locally ringed spaces $(f,f^\#):(Spec(B),cal(O)_B)-> (Spec(A), cal(O)_A)$ is induced by a ring homomorphism $phi:A -> B$.
][
  + This follows the fact that $cal(O)_P tilde.equiv A_P$ for all $P in Spec(A)$ (cf. previous theorem).

    \ 

    \ 

  + Given a commutative ring homomorphism $phi:A -> B$, notice the map $f:Spec(B)->Spec(A)$ is continuous: Suppose $I subset.eq A$ is an ideal, and consider the closed set $V(I) subset.eq Spec(A)$. Then, one has $P in f^(-1)(V(I))$ iff $f(P) = phi^(-1)(P) in V(I)$ iff $phi(I) subset.eq P$. Hence, take $V(I^e)$, one has $P in V(I^e)$ iff $phi^(-1)(P) in V(I)$, showing that $f^(-1)(V(I)) = V(I^e)$, which $f$ is a continuous map.

    \ 

    Then, notice that given any prime ideal $P in Spec(B)$, the composition of localization map with $phi$, say $pi compose phi:A -> B -> B_P$ has all element in $A\\phi^(-1)(P)$ being invertible, so it descends to a homomorphism $phi_P:A_(phi^(-1)(P))-> B_P$ (which is a local homomorphism, since $phi_P (phi^(-1)(P)) = phi(phi^(-1))(P)B_P subset.eq P B_P$).

    Which, for any open subset $U subset.eq Spec(A)$, take $f^(-1)(U)$, construct the following map:
    $ &f^\#_U:cal(O)_A (U) -> cal(O)_B (f^(-1)(U)), quad forall s:U -> union.sq.big_(Q in U)A_Q\ 
    &f^\#_U (s):f^(-1)(U) -> union.sq.big_(P in f^(-1)(U))B_P, quad f^\#_U (s)(P) = phi_P compose s compose f(P) = phi_P compose s(phi^(-1)(P)) $
    Which, it's clear that $f^\#_U (s)(P) in B_P$ by the definition (since $s(phi^(-1)(P)) in A_(phi^(-1)(P))$, so it's in the domain of $phi_P$). To verify that it's a ring homomorphism, consider the following:
    $ f^\#_U (s+t)(P) &= phi_P compose (s+t)(phi^(-1)(P)) = phi_P (s(phi^(-1)(P))+t(phi^(-1)(P)))\ 
    &= phi_P compose s(phi^(-1)(P)) + phi_P compose t(phi^(-1)(P)) = f^\#_U (s)(P)+f^\#_U (t)(P) $
    $ f^\#_U (s dot t)(P) &= phi_P compose (s dot t)(phi^(-1)(P)) = phi_P (s(phi^(-1)(P)) dot t(phi^(-1)(P)))\ 
    &= phi_P (s(phi^(-1)(P))) dot phi_P (t(phi^(-1)(P))) = f^\#_U (s)(phi^(-1)(P)) dot f^\#_U (t)(phi^(-1)(P)) $
    Which, $f^\#_U (s+t) = f^\#_U (s)+f^\#_U (t)$, and $f^\#_U (s dot t)=f^\#_U (s) dot f^\#_U (t)$, showing $f^\#_U$ is a ring homomorphism.

    Which, with the restriction map being restriction of domain, the diagram clearly commutes:
    #set align(center)
    #diagram($
               cal(O)_A (U) edge("d",->, script(rho_(U V))) edge(->, script(f^\#_U)) & cal(O)_B (f^(-1)(U)) edge("d", ->, script(rho_(U V)))\ 
               cal(O)_A (V) edge(->, script(f^\#_V), #right) & cal(O)_B (f^(-1)(V))
             $)
    #set align(left)
    And the reason is because any $P in f^(-1)(V)$ has $f(P)= phi^(-1)(P) in V$, which the restriction of $U$ to $V$ for any $s in cal(O)_A (U)$, can be carried over when restricting $f^(-1)(U)$ to $f^(-1)(V)$ for $cal(O)_B (f^(-1)(U))$.

    Hence, this defines a morphism of sheaf of rings $f^\#:cal(O)_A -> f_* cal(O)_B$.

    Finally, this is a morphism of locally ringed space, because any $P in Spec(B)$ has the descended map being $phi_P: A_(phi^(-1)(P)) -> B_P$, which is already proven as a local homomorphism.

    \ 

    \ 

  + Now, consider an morphism of locally ringed spaces $(f,f^\#):(Spec(B), cal(O)_B) -> (Spec(A), cal(O)_A)$, notice that take the whole space, one has a ring homomorphism $phi = f^\#_(Spec(A)):cal(O)_A (Spec(A)) -> cal(O)_B (f^(-1)(Spec(A))) = cal(O)_B (Spec(B))$, which reads precisely as $phi:A -> B$. Now, we claim that $phi$ induces a morphism of locally ringed spaces (cf. part (b)) that's identical to $(f,f^\#)$.

    \ 

    First, for any $P in Spec(B)$, notice the map $phi:A -> B$ descends to a local homomorphism $phi_P: A_(phi^(-1)(P)) -> B_P$, which is of the following commutative diagram:
    #set align(center)
    #diagram($
               A edge("d",->) edge(->, script(phi)) & B edge("d", ->)\ 
               A_(phi^(-1)(P)) edge(->, script(phi_P), #right) & B_P
             $)
    #set align(left)
    On the other hand, the morphism of sheaf of rings $f^\#:cal(O)_A -> f_* cal(O)_B$ also has a local homomorphism $f^\#_P: cal(O)_(A, f(P))-> cal(O)_(B,P)$ (or, $f^\#_P:A_(f(P))-> B_P$), which is descended from the direct limit (where the direct limit contains open subset $Spec(B) in.rev P$ for $B_P$, and $Spec(A) in.rev f(P)$ for $A_(f(P))$), hence one also has the following commutative diagram:
    #set align(center)
    #diagram($
               A edge("d",->) edge(->, script(phi)) & B edge("d", ->)\ 
               A_(f(P)) edge(->, script(f^\#_P), #right) & B_P
             $)
    #set align(left)
    Now, notie that this enforces $f(P) = phi^(-1)(P)$ (since if $f(P) != phi^(-1)(P)$, then there exists element lying in one but not the other; for definiteness, say there exists $a in phi^(-1)(P)\\f(P)$. Then, the image of $a$ in $B_P$ is not invertible, since $a in.not A\\phi^(-1)(P)$, which by the first diagram is not allowed to be inverted; on the other hand, $a$ in $B_P$ should be invertible, since $a in A\\f(P)$, which by the second diagram is being inverted, causing a contradiction).

    Then, this shows that $f:Spec(B)->Spec(A)$ coincides with the map induced by $phi:A->B$, which further follows that $f^\#$ must be induced by $phi$ also. Therefore, $(f,f^\#)$ is induced by a ring homomorphism $A->B$ (and the particular choice is $f^\#_(Spec(A)):A-> B$).
]

#pagebreak()

= Affine Schemes and Schemes

With all of these, one can make a definition of the most general object in Algebraic Geometry:
#definition[Affine Schemes and Schemes][
  An #text(weight: "bold")[Affine Scheme] is a locally ringed space $(X, cal(O)_X)$ that is isomorphic to $(Spec(A), cal(O)_A)$ for some commutative ring $A$ (as locally ringed spaces).

  \ 

  A #text(weight: "bold")[Scheme] is a locally ringed space $(X, cal(O)_X)$, such that every point has an affine neighborhood. More precisely, for every $x in X$, it has an open neighborhood $x in U subset.eq X$, so that the restriction of sheaves $cal(O)_X |_U$ satisfies $(U, cal(O)_X |_U)$ being an affine scheme.

  (Equivalently, a Scheme is a locally ringed space with an affine cover).
]

Which, the morphism is restricted to morphism of locally ringed spaces, and an isomorphism is an isomorphism of locally ringed spaces, which s DIFFERENT from topological homeomorphism (EX: morphisms between spectrum of non-isomorphic fields).

\ 

Finally, before the end of the section, let's talk about some examples / definitions that'll be motivated:

#definition[Affine $n$-Space][
  Given $k$ a field, define $Spec(k[x_1,...,x_n]) =: AA^n_k$ as the #text(weight: "bold")[Affine $n$-Space]. For $n=1$, the space $AA^1_k = Spec(k[x])$ is called an #text(weight: "bold")[Affine Line].
]
As a side note, all commutative ring's spectrum is a "Spectral Space", which also has a unique "generic point" (with a point whose closure is the whole space). In these cases, the zero ideal is the generic point.

Also, if $k$ is algebraically closed, then $AA^1_k\\{0}$ (removing the zero ideal) is classified by all maximal ideal $(x-a)$ (where $a in k$), which taking away the generaic point, the affine line has a one-to-one corerspondance with $k$ itself. Which creates an analogy to traditional affine $1$-space (each point corresponds to a maximal ideal in $k[x]$, and the whole space corresponds to the zero ideal).
#example[Affine Plane][
  By definition, $AA^2_k = Spec(k[x,y])$. Which, the point is closed $<==>$ it's maximal. If $k$ is algebraically closed, then Hilbert's Nullstellensatz guarantees a one-to-one correspondance of closed points in $AA^2_k$ and all maximal ideals. Which, with the induced topology, it's homeomorphic to $k^2$ (under Zariski Topology), via the map $C -> k^2$ of $(x-a, y-b) mapsto (a,b)$.

  \ 
  
  As a bijection it's clear; given any algebraic set $Z subset k^2$, it's the zero of some polynomials $f_1,...,f_n in k[x,y]$, which take $V((f_1,...,f_n))$ and intersect with $C$ the closed points, it's precisely all maximal ideal $(x-a,y-b)$ containing $(f_1,...,f_n)$, and as a result all $f_i (a,b)=0$, or $(a,b ) in Z$, showing $(x-a,y-b)$ is in the preimage of $Z$, therefore the map is continuous.

  Finally, the map is also a closed map, as if the collection of maximal ideals are precisely $V(I) sect C$ (closed in subspace topology of $C$), then every polynomial $f in I$ is contained in $(x-a,y-b)$ (if this ideal is in the intersection), as a result $f(a,b)=0$. So, $(a,b) in Z(I) subset k^2$; moreover, if $(a,b) in Z(I)$, then $(x-a), (y-b) in  sqrt(I)$ using Nullstellensatz, showing that $V(I) = V(sqrt(I)) in.rev (x-a,y-b)$. So, the image of $V(I) sect C$ is precisely $Z(I) subset k^2$, generating the homeomorphism.

  \ 

  Also, given any irreducible polynomial $f in k[x,y]$, since $V((f)) tilde.equiv Spec(k[x,y]\/(f))$ as topological space, notice that the zero ideal $0 in Spec(k[x,y])\/(f)$ has the closure being the whole space, as a result the corresponding prime ideal $(f) in V((f))$ is the generic point.

  With $(f)$ being at least height $1$ (and $k[x,y]$ has height $2$), then any other distinct point from $(f)$ in $V((f))$ must be closed points (i.e. maximal ideals). So, one has $(f) in V((f))$ be a generic point (of the subspace topology of $V((f))$), whose closure contains only $(f)$ and other closed point (that as mximal ideal contains $(f)$).

  (Note: Here $(f)$ is in fact THE generic point, as $Spec(k[x,y]\/(f))$ only has one generic point).
]

Finally, to construct a nicer structure, one would like a way of "gluing" schemes together to form new schemes. Using the categorical logic, when there are subschemes that are isomorphic, it's desirable to have fibre coproduct of them (by identifying the subschemes as the same).

For the topological purpose, let's review some terminology from topology:
#definition[Adjoint Space][
  In the category of Topological Spaces, given two topological space $X,Y$, and their open subsets $U subset.eq X$, $V subset.eq Y$ are homeomorphic (via a map $phi:U arrow.tilde V$), then the adjoint space $X union.sq_phi Y$ is defined as $(X union.sq Y)\/tilde$, where every $a in U$ has $a tilde phi(a)$ in $X union.sq Y$.

  The topology on the adjoint space $X union.sq_phi Y$ is the quotient topology of the disjoint union space $X union.sq Y$.
]
Notice that this is the fibre coproduct of the following diagram:
#set align(center)
#diagram($
           U edge("hook->") edge("d", "hook->", script(phi)) & X edge("d", "hook->") edge("ddr", ->, script(i_X), bend: #20deg)\
           Y edge("hook->") edge("drr", ->, script(i_Y), #right, bend: #(-20deg)) & X union.sq_phi Y edge("dr", "..>", script(exists ! i))\ 
           && Z
         $)
#set align(left)
Since if any topological space $Z$ with continuous maps $i_X:X -> Z$ and $i_Y:Y -> Z$ that satisfies $i_X compose iota:U -> Z$ and $i_y compose phi:U -> Z$ agrees, then any continuous map $i:X union.sq_phi Y -> Z$ lifts to a continuous map $overline(i):X union.sq Y -> Z$, such that the composition with inclusion $Y arrow.hook X union.sq Y$ and $X arrow.hook X union.sq Y$ recovers the map $i_Y, i_X$ respectively (using the property of disjoint union space).

Which, for any $a in X\\U$, one must have $i(a) = i_X (a)$; for all $b in Y\\V$, one must have $i(b) = i_Y (b)$; and finally, for all $phi(c) tilde c in U$ (where $U tilde.equiv V$ via $phi$), one has $i(c) = i_X (c) = i_Y compose phi(c)$, showing the uniqueness of $i$ as a set map.

And, the existence of $i$ (as continuous map) is based on the fact that any open subset $W subset.eq Z$ has preimage $i_X ^(-1)(W) subset.eq X$, $i_Y ^(-1)(W) subset.eq Y$ being open, so $(i_X^(-1)(W) union.sq i_Y ^(-1)(W)) subset.eq (X union.sq Y)$ is open. Hence, its quotient in $X union.sq_phi Y$ is also open (which is precisely the preimage under $i$). This shows the continuity of $i$.

\ 

Now, using such idea, we can construct "gluing of schemes":
#theorem("Gluing of Schemes")[
  Let $X,Y$ be two schemes (here we omit the structure sheaf for simplicity), and let $U subset.eq X$, $V subset.eq Y$ be two open subsets, such that there exists an isomorphism of schemes $(phi, phi^\#):(U, cal(O)_X|_U)arrow.tilde (V, cal(O)_Y|_V)$. Then, the adjoint space $X union.sq_phi Y$ has a natural scheme, together with morphisms of schemes $(iota_X, iota_X^\#):(X, cal(O)_X) -> (X union.sq_phi Y, cal(O)_phi)$ and $(iota_Y, iota_Y^\#):(Y,cal(O)_Y)-> (X union.sq_phi Y, cal(O)_phi)$, such that the following diagram commutes:
  #set align(center)
  #diagram($
            U edge("hook->") edge("d", "hook->", script(phi)) & X edge("d", "hook->", script(iota_X), #left) edge("ddr", ->, script(i_X), bend: #20deg)\
            Y edge("hook->", script(iota_Y), #right) edge("drr", ->, script(i_Y), #right, bend: #(-20deg)) & X union.sq_phi Y edge("dr", "..>", script(exists ! i))\ 
            && Z
          $)
  #set align(left)
  Where, all the arrows are morphism of schemes.
][
  It's clear that $X union.sq_phi Y$ is a topological space. So, the only task is to construct a suitable structure sheaf with the desired property.

  Given any open subset $W subset.eq X union.sq_phi Y$, notice its preimage in $U$ (i.e. $W sec U = W sect V$ in $X union.sq_phi Y$, where $U$ is identified as a subspace of $X arrow.hook X union.sq_phi Y$, and similarly for $V$ as a subspace of $Y arrow.hook X union.sq_phi Y$). Say such preimage is $W' subset.eq U$, then one has the following diagram:
  #set align(center)
  #diagram($
             cal(O)_U (W') edge("<-") & cal(O)_Y (W sect V)\ 
             cal(O)_X (W sect U) edge("u", "->")
           $)
  #set align(left)
  Hence, a natural choice for $cal(O)_phi (W)$ is the fibre product of the above diagram:
  #set align(center)
  #diagram($
             cal(O)_U (W') edge("<-") & cal(O)_Y (W sect V)\ 
             cal(O)_X (W sect U) edge("u", "->") & cal(O)_phi (W) edge("l", ->) edge("u", ->) edge("dr", "<..", script(exists ! i))\ 
             && Z edge("uul", ->, script(i_Y^*), bend: #(-20deg)) edge("ull", ->, script(i_X^*), bend: #20deg)
           $)
  #set align(left)
  In particular, $cal(O)_phi (W) = {(s_1, s_2) : s_1|_(W sect U) = s_2 |_(W sect V)}$ as subring of the product of rings.

  Also, note that since $cal(O)_phi (W)$ is constructed as the kernel of a product map, which is preserved under direct limits. Then, in particular the stalk of any point $x in U$, the induced stalk $cal(O)_(phi, x)$ is the fibre product of $cal(O)_(X, x)-> cal(O)_(U, x)$ and $cal(O)_(Y, x)-> cal(O)_(U, x)$, which is also a local ring (and has local homomorphisms to $cal(O)_(X,x)$ and $cal(O)_(Y, x)$ respectively), based on the following lemma:
  #lemma[
    Given $A,B,C$ three local rings, and $phi:A -> C$, $psi:B -> C$ two local homomorphisms, then the fibre product $A times_C B$ with the two canonical projections $pi_A:A times_C B -> A$, $pi_B:A times_C B -> B$ are local ring, and local homomorphisms.
  ][
    For simplicity, $A times_C B:= {(a,b) in A times B | phi(a)=psi(b)}$ is the set theoretic fibre product. 

    Now, let $m_R subset.eq R$ ($R=A,B,C$) be the maximal ideal of $R$, we claim that the set $m_A times_C m_B := (m_A times m_B) sect (A times_C B)$ is the maximal ideal of $A times_C B$:

    - First, since the inclusion $A times_C B arrow.hook A times B$ is a ring homomorphism, with $m_A times m_B$ being an ideal in $A times B$, its preimage under the inclusion (which is $m_A times_C m_B$) is automatically an ideal.

    \ 

    - Then, we claim that every element outside of $m_A times_C m_B$ is a unit (which automatically makes $m_A times_C m_B$ a maximal ideal). Take $(a,b) in A times_C B\\m_A times_C m_B$. As set element one has $a in A\\m_A$ and $b in B\\m_B$. By the property of local rings, $a in U(A)$ and $b in U(B)$, so $a^(-1) in A$ and $b^(-1) in B$ exists.

      Now, notice the following equality:
      $ phi(a^(-1)) = phi(a)^(-1) = psi(b)^(-1) = psi(b^(-1)) $
      The middle equality is based on the fact that $(a,b) in A times_C B$ (so $phi(a)=psi(b)$). Hence, one has $(a^(-1),b^(-1)) in A times_C B$ serving as the inverse of $(a,b)$, proving the claim.

    \ 

    Finally, about the local homomorphism part, notice that $pi_A (m_A times_C m_B) subset.eq m_A$ and $pi_B (m_A times_C m_B) subset.eq m_B$ set wise, automatically making them local homomorphisms.
  ]

  This construction makes $(X union.sq_phi Y, cal(O)_phi)$ a locally ringed space.

  \ 

  Now, notice that for any point $a in X union.sq_phi Y$ (WLOG, say $a in X$), pick an affine neighborhood $W subset.eq X$, and embedd it to $X union.sq_phi Y$. Then, as a neighborhood one has that being a topological homeomorphism of the neighborhoods, which the fibre $cal(O)_phi (W)$ turns out to also be isomorphic to $cal(O)_X (W)$, proving that every point has an affine neighborhood.

  \ 

  Finally, the universal property is based on the fact that both the fibre product (in $CRing$) and adjoint space (in $Top$) has the corresponding universal property. And, the gathered morphism from $cal(O)_Z -> cal(O)_phi$ must be a morphism of presheaves, hence a morphism of sheaves.
]
Okay, this last part is a bit shaky...maybe I need to come back at some point.

#pagebreak()

= Projective Schemes

The idea is to construct similar concept of "projective spaces" using scheme theory. Similar to the projective geometry covered in 237A, this is strongly associated to the graded ring and its related algebra. As a start, let's talk about that:

#definition[Graded Ring][
  A commutative ring $S$ is said to be $ZZ$-graded (or graded), if as an abelian group $S = plus.big_(n in ZZ)S_n$, and under the multiplication any $n,m in ZZ$ satisfies $S_n dot S_m subset.eq S_(n+m)$.

  Which, any element$a_i in S_i$ is called a #text(weight: "bold")[Homogeneous element].
]
The most common example is the following:
#example[Polynomial Rings of a Field][
  Given a field $k$, and finitely many indeterminates $x_0,...,x_n$. Define the grading based on the degree of each monomial., then $k[x_0,...,x_n] = plus.circle.big_(n in NN)S_n$, where each $S_n$ is a finite dimensional $k$-vector space spanned by all monomials of degree $n$.

  And, if multiply a degree $k$ and degree $l$ monomial, one gets a degree $(k+l)$ monomial, which shows the graded ring structure $S_k dot S_l subset.eq S_(k+l)$ (in this case, they're directly equal).
]
As a side note, the grading on each monomial could be weighted: For instance $k[x_0, x_1^2]$ has the first indeterminate with degree $1$, and the second indeterinate with degree $2$. Also, the grading need not go over the whole $ZZ$ - the polynomial rings are typical examples where we only considered gradings for $n>=0$ (sometimes also called $NN$-graded).

\ 

Similarly, one can define similar notions for ideals:
#definition[Homogeneous Ideals][
  An ideal $I subset.eq S$ is a homogeneous ideal, if as an abelian group $I = plus.circle.big_(n in ZZ)I sect S_n$.
]
Which, there are certain important properties for graded rings:
#proposition[
  Given a graded ring $S$, one has $1 in S_0$.
][
  First, we know $1 = sum_(j=1)^n s_(i_j)$ for some $i_1<...<i_n$ in $ZZ$, with each $s_(i_j) in S_(i_j)$ is nonzero, based on the direct sum property. Which, among the elements $i_1,...,i_n$, there must exists $i_j = 0$. 
  
  Suppose not, then for any nonzero homogeneous element, say $s_k in S_k$, this happens:
  $ s_k = 1 dot s_k = sum_(j=1)^n s_(i_j) s_k $
  Where each $i_j != 0$, then the homogeneous element $s_(i_j) s_k$ has grading $i_j + k != k$, showing that none of the summand belongs to $S_k$, or $s_k in.not S_k$. Yet, this directly contradicts the assumption, so we must have one homogeneous element with index $i_j=0$.

  \ 

  Now, notice it satisfies the following:
  $ s_(i_j) = 1 dot s_(i_j) = sum_(k=1)^n s_(i_k) s_(i_j) $
  Since for any $k!=j$, one has $i_k != i_j =0$ (by the strict inequality requirement we imposed), so each homogeneous element $s_(i_k)s_(i_j)$ has degree $i_k+i_j =i_k != 0$. As a result, for $sum_(k=1)^n s_(i_k) s_(i_j) = s_(i_j) in S_0$, other index $k!=j$ has $s_(i_k) s_(i_j)=0$.

  \ 

  Finally, notice that this enforces $s_(i_j)=1$, since we can multiply with other $s_(i_k)$:
  $ s_(i_k) = 1 dot s_(i_k) = sum_(l=1)^n s_(i_l)s_(i_k) $
  Since for any $l!=j$, one has $i_l != i_j=0$, so the element $s_(i_l)s_(i_k)$ has degree $i_l+i_k != i_k$. For the sum $sum_(l=1)^n s_(i_l)s_(i_k) in S_k$, then other $l!=j$ must have $s_(i_l)s_(i_k)=0$, left with $s_(i_k) = s_(i_j)s_(i_k)$. Yet, we just proved that this is $0$ from the previous part, so if $k!=j$ one has $s_(i_k)=0$, proving that $1 = sum_(k=1)^n s_(i_k) = s_(i_j) in S_0$. 
]

Which, this gives rise to other tools for graded rings.

\ 

#proposition[
  Given an ideal $I subset.eq S$, $I$ is homogeneous $<==>$ $I$ is generated by homogeneous elements.
][
  $==>:$

  This direction is clear, as $I = plus.circle.big_(n in ZZ)I sect S_n$, so take the generating set $union.big_(n in ZZ)(I sect S_n)$ (which are all homogeneous elements), it clearly generates everything.

  \ 

  $<==:$

  Suppose $I$ is generated by homogeneous elements, say a collection of homogeneous elements $S = {s_alpha}_(alpha in I)$ (where each $alpha$ has an integer $i_alpha in ZZ$ such that $s_alpha in S_(i_alpha)$). Then, notice that for each $n in ZZ$, it generates a subgroup of the following form:
  $ sum_(alpha in I)S_(n-i_alpha)dot s_alpha <= S_n $
  Where $sum_(alpha in I)S_(n-i_alpha)dot s_alpha$ denotes all finite sum of the form $sum a_(n-i_alpha)s_(alpha)$, where $a_(n-i_alpha) in S_(n-i_alpha)$ (which forms a subgroup, because each $S_(n-i_alpha) dot s_alpha$ is one).

  By the definition of generation, it's clear that the following holds:
  $ plus.circle.big_(n in ZZ)(sum_(alpha in I)S_(n-i_alpha) dot s_(alpha)) subset.eq I $
  Also, the reverse direction holds, as all the elements in $I$ are of the form $sum_(j=1)^n r_j dot s_(alpha_j)$ for finitely many $r_j in S$ and $alpha_j in I$. Which, each, $r_j = sum_(k=1)^(l_j) r_(j k)$, with each $r_(j k) in S_(n_(j k))$ be some homogeneous element. Then, the element can be rewritten in this form:
  $ sum_(j=1)^n r_j dot s_(alpha_j) = sum_(j=1)^n sum_(k=1)^(l_j)r_(j k)s_(alpha_j) $
  where each $r_(j k)s_(alpha_j) in S_(n_(j k)+i_(alpha_j))$, and by definition it's contained in $sum_(alpha in I)S_(n_(j k)+i_(alpha_j)-i_alpha) dot s_(alpha)$. This shows the reverse direction:
  $ plus.circle.big_(n in ZZ)(sum_(alpha in I)S_(n-i_alpha) dot s_alpha) supset.eq I $
  Hence, we have $I$ being a direct sum of additive subgroups in each $S_n$.

  \ 
  
  Finally, notice that $sum_(alpha in I)S_(n-i_alpha) dot s_alpha = I sect S_n$: the direction $subset.eq$ is clear (as all of them belongs to both $I$ and $S_n$). Now, given any element in $I sect S_n$, it belongs to $plus.circle.big_(k in ZZ)(sum_(alpha in I)S_(k - i_alpha) dot s_alpha)$, hence is a finite sum of elements in each subgroup; however, since it's also homogeneous of degree $n$, it's enforced to be in $sum_(alpha in I)S_(n-i_alpha) dot s_alpha$, proving the $supset.eq$ direction.

  Hence, we concluded that $I = plus.circle.big_(n in ZZ)(sum_(alpha in I)S_(n-i_alpha) dot s_(alpha)) = plus.circle.big_(n in ZZ)I sect S_n$, proving $I$ is homogeneous.
] 
This allows us to restrict ourselves to work with only homogeneous elements, at least in the context of homogeneous ideals.

\

Finally, we have one related to prime ideals:

#definition[Homogeneous Prime Ideal][
  An ideal $P subset.eq S$ is called #text(weight: "bold")[Homogeneous Prime], if it's both a homogeneous and prime ideal.
]
Yeah, quite a hilarious use of definition here...anyway, this is really powerful, as it has the following characterization:
#proposition[
  Let $P subset.eq S$ be a homogeneous ideal, then $P$ is prime $<==>$ for any homogeneous elements $a,b in S$, $a b in P$ implies $a in P$ or $b in P$.

  In other words, the prime condition only suffices for homogeneous elements.
][
  $==>:$

  This direction is clear, as the prime condition works for all elements, in particular also the homogeneous ones.

  \ 

  $<==:$

  Suppose the prime condition holds for all homogeneous elements, now given any two elements $a = sum_(j=1)^n a_(i_j)$ and $b = sum_(l=1)^m a_(k_l)$, such that $i_1<...<i_n$, and $k_1<...<k_m$, and $a b in P$. Which, the expansion of $a b$ is as follow:
  $ a b=sum_(j=1)^n sum_(l=1)^m a_(i_j)b_(k_l) $
  Among all the homogeneous elements of $a b$, notice that $a_(i_1)b_(k_1)$ has the least degree (since $a_(i_j)b_(k_l)$ has degree $i_j+k_l$, which by our imposed inequality, $i_1+k_1<i_j+k_l$ for any $(j,l)!= (1,1)$). So, $a_(i_1)b_(k_1)$ is the only summand that has degree $i_1+k_1$, showing that $a_(i_1)b_(k_1) in P sect S_(i_1+k_1)$ (because $P$ is a homogeneous ideal). Using the prime condition on homogeneous elements, one of $a_(i_1), b_(k_1)$ is in $P$ (WLOG, say $a_(i_1) in P$).

  Now, notice this implies that all $a_(i_1) b_(k_l) in P$, hence one has the following:
  $ a b=sum_(j=2)^n sum_(l=1)^m a_(i_j)b_(k_l) + sum_(l=1)^m a_(i_1)b_(k_l) in P $
  Which, since $sum_(l=1)^m a_(i_1)b_(k_l) in P$ and $a b in P$, this enforces $sum_(j=2)^n sum_(l=1)^m a_(i_j)b_(k_l) in P$. Then, we can apply induction on the total word length $n+m$; with $sum_(j=2)^n sum_(l=1)^m a_(i_j)b_(k_l)$ having total word length $(n-1)+m$, by induction hypotehsis, either $b in P$, or $a-a_(i_1) = sum_(j=2)^n a_(i_j) in P$.

  Yet, if $b in P$, we're done; and else if $a-a_(i_1) in P$, because $a_(i_1) in P$, then $a in P$, we're also done.

  So, this completes the induction, showing that $a b in P$ implies either $a in P$ or $b in P$. Therefore, $P$ is a prime ideal.
]
This is powerful when needed to check the prime condition (as it suffices to check the homogeneous elements, which is extremely convenient in comparison to general elements).

\ 

As an example, let's consider a non-homogeneous prime ideal:
#example[Non-homogeneous Prime Ideal][
  Given $(x+1) in k[x]$ (where $k$ is arbitrary field), then it's prime but not homogeneous, as the element $x+1 in (x+1)$, yet if it's homogeneous it implies $x in (x+1)$ AND $1 in (x+1)$ (since $1$ is homogeneous of degree $0$), which contradicts the fact that it's a proper ideal.
]

\ 

Now, let's talk about ring homomorphisms for graded rings:
#definition[Graded Ring Homomorphism][
  Given $S=plus.circle.big S_n$ and $T=plus.circle.big T_m$ two graded rings, a ring homomorphism $f:S->T$ is #text(weight: "bold")[Graded], if it preserves the grading, or $f(S_n) subset.eq T_n$ for all $n in ZZ$.
]
As an observation, notice that it pulls back homogeneous ideals to homogeneous ideals (as $f^(-1)(I) = f^(-1)(plus.circle.big I sect T_n) = plus.circle.big f^(-1)(I sect T_n)$, due to the graded structure enforcing $f^(-1)(I sect T_n) subset.eq S_n$, and each $f^(-1)(I sect T_n)$ must precisely be $f^(-1)(I) sect S_n$).

Hence, in particular if $f$ is surjective, its kernel is a homogeneous ideal, and one has $T tilde.equiv S\/ker(f) tilde.equiv plus.circle.big_(n in ZZ)S_n\/(ker(f) sect S_n)$ as commutative rings:

#proof[

  If consider them as abelian groups, one first have each graded morphism $f_n:S_n -> T_n$ (which is surjective, because the map $f$ must be surjective component wise due to the graded structure), hence one has $T_n tilde.equiv S_n\/ker(f_n)$. Also, notice that $ker(f) = plus.circle.big ker(f_n)$ (because each $ker(f) sect S_n$ must lie in $ker(f_n)$, while the reverse direction is obviously true). Hence, one has the following (as isomorphism of abelian groups):
  $ plus.circle.big (S_n\/ker(f) sect S_n)=plus.circle.big (S_n\/ker(f_n)) tilde.equiv plus.circle.big T_n = T tilde.equiv S\/ker(f) $
  Now, it suffices to check the definition of multiplication on the newly created ring, say given $overline(a_n) in S_n\/ker(f_n)$ and $overline(a_m) in S_m\/ker(a_m)$, define $overline(a_n) dot overline(a_m):= overline(a_n a_m) in S_(n+m)\/ker(f_(n+m))$.

  If $a_n,a_n' in S_n$ and $a_m,a_m' in S_m$ are the representatives of $overline(a_n), overline(a_m)$ respectively, then $a_n-a_n' in ker(f_n)$ and $a_m-a_m' in ker(f_m)$, in particular they're all in $ker(f)$.

  As a result, one has $a_n' = k_n+a_n$ and $a_m' = k_m+a_m$ for some $k_n in ker(f_n)$ and $k_m in ker(f_m)$ (in particular, they're all in $ker(f)$). Hence, one has:
  $ a_n' a_m' = k_n k_m + k_n a_m + k_m a_n + a_n a_m $
  Where $k_n k_m, k_n a_m, k_m a_n in ker(f_(n+m))$ (because they all belong to $ker(f)$ and $S_(n+m)$, hence in the intersection $ker(f_(n+m))$). Therefore, $overline(a_n' a_m')=overline(a_n a_m)$, making it well-defined.
]

\

Finally, before starting the construction, let's define another useful tool:
#definition[Graded Algebra of an Ideal][
  Given a commutative ring $R$ and an ideal $I subset.eq R$, define the ideal's Graded Algebra as:
  $ Gr(I):= plus.circle.big_(n>=0)I^n\/I^(n+1) $
  Which, $I^0 := R$ is a convention.
]
Notice that this is not only an $R$-algebra, but also an $R\/I$-algebra (as there is a natural inclusion).

\ 

\ 

With all these machineries, we can start our actual construction of projective schemes. As convention, we'll fix the ring $S$ to be $NN$-graded:
#definition[Projective Space and Closed Subsets][
  Given an $NN$-graded ring $S$, define the set $Proj(S):=$ all homogeneous prime ideals, that doesn't contain the #text(weight: "bold")[Irrelevant Ideal] $plus.circle.big_(n>0)S_n$.

  \ 

  Also, given any homogeneous ideal $I$, define $V_+ (I) subset.eq Proj(S)$ to be all allowed homogeneous prime ideals that contains $I$.
]
The reason why Irrelevant Ideal is excluded is similar to the case of $PP^n$ before: if an ideal contains $(x_0,...,x_n)$ in $k[x_1,...,x_n]$, then it describes an empty set (as on $PP^n$ no coordinates can be completely $0$ everywhere). To prevent similar problem from arising, we first need to exclude this ideal (which corresponds to all positive gradings).

\ 

Of course, given the "closed sets", we need to verify its topology:
#lemma("Closed Set Relation on Projective Space")[
  Given an $NN$-graded ring $S$, and $Proj(S)$ all allowed prime spectrums.
  1. If $I,J subset.eq S$ are two homogeneous ideals, then $V_+ (I J) = V_+ (I sect J) = V_+ (I) union V_+ (J)$.
  2. If ${I_i}$ is a family of homogeneous ideals of $A$, then $V_+ (sum_i I_i) = sect V_+ (I_i)$
  3. If $I,J$ are two homogeneous ideals, then $V_+ (I) subset.eq V_+ (J)$ iff $sqrt(I)supset.eq sqrt(J)$ 
][
  For most part, cf. the proof of the ordinary spectrum case on page 1 (most proofs can directly carry over).

  To be careful though: The proof for $V(I J)=V(I) union V(J)$ will need the fact that homogeneous prime ideals only need to check with homogeneous elements. 

  \
  
  Also, the proof for radicals requires the fact that radical of homogeneous ideal is still homogeneous (which we should give a proof here):

  Given any $sum_n x_n in sqrt(I)$, since there exists $k in NN$ where $(sum_n x_n)^k  in I$, if $x_i$ is the lowest degree element, then the lowest degree element of $(sum_n x_n)^k$ is $x_i^k$. Hence, this shows that $x_i^k in I$ (because $I$ is homogeneous, each homogeneous summand of an element in $I$ should be in $I$). Hence, one has $x_i in sqrt(I)$. Then, since $sum_n x_n - x_i in sqrt(I)$, one can inductively prove that each homogeneous summand is inside $sqrt(I)$. This enforces $sqrt(I) = plus.circle.big sqrt(I) sect S_n$ (since each homogeneous summand must be in there), proving the homogeneity.
]
Hence, we can once define the "topology" of $Proj(S)$ based on these closed set relations. As a remark, at this point of the note, we know nothing about its relation with the Zariski Topology on $Spec(S)$ (since $Proj(S) subset.eq Spec(S)$, it also has a subspace topology. Are these equal?) We'll come back to the questions later.

\ 

Here, let's also look at the open subsets: Similar to prime spectrum (where the basis elements can be chosen as $D(a)$ for  nonzero element $a$), we can define similar notion in projective space:
#definition["Fundamental" Open Subset of $Proj(S)$][
  Given an $NN$-graded ring $S$, and any homogeneous element $f in S_+$, the subset $D_+ (f) := Proj(S) \\ V((f))$ (where $(f)$ is generated by homogeneous element, hence a homogeneous prime ideal). 

  Another characterization is given as $D_+ (f) = $ all homogeneous prime ideal $P in Proj(S)$, such that $f in.not P$.
]
Which, as expected, they have the desired properties as basis elements:
#proposition("Basis for Projective Space")[
  The collection $D_+ (f)$ for homogeneous elements $f in S_+$ forms a basis for $Proj(S)$.
][
  It's just some routine check: For all homogeneous prime ideal $P in Proj(S)$, since $S_+ subset.eq.not P$, there exists homogeneous element $f in S_+ \\ P$, showing $P in D_+ (f)$. Hence, ${D_+ (f)}$ with all homogeneous element $f in S_+$ covers $Proj(S)$.

  \ 

  On the other hand, notice that $D_+ (f) sect D_+ (g) = D_+ (f g)$ for all homogeneous element $f,g in S_+$, since for any homogeneous prime ideal $P in Proj(S)$, one has $f g in.not P$ iff $f in.not P$ and $g in.not P$ by prime property. This shows the basis requirement.
]

\ 

Finally, we need to construct it structure sheaf also. Let's build up some definitions:
#definition["Local Ring" of a Homogeneous Prime Ideal][
  Given a homogeneous prime ideal $P in Proj(S)$, let $T$ be the collection of all homogeneous elements that're not in $P$ (which, the prime structure enforces $T$ to be multiplicatively closed), consider the ring $T^(-1)S$.
  
  Notice that $T^(-1)S = plus.circle.big_(n in ZZ)(T^(-1)S)_n$, where the degree $deg(s/t) = deg(s)-deg(t)$ for $s in S$ and $t in T$ (which is well-defined under localization, because if $s/f=s'/f'$, there exists $u in T$, such that $(s f'-s' f)u = 0$, causing $s f' u=s' f u$, or $deg(s)+deg(f')=deg(s f') = deg(s' f)=deg(s')+deg$). One can also check it's well-defined under addition and multiplication.

  Now, define the "local ring" $S_((P)):= (T^(-1)S)_0$.
]
Of course we need to check this:
#proposition[
  Given homogeneous prime ideal $P in Proj(S)$, then $S_((P))$ is a local ring, with maximal ideal $P^e sect (T^(-1)S)_0$.
][
  It's clear that $P^e$ is generated by all homogeneous elements $s/t$, where $s in P$ and $t in.not P$. As a result, $P^e sect (T^(-1)S)_0 = {s/f | s in P, f in T " homogeneous", deg(s)=deg(f)}$ (since one specifically need the degree to be $0$). More precisely, it should be the finite sum of them, but since sums preserve degree, it can be rewritten as the given form.

  \ 

  Now, to claim that this is the maximal ideal of $S_((P))$, it suffices to prove that other elements outside of this is a unit. But, this is basically by definition, since if $s/t in S_((P))\\(P^e sect (T^(-1)S)_0)$, one has $s in.not P$, so as a homogeneous element, one must have $s in.not P$, or $s in T$, showing $t/s$ is its inverse.
]

\ 

With this, we can define the structure sheaf as follow:
#definition[Structure Sheaf of $Proj(S)$][
  Given $X=Proj(S)$, define the structure sheaf (sheaf of rings) $cal(O)_X:O(X)^op-> Ab$ as follow:

  Given any open subset $U subset.eq X$, define $cal(O)_X (U):= {"functions "s:U -> union.sq.big_(P in U)S_((P))}$, that satisfies:
  1. Any $P in U$ has $s(P) in S_((P))$.
  2. Any $P in U$ has an open neighborhood $P in V subset.eq U$, such that there exits homogeneous elements $a, f in S$ with the same degree, and $f in.not Q$ for all $Q in V$, such that $s(Q) = a/f in S_((Q))$ for all $Q in V$.
]
Which, with restrictions as usual restrictions of domains, this is clearly a sheaf of abelian groups (and the image is clearly a ring). So, it remains to check the locally ringed space property on the stalk, and some other great nature:
#theorem("Structure of Projective Space")[
  Given an $NN$-graded ring $S$, let $X:= Proj(S)$ and $cal(O)_X$ denotes the sheafe defined above.
  1. For any homogeneous prime ideal $P in Proj(S)$, one has its stalk $cal(O)_(X,P) tilde.equiv S_((P))$.
  2. For any homogeneous element $f in S_+$, then $D_+(f)$ is an affine scheme, with $D_+(f) tilde.equiv Spec(S_((f)))$ (where $S_f$ is a $ZZ$-graded localization with $deg(s/f^n) := deg(s)-n$ for all homogeneous element $s in S$, and $S_((f)):= (S_f)_0$).
][
  1. Given any $s_P in cal(O)_(X,P)$, it has a representative $s in cal(O)_X (U)$ for some open neighborhood $U in.rev P$, define a ring homomorphism $phi:cal(O)_(X,P) -> S_((P))$ by $phi(s_P) := s(P)$ (which is well-defined since any two representatives must agree on some open neighborhood). It is both additive and multiplicative, since for any $s_P, t_P in cal(O)_(X,P)$, choose their representative on some common open neighborhood of $P$, then $phi(s_P+t_P) = (s+t)(P) = s(P)+t(P) = phi(s_P)+phi(t_P)$, and $phi(s_P dot t_P) = (s dot t)(P) = s(P) dot t(P) = phi(s_P) dot phi(t_P)$.

    \

    First, to claim surjectivity: Given any element $s/f in S_((P))$ (where $s,f in P$ are homogeneous elements of same degree, such that $f in.not P$), take the open neighborhood $D_+ (f) in.rev P$. Which, for any $Q in D_+ (f)$, since $f in.not Q$, then $s/f in S_((Q))$. Hence, define the function $psi_(s/f):D_+ (f) -> union.sq.big_(Q in D_+ (f))S_((Q))$ by $psi_(s/f)(Q) = s/f in S_((Q))$, one has $psi_(s/f)(P) = s/f in S_((P))$, showing $psi_(s/f) in cal(O)_X (D_+(f))$, and $phi((psi_(s/f))_P) = phi_(s/f)(P) = s/f in S_((P))$, proving surjectivity.

    \

    Now, to claim injectivity: Suppose the any $psi_P in cal(O)_(X,P)$ satisfies $phi(psi_P)=0$, then take a representative $psi in cal(O)_X (U)$ for some neighborhood $U in.rev P$, and restrict it to an open neighborhood $U supset.eq V in.rev P$, where there exists homogeneous element $s,f in S$ with the same degree, such that all homogeneous prime ideal $Q in V$ satisfies $f in.not Q$, and $psi(Q) = s/f in S_((Q))$.

    Which, if looking at $psi|_V in cal(O)_X (V)$ (for simplicity, let's denote as $psi...$), it has $psi(P) = s/f = 0 in S_((P))$. Hence, there exists homogeneous element $u in S\\P$, such that $(s dot 1-0 dot f)u = s u=0$. However, notice that $P in D_+ (u)$, and this statement is true for any homogeneous prime ideal $Q in V sect D_+ (u)$ (since $u in.not P$, then $s u=0$ implies $s/f =0 in S_((Q))$). Hence, one has $psi|_(V sect D_+ (u))=0$ (since all $Q in V sect D_+ (u)$ has $psi(Q) = s/f = 0$), showing that $psi|_(V sect D_+ (u))=0 in cal(O)_X (V sect D_+ (u))$. Hence, $psi_P = 0$ also, showing injectivity.

    \ 

    \ 

  2. We'll temporarily postpone this question, and prove some important tools for this first.
    /*The goal is to construct an isomorphism $(phi,phi^\#):D_+ (f) arrow.tilde Spec(S_((f)))$. For this, let's prove a lemma:

    #lemma[
      Let $S$ be a $ZZ$-graded ring, which contains a homogeneous element of positive degree, say $f$ (with degree $deg(f)=d>0$). Then, the map $phi: Proj(S) -> Sp(S_0)$ by $phi(P) = P sect S_0$ is a homeomorphism.
    ][

      First, let's prove it's well-defined: Given $P$ a homogeneous prime ideal, then given the inclusion $S_0 arrow.hook S$, one has the contraction of $P$ being $P sect S_0$. Hence, $P sect S_0$ is a prime ideal in $S_0$, showing $phi(P) in Spec(S_0)$.

      \ 

      Then, let's prove the map is in fact continuous: For this, we desire to prove that any prime ideal $P' in Spec(S_0)$ in fact extends to a "homogeneous" prime ideal in $S$ (under the inclusion morphism). Given any ideal $I subset.eq S_0$, which its inclusion as "set" $I subset S$ is consists of homogeneous elements with degree $0$, hence the ideal generated by that, say $I^e=I S$, is clearly homogeneous.

      Now, given any prime ideal $P' subset.eq S_0$, take its extension $P' S subset S$, since it's homogeneous, it's sufficient to check the prime property for homogeneous elements. Given any $a,b in S$ that's homogeneous, with $a b in P' S$. With $deg(a)=k$ and $deg(b)=l$. Take the element $a^d/f^k$ and $b^d/f^l$, notice both of them has degree $0$ (since $deg(a^d/f^k) = d dot deg(a)-k dot deg(f) = d k-k d=0$, similar for the other one), hence one has $a^d/f^k dot b^d/f^l = ((a b)^d)/f^(k+l) in P'$ (because $a b in P' S$, so is $((a b)^d)/f^(k+l)$; and in particular, it has degree $0$, hence in $P' S sect S_0 = P'$). This shows that either $a^d/f^k in P'$, or $b^d/f^l in P'$ by prime property.

      Then, this implies that either $a^d in P' S$, or $b^d in P' S$, hence $a in sqrt(P' S)$, or $b in sqrt(P' S)$; 
    ]*/
]

For the proof of 2, let's go back to the topology of $Proj(S)$: Notice that $Proj(S) arrow.hook Spec(S)$. As before, we can question if the subspace topology agrees with the induced topology.

#proposition("Agreement on the Topology")[
  Given the set inclusion $Proj(S) arrow.hook Spec(S)$, the subspace topology on $Proj(S)$ agrees with the "Zariski" topology on $Proj(S)$.
][
  First, given a homogeneous ideal $I$, and consider $V_+ (I) subset.eq Proj(S)$. Notice that $V_+ (I) = Proj(S) sect V(I)$ (since $Proj(S) sect V(I)$ is precisely all prime ideals containing $I$, that are also homogeneous), showing that $V_+ (I)$ is closed under subspace topology.

  \ 

  Now, given any ideal $I subset.eq S$, and consider $Proj(S) sect V(I)$, the goal is to show $Proj(S) sect V(I) = V_+ (J)$ for some homogeneous ideal $J$, to verify its closeness in $Proj(S)$. Consider $J := {a_n in S "homoegneous" | exists a in I, a = a_n+sum_(j!=n)a_j}$ (i.e. all the homogeneous summand of elements in $I$). Which, $J$ is an ideal (because $I$ is, so any $r in S$ and $a_n in J$ has $r a_n in J$, because if $a_n$ is a summand of $a in I$, so is $r a_n$ as a summand of $r a in I$). Given any homogeneous prime ideal $P$, one has $P in V_+ (J)$ (containing all homogeneous summand of elements in $I$) iff $P in Proj(S) sect V(I)$ (since $I subset.eq J$, $P in V_+ (J)$ implies $P in Proj(S) sect V(I)$ is clear; and, if $P in Proj(S) sect V(I)$, it must contain all homogeneous summands of elements in $I$, hence contain $J$, showing $P in V_+ (J)$). So, $V_+(J) = Proj(S) sect V(I)$, which is closed under the defined topology of $Proj(S)$.

  \ 

  Since the closed sets are equivalent, the subspace topology on $Proj(S)$ agrees with its defining topology.
]
#corollary[
  The inclusion $Proj(S) arrow.hook Spec(S)$ is continuous. Moreover, given the inclusion ring homomorphism $iota:S_0 arrow.hook S$, it generates a continuous map $pi:Spec(S) -> Spec(S_0)$. Which, the composition $phi:Proj(S) -> Spec(S_0)$ gives precisely $phi(P) = P pi(P) = P sect S_0$, hence $phi:Proj(S) -> Spec(S_0)$ is continuous.

  #set align(center)
  #diagram($
             Proj(S) edge("rr",->, script(phi)) edge("dr", "hook->") && Spec(S_0)\
             & Spec(S) edge("ur", ->, script(pi), #right)
           $)
  #set align(left)
][]

\ 

Another piece of tool with this regards the $ZZ$-graded rings (since the localization by some homogeneous elements necessarily generate a $ZZ$-grading), which has the following characterization:
#proposition[
  Let $S$ be a $ZZ$-graded ring, and take some invertible homogeneous element $f in S$ with $deg(f)=d>0$. Then, with $ZZ Proj(S):= $ all homogeneous prime ideals in $Spec(S)$, then the continuous map $phi:ZZ Proj(S) -> Spec(S_0)$ by $phi(P) = P sect S_0$ is a homeomorphism.
][
  First, let's explain the map a bit: Here we regard $ZZ Proj(S)$ as subspace of $Spec(S)$ (Note: $Proj(S)$ is only defined for $S$ with $NN$-grading, so here all homogeneous prime ideal for $S$ -- a $ZZ$-graded ring -- needs a distinction notation wise). Which, one constructs the following commutative diagram:

  #set align(center)
  #diagram($
             ZZ Proj(S) edge("rr",->, script(phi)) edge("dr", "hook->") && Spec(S_0)\
             & Spec(S) edge("ur", ->, script(pi), #right)
           $)
  #set align(left)

  This is the appearance of the desired continuous map.

  \ 

  To prove injectivity, suppose two homogeneous prime ideals $P, Q in ZZ Proj(S)$ satisfies $phi(P)=phi(Q)$ (or $P sect S_0=Q sect S_0$), we'll verify that $P sect S_n = Q sect S_n$ for all integer $n in ZZ$.

  Take any homogeneous element $a_n in P sect S_n$, notice that $a_n^d/f^n$ has degree $0$, hence $a_n^d/f_n in P sect S_0 = Q sect S_0$, which enforces $a_n^d/f^n in Q$, implying $a_n^d in Q$, and $a_n in Q$ by prime property. 

  Repeating this prove with $a_n in Q sect S_n$ implies $P sect S_n=Q sect S_n$, then the homogeneous ideal property implies $P = plus.circle.big_(n in ZZ)P sect S_n=plus.circle.big_(n in ZZ)Q sect S_n = Q$. This shows injectivity.

  \ 

  To prove surjectivity, given any prime ideal $P' subset.eq S_0$, we take its extension $P' S subset.eq S$, the goal is claiming $P' S$ is prime. Since $P' S$ is generated by $P' subset.eq S_0$ (i.e. a bunch of homogeneous element), then $P' S$ is definitely homogeneous.

  Now, to check prime property, it suffices to check for the homogeneous elements: Suppose $a,b in S$ are homogeneous elements with $a b in P' S$. Denote $deg(a)=k, deg(b)=l$. Then, notice that $a^d/f^k, b^d/f^l$ are both degree $0$ elements, and one has $ a^d/f^k dot b^d/f^l = ((a b)^d)/f^(k+l) in P' S sect S_0 = P'$. Hence, by prime property of $P' subset.eq S_0$, this enforces either $a^d/f^k in P'$, or $b^d/f^l in P'$, and further implies $a^d in P' S$, or $b^d in P' S$. This shows that either $a in sqrt(P' S)$ or $b in sqrt(P' S)$.

  Notice the following: $P' S subset.eq sqrt(P' S)$ implies $P' = P' S sect S_0 subset.eq sqrt(P' S) sect S_0$, but for any $a_0 in sqrt(P' S) sect S_0$, since for some power $r in NN$, one has $a_0^r in P' S sect S_0 = P'$ (in $P' S$ is by radical property; in $S_0$ because it's degree $0$), hence one has $a_0 in P'$, showing $sqrt(P' S) sect S_0 = P'$.

  However, $sqrt(P' S)$ is in fact homogeneous prime (since $P' S$ is homogeneous, so is its radical; also, given any homogeneous element $a,b in S$ has $a b in sqrt(P' S)$, by powering them suitably, one can assume $a^m, b^n in P'S$, then apply the proof one can deduce $a^m in sqrt(P' S)$ or $b^n in sqrt(P'S)$, which the radical property enforces $a in sqrt(P' S)$ or $b in sqrt(P' S)$). Hence, one has $phi(sqrt(P' S)) = sqrt(P' S) sect S_0= P'$, showing $phi$ is surjective.

  \ 

  Finally, to prove it's homeomorphism, one just needs $phi$ to be an open map (and moreover, suffices for the basis subsets $D_+ (g)$ for nonzero homogeneous element $g$).

  Given any $P in D_+ (g)$, since $g in.not P$, one has any $g^n in.not P$ by prime property. Then, in particular with $deg(g)=k$, one had $g^d/f^l$ being degree $0$ (in $S_0$), and causing $g^d/f^l in.not P sect S_0 = phi(P)$. As a result, one has $phi(D_+ (g)) subset.eq D(g^d/f^l)$.

  Conversely, if prime ideal $P' subset.eq S_0$ has $P' in.not D(g^d/f^l)$, then $phi^(-1)(P') in D_+ (g)$ (because if $g in phi^(-1)(P)$, then $g^d/f^l in phi^(-1)(P) sect S_0 = phi(phi^(-1)(P'))= P'$). This shows that $D(g^d/f^l) = phi(D_+ (g))$, proving the open mapping property.
]

Finally, we can prove 2 in the theorem on the structure of Projective Space:

#proposition[
  Given any homogeneous element $f in S_+$, one has $(D_+ (f), cal(O)_(D_+ (f))) tilde.equiv (Spec(S_((f))), cal(O)_X)$ as locally ringed space.  In particular, the isomorphism is given by $P mapsto P S_f sect S_((f))$.
][
  #text(weight: "bold")[Topological Homeomorphism:]

  We know for any homogeneous element $f in S_+$ (in particular, $deg(f)>0$), one has $S_f$ being a $ZZ$-graded ring such that $f in S_f$ has positive degree. Hence, one has $ZZ Proj(S_f) tilde.equiv Spec(S_((f)))$ as topological spaces (via the assignment $Q mapsto Q sect S_((f))$). 

  \

  Which, notice that the ring homomorphism $p:S -> S_f$ preserves the grading (a graded ring homomorphism), then in particular the contraction or extension of homogeneous ideals remain homogeneous. Then, notice that there is a one-to-one correspondance between $D_+ (f) subset.eq Proj(S)$ and $ZZ Proj(S_f)$ (using the one-to-one correspondance of prime ideals in localization $S_f$ versus the prime ideals not intersecting the multiplicative subset ${f^n | n in NN}$, together with the preservation of homogeneous ideals under extension/contraction). So, the induced map $Spec(S_f)-> Spec(S)$ restricts to $ZZ Proj(S_f) -> D_+ (f)$ as a bijection. 

  \
  
  To prove that they're homeomorphic, it suffices to prove the restriction $ZZ Proj(S_f) -> D_+ (f)$ is an open map, but notice the machinery for "fundamental" open subsets $D_+ (g)$ still apply for $ZZ Proj(S_f)$ (except now we need to consider all nonzero homogeneous elements $g in S_f$), which for any homogeneous element $s in S$, the element $s/f^n$ satisfies $P in D_+ (s/f^n)$ iff $p^(-1)(P) in D_+ (s)$ (since $s in p^(-1)(P)$ implies $s/1 in P$, so $s/f^n in P$; conversely, if $s in.not p^(-1)(P)$, then $s/1 in.not P$, showing $s/f^n in.not P$). This shows that under the map $ZZ Proj(S_f) -> D_+ (f)$, one has $D_+ (s/f^n) mapsto D_+ (s) sect D_+ (f)$ (which is open), proving the open mapping property.

  \ 

  \ 

  #text(weight: "bold")[Sheaf Isomorphism:]

  We've just proved the topological homeomorphism $D_+ (f) tilde.equiv ZZ Proj(S_f) tilde.equiv Spec(S_((f)))$ (via the map $P mapsto P S_f sect S_((f))$). Here, denote the map as $phi:D_+ (f) arrow.tilde Spec(S_((f)))$. 
  
  To prove the sheaf isomorphism (since they're now over the same topological space, up to homeomorphism), it suffices to prove the isomorphism on stalks.

  \ 

  Remember that given $X = D_+ (f)$ and any $P in X$, one has $cal(O)_(X,P) = S_((P))$ (since $cal(O)_X$ is the restricted sheaf from $Proj(S)$, and such relation is proven for $Proj(S)$'s sheaf). On the other hand, notice that with $Y = Spec(S_((f)))$, one has $cal(O)_(Y, phi(P)) = (S_((f)))_(phi(P))$ by the spectrum's structure sheaf.

  Now, notice that one can construct an isomorphism between the two local rings: Since the homogeneous element $f in.not P$, there is an induced graded ring homomorphism $S_f -> T^(-1)S$ by $s/f^n mapsto s/f^n$ (where $T$ is the set of homogeneous elements not in $P$), and in particular the $0$-grading has a homomorphism $S_((f))-> S_((P))$, again by $s/f^n$. 

  Then, since $phi(P) subset.eq S_((f))$ has all element of the form $p/f^n$ for homogeneous element $p in P$, such that $p/f^n$ has degree $0$, conversely $S_((f))\\phi(P)$ consists of $u/f^m$, where the homogeneous element $u in S\\P$ has $u/f^m$ with degree $0$. As a result, its image $u/f^m in S_((P))$ is invertible (since $u$ is in $S_((P))$)
]
