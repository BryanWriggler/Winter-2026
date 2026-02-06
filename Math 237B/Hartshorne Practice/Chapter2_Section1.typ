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
  title: "Hartshorne Chapter 2 Section 1: Sheaves",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

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

= Stalks and Direct Limits

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

  To show it's indeed a colimit of the given functor, suppose $B$ is another abelian group with group homomorphisms $g_i:A_i -> B$ that forms a cocone of the given functor
]
