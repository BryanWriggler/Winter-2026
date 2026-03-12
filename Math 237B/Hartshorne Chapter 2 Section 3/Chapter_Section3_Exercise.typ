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
  title: "Hartshorne Chapter 2 Section 3 Practice (So hard...)",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= 3.1 (HD)
#problem[
  Show that a morphism $f:X->Y$ is locally of finite type iff for every open affine subset $V=Spec(B)$ of $Y$, $f^(-1)(V)$ can be covered by open affine subsets $U_j=Spec(A_j)$, where each $A_j$ is a finitely generated $B$-algebra.
][
  First, let's prove that we can have "common" fundamental opens for intersection of affine spaces (as this will make things a lot easier). 
  #prop[
    Given $U=Spec(A)$ and $V=Spec(B)$, for any point $x in U sect V$, there exists affine neighborhood of both some localization of $A,B$.
  ][
    For any $x in U sect V$, there exists $f in A$, such that $x in D(f) subset.eq U sect V$ (since it's open in $U=Spec(A)$); now, since $D(f)$ is open in $U sect V subset.eq V$, there exists $g in B$, such that $x in D(g) subset.eq D(f) " " (subset.eq U sect V) subset.eq V$. As a result, these inclusions (of affine neighborhoods) generates ring homomorphisms $B xarrow(phi) A_f xarrow(psi) B_g$.

    Now, let $g' in A_f$ be the image of $g$ under $phi:B->A_f$. Notice that under $psi:A_f -> B_g$, we in fact has the inclusion $D(g) arrow.hook D(f)$ having the image being $D(g')$ (and is homeomorphic): For any prime $P subset.eq B_g$, notice that $g in.not phi^(-1)compose psi^(-1)(P)$ (since $psi compose phi:B->B_g$ is the localization map, which cannot contain any inverted elements), hence one has $g' in.not psi^(-1)(P)$, showing $psi^(-1)(P) in D(g')$; conversely, if $psi^(-1)(P) in D(g')$, it's clear that $g in.not P$ (as $g$ is invertible in $B_g$, it'll make $P$ a unit ideal, and the contraction $psi^(-1)(P)$ will no longer be prime).

    Hence, $D(g) arrow.hook D(f)$ has image precisely all prime ideals of $A_f$ that doesn't contain $g'$, or $D(g) tilde.equiv D(g')$ as topological spaces (where $D(g) tilde.equiv Spec(B_g)$ and $D(g') tilde.equiv Spec((A_f)_g') = Spec(A_(f g'))$).

    This shows that the open subset can be $D(g)$ (fundamental open in $V=Spec(B)$) or $D(g')$ (being $D(f g') subset.eq Spec(A)$, also fundamental opens). Which, the sheaf condition enforces their sheaf structure to be compatible, showing the two rings must be isomorphic.
  ]

  \ 

  For the actual proof, Let's try and restrict to these fundamental open subsets: Given $V_i tilde.equiv Spec(B_i)$ that covers $Y$, such that each $f^(-1)(V_i)=union.big_j U_(i j)$ (each $U_(i j) tilde.equiv Spec(A_(i j))$, where $A_(i j)$ is finitely generated $B_i$-algebra).

  Take any $V tilde.equiv Spec(B)$, since $V = union.big_(i)V sect V_i$, based on the previous proposition, it is intersection of "double fundamental opens" (which are fundamental opens in both $V$ and $V_i$), which $V = union.big_i union.big_j W_(i k)$ (where $W_(i k) = D(f_(i k)) subset.eq V$ and $=D(g_(i k)) subset.eq V_i$).

  Now, take each $f^(-1)(W_(i k)) subset.eq f^(-1)(V_i) = union.big U_(i j)$, then each $f^(-1)(W_(i k)) = union.big f^(-1)(W_(i k)) sect U_(i j)$, each $f^(-1)(W_(i k)) sect U_(i j)$ open in $U_(i j)=Spec(A_(i j))$, which can be represented as unions of fundamental opens, say $f^(-1)(W_(i k)) sect U_(i j)=union.big D(h_(i j l))$ (for $h_(i j l) in A_(i j)$).

  \ 

  This results in the following morphism of schemes: 
  #set align(center)
  #diagram($
             U_(i j) = Spec(A_(i j)) edge(->) & V_i = Spec(B_i)\ 
             D(h_(i j l)) edge("u",->) edge(->) & W_(i k) = D(f_(i k)) edge("u",->)
           $)
  #set align(left)
  Which, it reverses to the following commutative diagram of ring homomorphisms:
  #set align(center)
  #diagram($
             A_(i j) edge(<-) & B_i\ 
             (A_(i j))_(h_(i j l)) edge("u",<-) edge(<-) & B_(f_(i k)) edge("u",<-)
           $)
  #set align(left)
  Since $(A_(i j))_(h_(i j l))$ is a finitely generated $A_(i j)$-algebra, while $A_(i j)$ is a finitely generated $B_i$-algebra, then $(A_(i j))_(h_(i j l))$ is a finitely generated $B_i$-algebra also.

  Similarly, it can also be realized as a finitely generated $B_(f_(i k))$-algebra (while $B_(f_(i k))$ is a finitely generated $B$-algebra). Hence, each $(A_(i j))_(h_(i j l))$ is a finitely generated $B$-algebra.

  This proves that $f^(-1)(V) = union.big_i union.big_k f^(-1)(W_(i k)) = union.big_i union.big_k D(h_(i j l))$, where each $D(h_(i j l))=Spec((A_(i j))_(h_(i j l)))$ is affine, with the ring be finitely generated $B$-algebra.
]

