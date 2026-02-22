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
  title: "Hartshorne Chapter 2 Section 1 Practice",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(a)")

= D//1
#problem[
  Let $A$ be an abelian group, and define the #emph[constant presheaf] associated to $A$ on the topological space $X$ to be the presheaf $U mapsto A$ for all $U != emptyset$, with the restriction maps be the identity. Show that the constant sheaf is the sheafification this presheaf.
][
  Here, can assume $A!=0$ (as the zero case is always a sheaf regardless, in fact the initial / final object in $Sh(X)$).


  Let $C_A:O(X)^op -> Ab$ be the constant presheaf $C_A (U)=A$ for all nonempty open subset $U subset.eq X$ (and $C_A (emptyset) = 0$). Even though the condition is stronger than the one given in Krishna's class, it's still not a sheaf in general: Given $U,V subset.eq X$ two nonempty open subsets such that $U sect V = emptyset$. Then, for any distinct $a,b in A$, let $a in F(U)$ and $b in F(V)$, then their restriction onto the intersection is $a|_(U sect V) = 0 = b|_(U sect V)$, which they always agree on the intersection.

  Yet, there doesn't exist any $c in F(U union V)$, such that $c|_U=a$ and $c|_V= b$ (as the restriction should keep $c$). So, in general the gluing condition fails.

  \ 

  Now, to consider its sheafification, let's first talk about its stalks: Given any $x in X$, notice the stalk $(C_A)_x = A$,since given any open neighborhood $U,V subset.eq X$ of $x$, any $a in F(U) = A$ and $b in F(V) = A$ are equivalent iff there exists $c in F(W)$ for some open subset $W subset.eq U sect V$, such that $a|_W = c = b|_W$. Yet, with all restriction of nonempty open subsets being identity, one has $a=b=c$. Now, notice that any open neighborhood of $x$ has nontrivial intersection, so one has $a in F(U)$ and $b in F(V)$ satisfies $a tilde b$ iff $a=b$, hence the direct limit is $A$ itself.

  So, the sheafification $(C_A)^Sh (U) = {"functions "s:U -> union.sq.big_(x in U)F_x = union.sq.big_(x in U)A}$ can be thought of as all functions $s:U -> A$, such that all $x in U$ has some open neighborhood $x in V subset.eq U$ and element $t in F(V) = A$, such that all $y in V$ satisfies $s(y) = t_y = t$.

  \ 

  Notice that this implies all functions in $(C_A)^Sh (U)$ is locally constant. Which, we claim that if $A$ endows with discrete topology, then the set $C_A^Sh (U)$ is precisely $Hom_(Top)(U, A)$:

  - Suppose $s in C_A^Sh (U)$, then for any element $a subset.eq A$, one has any $x in s^(-1)(a)$ having some open neighborhood $x in V_x subset.eq X$, and some $t in F(V_x)$, such that $s(y) = t_y = t in A$ for all $y in V$. As a result, $a = s(x) = t$, so one has $V_x subset.eq s^(-1)(a)$, showing the openness of $s^(-1)(a)$.

    Then, since all open subsets in $A$ are union of singletons, then any subset $V subset.eq A$ (which is open) automatically has $s^(-1)(V)$ being open (as it's union of $s^(-1)(a)$, $a in V$). This shows that $s$ is continuous, or $C_A^Sh (U) subset.eq Hom_(Top)(U,A)$.

    \ 

  - Suppose $s in Hom_(Top)(U,A)$, then it's clear that all $x in U$ has $s(x) in A = F_x$; on the other hand, let $a:= s(x)$, and consider the open subset $x in s^(-1)(a) subset.eq U$: Take $a in F(s^(-1)(a))$, one automatically has all $y in s^(-1)(a)$ satisfies $s(y) = a = a_y in F_y$, so the condition for $C_A^Sh (U)$ is trivially satisfied. Hence, $Hom_(Top)(U,A) subset.eq C_A^Sh (U)$.

  This proves that the constant sheaf $C_A^Sh (\_) = Hom_(Top)(\_, A)$ as functor.
]

#pagebreak()

= HD (Exact Sequence Condition in Sheaves)//2
For this, there are still some more clarifications: For instance, an exact sequence of presheaves, why does it preserve direct limit in general?
#problem[
  + For any morphism of sheaves on $X$, say $phi:F -> G$, show that for each point $P in X$,$Ker(phi)_P tilde.equiv ker(phi_P)$, and $Im(phi)_P tilde.equiv im(phi_P)$.
  + Show that $phi$ is injective (resp., surjective) iff the induced map on the stalks $phi_P$ is injective (resp., surjective) for all $P$.
  + Show that a sequence $F -> G -> H$ of sheaves and morphisms is exact iff for each $P in X$ the corresponding sequence of stalks is exact as a sequence of abelian groups. 
][
  Here, we'll use capital letter for the case in sheaves, and lower case letter for the case in abelian groups.

  \ 

  + #text(weight: "bold")[Kernel:]

    For the kernel part it's relatively easy, as ther kernel in $PreSh(X)$ and $Sh(X)$ agrees with each other. Consider $Ker(phi)_P = lim_(U in.rev P)Ker(phi(U))$ (where $Ker(phi(U)) subset.eq F(U)$ as set kernel of $phi(U)$). Now, consider the following diagram for all $P in U$:
    #set align(center)
    #diagram($
               F(U) edge(->,script(phi(U))) edge("d",->, script(pi_F)) & G(U) edge("d", ->, script(pi_G))\ 
               F_p edge(->, script(phi_P), #right) & G_P
             $)
    #set align(left)
    Which, one has $s_P in ker(phi_P)$ iff $phi_P (s)=0$, hence there exists some open subset $V subset.eq U$, such that some representative of $s_P$, say $s in F(V)$, satisfies $phi(s) = 0 in G(V)$, showing that $s_P$ can be identified as an element of $Ker(phi)_P$ (also, the converse holds, as if it's part of $Ker(phi)_P$, then its representative in some $F(V)$ gets evaluated to $0$).

    So, set wise one can conclude that $Ker(phi)_P = ker(phi_P)$ (since one can view the direct limit of $Ker(phi)$, as including into $F$, then take the direct limit).

    \ 

    #text(weight: "bold")[Image:]

    For the image part, as the functor is now different, the direct association is harder to draw. Originally, the $im(phi)(U) := im(phi(U))$. However, using similar claims as for the kernel, notice one has $im(phi)_x tilde.equiv im(phi_x)$ (since in the category of presheaves, image is a kind of kernel, so the direct limit should be preserved using the same logic).
    
    Now, the sheafification has $Im(phi)(U) := {"functions " s:U -> union.sq.big_(x in U)im(phi)_x}$ that satisfies other sheafification conditions. In particular, when taking the direct limit $Im(phi)_P$ for any $P in X$, define the map $"ev": Im(phi)_P -> im(phi)_P tilde.equiv im(phi_P)$ by $"ev"(s_P):= s(P)$ for its representative $s in G(U)$ (for some open neighborhood $P in U subset.eq X$).

    First, this is well-defined (as any two functions defined on some open neighborhood of $P$ must agree on some smaller neighborhood of $P$ if they're identified as the same in direct limit, hence the same on $P$). Second, it's a group homomorphism, as given any $s_P, t_P in Im(phi)_P$, take some common neighborhood $W$ that their representatives $s,t in F(W)$ are defined, one has $(s+t)_P = s_P+t_P$, so $"ev"(s_P+t_P)= (s+t)(P) = s(P)+t(P) = "ev"(s)+"ev"(t)$.

    \ 

    Now, to prove it's an isomorphism, let's tackle the two properties respectively:
    - If $"ev"(s_P)=0$, then $s(P)=0$. However, by the definition of sheafification, there exists some open neighborhood $P in V subset.eq U$ and $t in G(V)$, such that $s(Q) = t_Q$ for all $Q in V$; as a result, one has $s(P) = t_P = 0$, so within some open neighborhood $P in W subset.eq V$, one has $t|_W = 0 in G(W)$. Hence, one has $s|_W = 0$ also, so $s_P = 0$, showing injectivity of $"ev"$ function.

    \ 

    - Now, pick any $s'_P in im(phi)_P$, take its representative $s' in im(phi(U))$ for some open neighborhood $P in U subset.eq V$. Now, consider $s'$ as a function $U -> union.sq.big_(x in U)im(phi)_P$, one simply has $s'(P) = s'_P$. Which, take $s'$ as a function in $Im(phi)(U)$ and its image in the direct limit, it satisfies what we want (since $s'$ has evaluation of $P$ to be $s'_P$, this is precisely what we want). Hence, $"ev"$ is surjective.

    With the $"ev":Im(phi)_P -> im(phi)_P tilde.equiv im(phi_P)$ being an isomorphism, WLOG one can conclude that $Im(phi)_P = im(phi_P)$ if desired.

    \ 

    \ 

  + One has $phi$ being injective $<==>$ all open subset $U subset.eq X$ has $phi(U)$ being injective $<==>$ $Ker(phi)(U)=0$ for all open subset $U subset.eq X$ $<==>$ its direct limit $Ker(phi)_P = 0$ for all $P in X$ $<==>$ $ker(phi_P)=0$ for all $P in X$, or $phi_P$ is injective (where, the last eqquivalence is given by (a), the other parts are given by the fact that kernels in $Sh(X)$ and $PreSh(X)$ coincide).

    \ 

    On the other hand, one has $phi$ being surjective $<==>$ $Im(phi)(U) tilde.equiv G(U)$ for all open subset $U subset.eq X$ $<==>$ the direct limit $Im(phi)_P tilde.equiv G_P$ for all $P in X$ $<==>$ $im(phi_P) tilde.equiv G_P$ for all $P in X$, or $phi_P$ is surjective (where, the second equivalence is given by the isomorphism of sheaves and stalks).

    \ 

    \ 

  + Given morphisms of sheaves $f:F->G$ and $g:G -> H$, one has $F->G->H$ being an exact sequence $<==>$ $Im(f) tilde.equiv Ker(g)$ $<==>$ their direct limit $im(f_P) tilde.equiv Im(f)_P tilde.equiv Ker(g)_P tilde.equiv ker(g_P)$ for all $P in X$ $<==>$ the morphisms $f_P:F_P -> G_P$ and $g_P:G_P -> H_P$ has $F_P->G_P -> H_P$ being exact.
]

#pagebreak()

= ND//3
#problem[
  + Let $phi:F->G$ be a morphism of sheaves on $X$. Show that $phi$ is surjective iff the following condition holds: for every open set $U subset.eq X$, and for every $s in G(U)$, there is a covering ${U_i}$ of $U$, and elements $t_i in F(U_i)$, such that $phi(t_i) = s|_(U_i)$ for all $i$.
  + Give an example of a surjective morphism of sheaves $phi:F -> G$, and an open set $U$ such that $phi(U): F(U) -> G(U)$ is not surjective.
][
  + $==>:$
    
    Suppose $phi$ is surjective as a morphism of sheaves, this implies the sheaf $Im(phi) tilde.equiv G$ (in particular, given that $Im(phi)(U) = {"functions "s:U -> union.sq.big_(x in U)im(phi)_x}$)
]

\ 

= D//4
#problem[
  + Let $phi:F->G$ be a morphism of presheaves such that $phi(U):F(U) -> G(U)$ is injective for each $U$. Show that the induced map $phi^Sh: F^Sh -> G^Sh$ of associated sheaves is injective.
  + Use part (a) to show that if $phi:F->G$ is a morphism of sheaves, then $Im(phi)$ can be naturally identified with a subsheaf of $G$.
][
  + It suffices to show that all the morphisms on the stalks $phi_x: F_x -> G_x$ is injective. Yet, this is true based on the fact that direct limit (over the same direct system) preserves exact sequences. Which, in articular if all $phi(U)$ is injective, any $phi_x$ is injective.

    As a result, the collection of maps for disjoint union $union.sq phi_x:union.sq.big_(x in U)F_x -> union.sq.big_(x in U)G_x$ is always injective (since injective on each disjoint part).

    \ 

    Now, if considder the morphism $phi^Sh:F^Sh -> G^Sh$, if consider $phi^Sh (U):F^Sh (U) -> G^Sh (U)$ by $phi^Sh (U)(s) = union.sq phi_x compose s$ (where $s:U -> union.sq.big_(x in U)F_x$ is a function). Then, one has $phi^Sh (U)(s) = phi^Sh (U)(t)$ iff $s=t$ (since as set map, this is $union.sq phi_x compose s = union.sq phi_x compose t$, then with injectivity of $union.sq phi_x$, this enforces $s=t$). So, $phi^Sh(U)$ is injective for all open subset $U subset.eq X$, showing $phi^Sh$ is injective as a morphism of sheaves.

    \ 

    \ 

  + Given $phi:F->G$ as a morphism of sheaves, then the morphism of presheaves $im(phi):I -> G$ has $im(phi)(U):I(U) arrow.hook G(U)$ being injective for all open subset $U subset.eq X$ (where $I(U)$ is the set theoretic image of $phi(U)$, so $I$ is a presheaf). As a result, part (a) has that its sheafification $im(phi)^Sh (U): I^Sh (U) -> G^Sh (U) = G(U)$ being injective for every $U subset.eq X$ open.

    Here, we denote $Im(phi) := im(phi)^Sh$ (the sheafification of the presheaf of image), hence one has $Im(phi)$ (the image sheaf) being identified as a subsheaf of $G$.
]

#pagebreak()

= ND//5
#problem[
  Show that a morphism of sheaves is an isomorphism iff it is both injective and surjective.
][
  $==>:$

  First, if $phi:F->G$ is an isomorphism of sheaves, then there exists another morphism of sheaves $psi:G->F$, such that $psi compose phi = id_F$, and $phi compose psi = id_G$. As a result, one has $psi(U) compose phi(U) = id_(F(U))$, and $phi(U) compose psi(U) = id_(G(U))$, so the function $phi(U):F(U) -> G(U)$ is set-theoretic bijective. As a result, one knows $phi$ is injective, and $Im(phi) = G$ (when identified as the set-theoretic subsheaf). So, $phi$ is also surjective.

  \ 

  $<==:$

  Now, suppose $phi:F->G$ is both injective and surjective, one has $Ker(phi) =0$ (which, since it's the kernel of $phi$ as a morphism of presheaf, which indicates that each $phi(U):F(U) -> G(U)$ is injective). On the other hand, one has $Im(phi) tilde.equiv G$, which implies that $im(phi)_x tilde.equiv Im(phi)_x tilde.equiv G_x$
]

