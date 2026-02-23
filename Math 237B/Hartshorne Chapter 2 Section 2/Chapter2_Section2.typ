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
  title: "Hartshorne Chapter 2 Section 2: Schemes",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline(title: "Table of Content:")

The goal for this section is to understand the notion of schemes - a generalization of the algebraic sets that was used to be defined in a more embedding sense, using the notion of sheaves, rings, and local rings.

= Affine Schemes

Before starting, let's review some notion on the spectrum of a commutative ring:
#definition[Spectrum of a Commutative Ring][
  Given a commutative ring $A$, its prime spectrum $Spec(A)$ is defined to be all the prime ideals $P subset.eq A$. Similarly, a maximal spectrum $upright("Max")Spec(A)$ is defined to be all the maximal ideals $M subset.eq A$.
]

#defn["Closed" Sets in Spectrum][
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

\ 

With these definitions, one can form some categories consisting of relevant objects:
#definition[Category of Ringed Space][
  A #text(weight: "bold")[Ringed Space] is a pair $(X, cal(O)_X)$, where $X$ is a topological space, and $cal(O)_X$ is its structure sheaf (sheaf of ring). 

  A #text(weight: "bold")[morphism] of ringed spaces $(f,f^\#):(X, cal(O)_X) -> (Y, cal(O)_Y)$ consists of a continuous map $f:X -> Y$, and morphism of sheaves $f^\#:cal(O)_Y -> f_* cal(O)_X$ of sheaves of rings on $Y$.

  Together, this forms a category of Ringed Spaces.
]

For extra constraints, we also want to restrict the stalks:
#definition[Category of Locally Ringed Space][
  One define a ringed space $(X,cal(O)_X)$ as a #text(weight: "bold")[Locally Ringed Space], if for each point $P in X$, the stalk $cal(O)_(X,P)$ is a local ring.

  Also, a morphism $(f,f^\#):(X, cal(O)_X)-> (Y, cal(O)_Y)$ is a #text(weight: "bold")[morphism of Locally Ringed Space], if the induced homomorphism $overline(f^\#):cal(O)_(Y,f(P)) -> f_* cal(O)_(X,P)$ is a #emph[local homomorphism] of local rings.
]

For clarification, first let's explain the construction of the morphisms on stalks: Given any open subset $V subset.eq Y$, one has $V in.rev f(P)$ implies $f^(-1)(V) in.rev P$. Hence, if consider the direct limit over a system of $V in.rev f(P)$, hen one has a ring homomorphism $cal(O)_(Y, f(P)) -> lim_(V in.rev f(P))cal(O)_X (f^(-1)(V))$. Which, because the directed system span over a subportion of all $f_* cal(O)_X (V) = cal(O)(f^(-1)(V))$ (with $f^(-1)(V) in.rev P$), one generates a ring homomorphis $lim_(V in.rev f(P))cal(O)_X (f^(-1)(V)) -> f_* cal(O)_(X,P)$. Which, the composition generates the desired orphism on stalks.

Also, given $A,B$ two local rings (wht $m_A, m_B$ the maximal ideals respectively), a ring homomorphism $f:A->B$ is called a #emph[local homomorphism] if $phi^(-1)(m_B) = m_A$ (or equivalently, one has $m_A^e subset.eq m_B$).

\ 

As a side note, within this category, $(f,f^\#)$ is an isomorphism (with two-sided inverse) iff $f$ is a topological homeomorphism, with $f^\#$ being an isomorphism of sheaves.