#pagebreak()

= 3.2 (D)//1
#problem[
  A morphism $f:X->Y$ of schemes is quasi-compact if there is a cover of $Y$ by open affines $V_i$ such that $f^(-1)(V_i)$ is quasi-compact for each $i$. Show that $f$ is quasi-compact iff every open affine subset $V subset.eq Y$, $f^(-1)(V)$ is quasi-compact.
][
  It'll be the best if we can reduce to affine cases (in particular, the fundamental open subsets).

  \ 

  Given that $V tilde.equiv Spec(B)$, and the affine cover has each $V_i tilde.equiv Spec(B_i)$. 
  
  First, let's consider the fundamental opens within the nice affine spaces: Given any $g in B_i$, consider $D(g) subset.eq V_i = Spec(B_i)$, we ought to show that $f^(-1)(D(g))$ is also compact.

  By intersecting with suitable affine neighborhoods $U_j$, in each intersection $f^(-1)(V_i) sect U_j$ is open in $U_j$ affine, hence it's a union of affine open subsets, showing $f^(-1)(V_i)$ has an affine cover. Then, by compactness one has $f^(-1)(V_i) = union.big_(j=1)^n U_j$, each $U_j tilde.equiv Spec(A_j)$.

  Then, the map's restriction has $f|_(U_j):U_j -> V_i$, which induces ring homomorphism $A_j <- B_i$. Then, notice that with $g in B_i$, its image in $A_j$ (denoted as $g_j in A_j$) satisfies $D(g_j) subset.eq (f|_(U_j))^(-1)(D(g))$, since any prime ideal $P in D(g_j)$ has $g_j in.not P subset.eq A_j$, the contraction has $g in.not P^c subset.eq B_i$ (or else $g in P^c ==> g_j in P^(c e)subset.eq P$ a contradiction); conversely, if $g in.not P^c subset.eq B_i$, then of course $g_j in.not P subset.eq A_j$, showing that $f^(-1)(D(g)) sect U_j = (f|_(U_j))^(-1)(D(g)) = D(g_j)$.

  Hence, we have $f^(-1)(D(g)) = union.big_(j=1)^n f^(-1)(D(g)) sect U_j = union.big_(j=1)^n D(g_j)$, which is finite union of affine spaces (each affine spaces is quasi-compact), hence $f^(-1)(D(g))$ itself is quasi-compact.

  \ 

  Now, it suffices to express $V=Spec(B)$ as finite union of above fundamental open subsets of each $V_i = Spec(B_i)$'s: Since $V = union.big_(i)V sect V_i$, each $V sect V_i$ is open in $V_i$, hence there exists ${f^((i))_(j)}_(j in I_j) subset B_i$, such that $V sect V_i = union.big_(j in I_j)D(f^((i))_j)$. The previous proof guarantees each $f^(-1)(D(f^((i))_j))$ is quasi-compact. 
  
  As a result, $V = union.big_(i)union.big_(j in I_j)D(f^((i))_j)$. Now, use the quasi-compactness of $V=Spec(B)$, there exists finitely many such element, say with indices $i_1,...,i_n$ for $V_(i_k)$, and each $i_k$ has $j_1,...,j_(l_k)$ for $f^((i_k))_(j_(l))$, such that the following holds:
  $ V = union.big_(k=1)^n union.big_(l=1)^(l_k)D(f^((i_k))_(j_(l))) $
  Hence, with each fundamental opens (in different $V_i$'s potentially) having preimage being quasi-compact, so is $f^(-1)(V) = union.big_(k=1)^n union.big_(l=1)^(l_k)f^(-1)(D(f^((i_k))_(j_(l))))$.
]

#pagebreak()

= 3.3 (D)

#problem[
  + Show that a morphism $f:X->Y$ is of finite type iff it's locally of finite type and quasi-compact.
  + Conclude from this that $f$ is of finite type iff every open affine subset $V=Spec(B)$ of $Y$, $f^(-1)(V)$ can be covered by a finite number of open affines $U_j=Spec(A_j)$, where each $A_j$ is a finitely generated $B$-algebra.
  + Show also if $f$ is of finite type, then for every open affine subset $V=Spec(B) subset.eq Y$, and for every open affine subset $U=Spec(A) subset.eq f^(-1)(V)$, $A$ is a finitely generated $B$-algebra.
][
  + Suppose it's locally of finite type and quasi-compact, then there exists $Y$'s affine cover ${V_i}$ (each $V_i = Spec(B_i)$), such that each $f^(-1)(V_i) = union.big_i U_(i j)$ (where each $U_(i j)=Spec(A_(i j))$ such that $A_(i j)$ is finitely generated $B_i$-algebra). But, quasi-compactness guarantees each $f^(-1)(V_i)$ to be quasi-compact, hence the $union_i U_(i j)$ can be chosen as finitely many. This shows $f$ is of finite type.

    \

    conversely, if the morphism $f:X->Y$ is of finite type, it's clear it is locally of finite type; also, each $V_i$ affine for the finite type construction, since $f^(-1)(V_i)= union.big_(j=1)^n U_(i j)$ for some affine open subsets (so each $U_(i j)$ is quasi-compact), then in particular $f^(-1)(V_i)$ is quasi-compact. Hence, the ${V_i}$ (affine cover of $Y$) has $f^(-1)(V_i)$ being quasi-compact.

    \ 

    \ 

  + Using the first condition (+ previous problems), $f$ is of finite type $<==>$ it's locally finite type + quasi-compact $<==>$ all $V subset.eq Y$ affine has $f^(-1)(V)$ quasi-compact + covered by finitely many affine neighborhood of $X$, while each affine neighborhood is associated as a finitely generated $cal(O)(V) = B$-algebra.

    \
    
    \ 

  + From previous part, we know $U = union.big_(j=1)^n U sect U_(i j)$ (which is open in $U_(i j)$), then let $U sect U_(i j) = union.big_(k)D(h_(i j k))$ (where each $h_(i j k) in A$, and $D(h_(i j k))$ can also be interpreted as spectrum of finitely generated $A_(i j)$-algebra for $U=Spec(A_(i j))$, hence also a finitely-generated $B$-algebra by finteness).

    Then, by quasi-compactness of $U$ as affine space, there exists $h_(i j 1),...,h_(i j l) in A$, such that $A_(h_(i j k))$ is a finitely-generated $B$-algebra (together with $U = Spec(A) = union.big_(k=1)^l D(h_(i j k))$, sp $(h_(i j 1),...,h_(i j l))=A$, further on denoted as $h_1,...,h_l in A$). The goal is showing $B-> A-> A_(h_k)$ induces finitely generated $A$-algebra, and these finite elements generate $A$, then $A$ must itself be finitely generated $B$-algebra.

    This is a theorem / lemma we've "talked" about in class, but I think I understand the proof now (check the album!)
]

#pagebreak()

= 3.4 (ND)

#problem[
  Show that a morphism $f:X->Y$ is finite iff for every open affine subset $V=Spec(B)$ of $Y$, $f^(-1)(V)$ is affine, equal to $Spec(A)$, where $A$ is a finite $B$-module.
][
  Recall the definition of finite morphism: there exists affine cover ${V_i}$ of $Y$ (each $V_i = Spec(A_i)$), such that $f^(-1)(V_i) subset.eq X$ is affine (each $f^(-1)(V_i)=Spec(B_i)$), such that $phi_i:A_i -> B_i$ realizes it as a finitely generated $A_i$-module.

  \ 

  For any $V subset.eq Y$ that's affine open (say $V tilde.equiv Spec(A)$), we have $V = union.big_i V sect V_i$, which let's collect each $V sect V_i = union.big_j D(f_(i j))$ for $f_(i j) in A$ (and in the way such that $D(f_(i j))$ is also fundamental open subset of $V_i$, so one can also view $f_(i j) in V_i$). Which, by the quasi-compactness of $V$ itself, we can choose finitely many $i_1,...,i_n$, each pair up with $j_1,...,j_(i_l)$
  
  Then, notice the maps between affine subsets carries fundamental open subsets to fundamental open subsets (i.e. if $phi:A->B$ is the ring homomorphism, the induced scheme morphism $phi^*:Spec(B)->Spec(A)$ satisfies $(phi^*)^(-1)(D(a)) = D(phi(a))$, which is really surprising), as any prime ideal $P subset.eq B$ has $P in (phi^*)^(-1)(D(a))$ iff $a in.not P^c subset.eq A$ iff $phi(a) in.not P$.

  \ 

  Then, given the morphism $f:f^(-1)(V_i)-> V_i$, one has $f^(-1)(D(f_(i j))) = D(phi_i (f_(i j)))$ (where $D(f_(i j)) tilde.equiv Spec(A_(f_(i j))) tilde.equiv Spec((A_i)_(f_(i j)))$, and $D(phi_i (f_(i j))) tilde.equiv Spec((B_i)_(phi_i (f_(i j))))$)
]

#pagebreak()

= 3.5 (ND)

#pagebreak()

= 3.16 (ND)
#problem[
  (Noetherian Induction). Let $X$ be a Noetherian topological space, and let $cal(P)$ be a property of closed subsets of $X$. Assume that for any closed subset $Y$ of $X$, if $cal(P)$ holds for every proper closed subset of $Y$, then $cal(P)$ holds for $Y$ (in particular, $cal(P)$ hold for the empty set). Then, $cal(P)$ holds for $X$.
][]

\ 

= 3.17 (ND)
#problem[
  A topological space $X$ is a "Zariski Space" if it is Noetherian and every (nonempty) closed irreducible subset has a unique generic point.

  EX: $R$ a discrete valuation ring, and $T=Spec(R) = {x_0,x_1}$, then zero ideal $x_1$ is its generic point, the maximal ideal $x_0$ is its closed point. 
  + Show that if $X$ is a Noetherian Scheme, then $X$ is a Zariski Space.
  + Show that any minimal nonempty closed subset of a Zariski Space consists of one point, called "closed points".
  + Show that Zariski space satisfies the $T_0$ axioms: Given any two distinct points of $X$, there is an open set containing one but not the other.
  + If $X$ is an irreducible Zariski space, then its generic point is contained in every nonempty open subset of $X$.
  + If $x_0,x_1 in X$, and if $x_0 in overline({x_1})$, then we say that $x_1$ specializes $x_0$, or $x_0$ is a "specialization" of $x_1$ (or $x_1$ is a "generalization" of $x_0$). 

    Let $X$ be a Zariski space, show tha tthe minimal points, for the partial ordering determined by $x_1>x_0$ iff $x_1$ specializes $x_0$, are closed points, and the maximal points are the generic points of the irreducible components of $X$. Show also that the closed subset contains every specialization of any of its point (Note: Closed sets are "stable under specialization", and open subsets are "stable under generization"). 
][
  + If $X$ is a Noetherian Scheme, 

    \ 

  + If a closed subset $T$ is minimal and nonempty, it is automatically irreducible. Hence, by definition it contains a generic point $t$ (such that its closure is the whole set). But, if $T$ is not singleton, we can find some other point $x in T$, since it's not generic, then $overline({x}) subset.neq T$ is proper, contradicting the minimality of $T$ as closed subsets.

    \ 

  + If the two point chosen (say $x,y$) has one point being a closed point (say $x$), then take the complement of the closed point $X\\{x}$, it's an open subset containing $y$, but not $x$.

    \ 

    Now, if both are not closed point, consider $overline({x})$: If this doesn't contain $y$, then $X\\overline({x})$ provides the open subset of $y$ not containing $x$; else if it contains $y$, since $x$ is irreducible, its closure $overline({x})$ is also irreducible. By the Zariski Space axiom, $x$ is the unique generic point of $overline({x})$, hence showing $overline({y}) subset.neq overline({x})$ is proper, in particular $x in.not overline({y})$. Then, $X\\overline({y})$ is an open subset of $x$ not containing $y$.

    This proves the $T_0$ separation axiom.

    \

  + This one can be easily deduced by contradiction: Suppose there exists a nonempty open subset $U subset.eq X$ such that the generic point $t in.not U$, then $t in X\\U$, so $X=overline({t}) subset.eq X\\U subset.neq X$ which is a contradiction. So, $t$ must be inside all open subset.

    \ 

  + 
]