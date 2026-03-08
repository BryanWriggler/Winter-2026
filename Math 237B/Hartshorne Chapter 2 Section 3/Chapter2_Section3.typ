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
  title: "Hartshorne Chapter 2 Section 3: Properties of Schemes",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline(title: "Table of Content:")

The main goal for this section is understanding the topological / algebraic properties on schemes.

= Basic Properties, and their Relations

#definition[Connected Scheme (Topological)][
  A scheme is #text(weight: "bold")[connected] if it as topological space is connected.
]
#definition[Irreducible Scheme (Topological)][
  A scheme is #text(weight: "bold")[irreducible] if it as topological space is connected.
]
#definition[Reduced Scheme (Algebraic)][
  A scheme is #text(weight: "bold")[reduced] if every open subset $U subset.eq X$ has $cal(O)_X (U)$ being reduced.
]
#definition[Integral Scheme (Algebraic)][
  A scheme is #text(weight: "bold")[integral] if every open subset $U subset.eq X$ has $cal(O)_X (U)$ being an integral domain.
]

As an examples / exercise, here are some properties of affine schemes:
#proposition[
  Given $X=Spec(A)$ an affine scheme, then:
  1. $X$ is connected iff $A tilde.equiv.not B times C$ as commutative rings.
  2. $X$ is irreducible iff $Nil(A)$ is prime
  3. $X$ is reduced iff $Nil(A)=0$
  4. $X$ is integral iff $A$ is an integral domain.
][
  1. It's easier to prove when assuming $A$ is already reduced, and also $X$ is disconnected iff $A tilde.equiv B times C$ as commutative rings. 

    If $X$ is disconnected (), then consider the two radicals $I,J subset.eq A$ that satisfies $X=V(I) union.sq V(J)$. Since $V(I) sect V(J) = V(I+J) = emptyset$, one must have $I+J = A$; on the other hand, $V(I) union.sq V(J) = V(I sect J) = X=Spec(A)$ (while $I,J$ are radicals, implying $I sect J$ is radical) shows that $I sect J = Nil(A) = 0$ (by assumption). So, one has $A tilde.equiv I plus.circle J$ as $A$-module, in particular each $I,J$ is itself a ring (since $J tilde.equiv A\/I$). 

    Then, for non-reduced case, if $A ->> A\/Nil(A) tilde.equiv overline(B) times overline(C)$, let $B, C$ be the preimage of $overline(B), overline(C)$ respectively, we ought to show $B times C ->> A$ (then since the ideal in $B times C$ are of the form $I_B times I_C$, one has $A tilde.equiv B\/I_B times C\/I_C$, where $I_B times I_C$ is the kernel). However, it's simple by $(b,c) mapsto b+c$

    \ 

    Suppose $A tilde.equiv B times C$, then $B arrow.hook B times C$ and $C arrow.hook B times C$ are ideals, satisfying $B+C = A$ and $B sect C = 0$, showing $V(B) sect V(C) = V(B+C)=V(A)=emptyset$, and $V(B) union.sq V(C) = V(B sect C)=V(0)=Spec(A)$. So, $Spec(A)$ is disconnected.

  \ 

  \ 

  2. Since one has $Spec(A) = V(Nil(A))$, then one has $Spec(A) tilde.equiv Spec(A\/Nil(A))$ as topological space. Which, if $Nil(A)$ is prime, $A\/Nil(A)$ is an integral domain, hence $Spec(A)$ is irreducible; conversely, suppose $Spec(A) tilde.equiv Spec(A\/Nil(A))$ is irreducible, but $Nil(A)$ not integral domain, there exists $i,j in A\\Nil(A)$, such that $overline(i)dot overline(j)=0$. As a result, one has $Spec(A\/Nil(A))=V((0)) = V((overline(i))(overline(j))) = V((overline(i))) union V((overline(j)))$, while each $V((overline(i))), V((overline(j)))$ are proper, contradicting the irreducibility. Hence, $Nil(A)$ must be prime.

  \ 

  \ 

  3. For reduced property, we'll verify that they're local properties first:
    - First, recall that $Nil(A_P) = (Nil(A)_P)$ (by the fact that extension of ideals under localization preserves intersection, and any other prime ideals not containing $P$ extends to unit ideal).

      Hence, one has $Nil(A)=0$ (as $A$-modules) $<==>$ $Nil(A_P)=Nil(A)_P=0$ (as $A_P$-module) for all prime ideal $P subset.eq A$ (this is the module property).
    Now, since every open subset $U subset.eq X$ has $cal(O)_X (U) = {s:U -> union.sq.big_(P in U)A_P}$, since $A$ is reduced $<==>$ $A_P$ being reduced, it enforces $cal(O)_X (U)$ to be reduced also (since to be nilpotent it's cooredinate-wise nilpotent, which is 0).
    
    Conversely, suppose $A$ is not reduced, then one of $A_P$ has some $a in A$ such that $a/1!=0$ but $(a/1)^n=0$ in $A_P$, or $a^n u=0$ for some $u in A\\P$. Then, take the open subset $D(u)$, one has the function $s:D(u)-> union.sq.big_(Q in D(u))A_Q$ by $s(Q) = a/1$ satisfies $(a/1)^n = a^n/1 = 0$ (since $a^n u=0$, with $u in.not Q$ for all $Q in D(u)$). Then, $s!=0$ (since $s(P)=a/1 !=0 in A_P$), while $s^n = 0$. So, $cal(O)_X (D(u)$ is not reduced.

    \ 

    \ 

  4. If $X$ is integral, it's obvious that $cal(O)_X (X) = A$ is integral domain.

    \ 

    The converse will be proven in the next proposition (for general scheme) (where a scheme is integral $<==>$ it's reduced and irreducible. Here, reduced and irreducibility both come from the assumption that $A$ is integral domain).

    \ 

  (#text(weight: "bold")[Remark:] The general case for non-reduced version of 1 is not solved.)
]

\

Now, here's the general statement on the scheme:
#proposition[
  A scheme $X$ is integral iff it is both reduced and irreducible.
][
  $==>:$

  Suppose $X$ is integral, it's clear that it's reduced (as all integral domain is reduced). 

  For irreducibility, suppose the contrary that it's reducible. Hence, there exists two nonempty open subsets $U,V subset.eq X$, where $U sect V=emptyset$. As a result, take any $s_u in cal(O)_X (U)$ and $s_v in cal(O)_X (V)$, since their domain has empty intersection, they can always be glued together. So, take $(s_u,0_v)$ as the gluing of nonzero $s_u$ with $0_v in cal(O)_X (V)$, $(0_u, s_v)$ as the gluing of nonzero $s_v$ with $0_u in cal(O)_X (U)$. The product of the two is $0$ (as $0_u$ evaluates to $0$ on $U$, and similarly for $0_v$), while each individual of them is not, reaching a contradiction that $cal(O)_X (U union.sq V)$ is an integral domain.

  (Even stronger, one can say $cal(O)_X (U union.sq V) tilde.equiv cal(O)_X (U) times cal(O)_X (V)$ if $U sect V=emptyset$, as the two functions share no domain, so has no affect on each other).

  \ 

  \ 

  $<==:$

  Conversely, suppose $X$ is reduced and irreducible. Let $U subset.eq X$ be any open subset, and suppose $f,g in cal(O)(U)$ satisfies $f g = 0$. Define the set $Z_f := {x in U | f_x in m_x}$ (where $f_x in cal(O)_(X, x)$ and $m_x$ is the maximal ideal of $cal(O)_(X,x)$), and similarly $Z_g:= {x in U | g_x in m_x}$. Note that since $f_x g_x = 0 in m_x$ for all $x in U$, each $x in U$ has $f_x in m_x$ or $g_x in m_x$, showing $Z_f union Z_g = U$.
  
  On the other hand, they're actually closed subsets: By intersecting with affine covers, say $U$ is affine (then $U = Spec(cal(O)_X (U))$), then the complement $X_f := U\\Z_f$ are all prime ideals $P in U$, such that $f_P$ is a unit (in particular, one has $f in.not P$, as $cal(O)_(X,P)$ is the localization of $cal(O)_X (U)$ at $P$, then $f_P$ is a unit $==>$ $f$ can't be contained in $P$). So, working it out set wise, we have $X_f = D(f)$ in fact, which is open in $U$. So, $Z_f$ is closed in $U$. And, since this is true for arbitrary affine cover, $Z_f$ must be closed in $X$ itself.

  So, we have $Z_f,Z_g$ two closed subset such that $Z_f union Z_g = U$. With $X$ irreducible, any of its open subset must also be irreducible, showing $Z_f = U$ or $Z_g = U$.

  \ 

  Suppose $Z_f = U$, then this implies $X_f = D(f) = emptyset$ when restricting it to $U$'s intersection with any affine cover, as a result $f$ must be nilpotent in all of these affine covers, hence nilpotent in $U$. But, using the reduced assumption, this implies $f=0$. Which, it proves the integrality.
]

\ 

Intuition wise, we can see it relies heavily on affine schemes. If possible, in the future we'll practice more on how restricting to affine scheme works.

#pagebreak()

= Noetherian Property

Similar to how in classical sense we worked with $k[x_1,...,x_n]$ (a Noetherian ring), we wish to work with some similar ideas in scheme theory also.

#definition[Locally Noetherian, Noetherian Scheme][
  A scheme $X$ is #text(weight: "bold")[locally Noetherian], if there exists an open cover ${U_i}$ of $X$, such that each $U_i = Spec(A_i)$ (affine), and each $A_i$ is a Noetherian ring.

  Similarly, $X$ is #text(weight: "bold")[Noetherian], if it's locally Noetherian and quasi-compact. As an equivalent definition, $X$ is Noetherian, if it can be covered by finitely many affine open subsets, with each affine subset corresponds to a Noetherian ring.
]

#remark[
  If $X$ is a Noetherian scheme, then it's clear it's Noetherian as topological space (since it's finite union of $Spec(A_i)$, which $A_i$ is Noetherian ring guarantees $Spec(A_i)$ is a Noetherian topological space; so, finite union is still Noetherian topological space). 

  \ 

  Yet, the converse is false: 
  
  Consider the ring $A=k[x_1,x_2,...]\/(x_1^2,x_2^2,...)$. Notice that all $overline(x_i) in A$ are nilpotent, hence $(overline(x_1),overline(x_2),...) subset.eq Nil(A)$; on the other hand, it's also a maximal ideal (as the quotient $k[x_1,x_2,...]->> k$ by sending all $x_i mapsto 0$ contains the ideal $(x_1^2,x_2^2,...)$, hence factors through $A$; however, in here any constant can't be sent to $0$, while all $overline(x_i)mapsto 0$, so the kernel through $A$ must be $(overline(x_1),overline(x_2),...)$, showing that $A\/(overline(x_1),overline(x_2),...) tilde.equiv k$, hence it's also maximal). As a result, $Spec(A) = {*}$ (since it must only be the maximal ideal), which is trivially Noetherian. 
  
  On the other hand, the ring $A$ can never be Noetherian, since the chain $(overline(x_1)) subset (overline(x_1),overline(x_2)) subset ...$ pulls back to $(x_1) subset (x_1,x_2) subset ...$ in $k[x_1,x_2,...]$ (which is a strict chain), so it must also be a strict chain in $A$, showing it's not Noetherian as ring.

  Finally, $Spec(A)$ is not Noetherian as schemes, since the only open affine subset is itself, and the ring is $A$ (which is not Noetherian).
]

\ 

This definition is good in an algebraic sense, as one can always find an affine neighborhood associated to a Noetherian ring. Yet, it'll be a lot more convenient if one can choose any affine open neighborhood to be associated to Noetherian rings. This is indeed the case in general:

#proposition[
  A scheme $X$ is locally Noetherian iff every open affine subset $U subset.eq X$, $U tilde.equiv Spec(A)$ has $A$ being a Noetherian ring. 

  In particular, if $X=Spec(A)$, then it's a Noetherian scheme iff $A$ is Noetherian.
][
  $<==:$

  Suppose every open affine subset $U tilde.equiv Spec(A)$ for some Noetherian ring $A$, it's clear $X$ is a locally Noetherian scheme by definition.

  \ 

  \ 

  $==>:$

  Suppose $X$ is locally Noetherian, and given any open affine subset $U tilde.equiv Spec(A)$ (i.e. the restriction of schemes has $(U, cal(O)_U) tilde.equiv (Spec(A), cal(O)_A)$ as locally ringed space). Choose ${U_i}$ as the affine cover of $X$ so that each $U_i tilde.equiv Spec(B_i)$ for some Noetherian $B_i$, and consider the intersection $U sect U_i subset.eq Spec(B_i)$. Since within $Spec(B_i)$ this is open, by quasi-compactness of prime spectrum, there exists finitely many $f_(i,1),...,f_(i,j_i) in B_i$, so that $U sect U_i = D(f_(i,1)) union...union D(f_(i,j_i))$, and each $D(f_(i,l))$ has $cal(O)_A (D(f_(i,l))) tilde.equiv (B_i)_(f_(i,l)) tilde.equiv B_i [x]\/(x f_(i,l)-1)$, which by the Noetherianness of $B_i$, this ring is also Noetherian.

  \ 

  As a result, we swap $U tilde.equiv Spec(A)$ with all of the following:
  $ U = union.big_(i)U sect U_i = union.big_(i)(union.big_(l=1)^(j_i)D(f_(i,l))) $
  Where, each $D(f_(i,l))$ corresponds to a Noetherian ring (and by the isomorphism of schemes, one has $cal(O)_X (D(f_(i,l))) tilde.equiv (B_i)_(f_(i,l))$). Hence, the statement also reduces to: If $X=Spec(A)$ is an affine scheme covered by affine opens that're Noetherian rings' spectra, then $A$ is Noetherian.

  Suppose $U subset.eq Spec(A)=X$ is an affine open subset where $U tilde.equiv Spec(B)$ (with $B$ Noetherian ring), this inclusion $U arrow.hook X$ induces a ring homomorphism $A -> B$. Now, by openness of $U$, by the fundamental open sets, let $f in A$ satisfies $D(f) subset.eq U$; let $overline(f) in B$ be the image of $f$ under the ring homomorphism, then the fundamental open's property shows that $iota^(-1)(D(f)) = D(overline(f))$, in particular one has $cal(O)_B (D(overline(f))) tilde.equiv cal(O)_A (D(f))$, so $B_overline(f) tilde.equiv A_f$, showing $A_f$ is Noetherian.

  This again swaps $X$ with a collection of $f in A$, such that $D(f)$ associates to $A_f$ a Noetherian ring. Using the quasi-compactness of $X = Spec(A)$, there exists $f_1,...,f_n in A$, such that $union.big_(i=1)^n D(f_i)=X$, and each $A_(f_i)$ is Noetherian. As a result, $(f_1,...,f_n) = A$. Now, let's do a lemma:
  #lemma[
    Let $I subset.eq A$ be an ideal, and $phi_i:->A_(f_i)$ be the localization map for each $i in {1,...,n}$. Then:
    $ I = sect.big_(i=1)^n I^(e c) = sect.big_(i=1)^n phi_i^(-1)(phi_i (I)A_(f_i)) $

  ][
    Let's recall that each $phi_i^(-1)(phi_i (I)A_(f_i)) = {r in A | exists k in NN, " " r f_i^k in I}$ (since the extension then contraction is all the element, such that multiplied by some element in the multiplicative set it lies in $I$). So, this shows the inclusion $I subset.eq sect.big_(i=1)^n phi_i^(-1)(phi_i (I)A_(f_i))$.

    \ 

    Now, suppose $r in sect.big_(i=1)^n phi_i^(-1)(phi_i (I)A_(f_i))$, then there exists $k_1,...,k_n in NN$ and $a_1,...,a_n in I$, such that $phi_i (r) = a_i/f_i^(k_i) in A_(f_i)$. In particular, by multiplying suitable $f_i^(l_i)$ to both the numerator and denominator, WLOG one can assume all $k_i=k$ for some fixed $k$. So, we have $phi_i (r)=r/1 = a_i/f_i^k$, showing there exists $m_1,...,m_n in NN$, such that $(f_i^k r - a_i)f_i^(m_i)=0$. Now, by multiplying new $f_i$'s wouldn't affect the equality, hence again WLOG each $m_i=m$ for some fixed $m$.

    Herefore, we get $(f_i^k r-a_i)f_i^m = 0$ for all index $i$, showing $f_i^(k+m)r in I$. Now, since $(f_1,...,f_n) in A$, notice that $(f_1^(k+m),...,f_n^(k+m))=A$ (since its radical contains $f_1,...,f_n$, hence equals to $A$). Then, for suitable $b_1,...,b_n in A$, one has the following:
    $ sum_(i=1)^n b_i f_i^(k+m) = 1, quad sum_(i=1)^n b_i f_i^(k+m)r = r in I $
    This finishes the proof.
  ]
  As a result, for any increasing chain of ideals $I_1 subset I_2 subset...$, its image $phi_i (I_1)A_(f_i) subset phi_i (i_2)A_(f_i) subset...$ in $A_(f_i)$ stabilizes (by a.c.c. on $A_(f_i)$), hence $phi_i^(-1)(phi_i (I_1)A_(f_i)) subset phi_i^(-1)(phi_i (I_2)A_(f_i)) subset...$ stabilizes in $A$.

  Then, the lemma states that each $I_i$ is the intersection of the $i$th ideal of a stabilizing chain, hence for large enough $N$ the $I_i$'s chain stabilizes. This shows that $A$ is Noetherian.
]
For the spcial case where $X = Spec(A)$ is a Noetherian Scheme, locally Noetherianness enforces all rings of affine open subsets to be Noetherian, in particular $cal(O)_X (X) = A$ is Noetherian.

\ 

This demonstrates another important mindset in Algebraic Geometry: Sometimes we're looking at information beyond the space, so being able to transfer between algebraic properties and geometric properties will be crucial.

#pagebreak()

= Morphisms

Now, we'll start talking about some basic morphisms. Recall that for classical sense, the finite type / finite ring homomorphisms can let us reduce the questions to some quotient of polynomial rings / realizing it as finitely-generated module over the base ring. Here it's similar in scheme theory:

#definition[Locally Finite Type / Finite Type Morphism][
  Given a morphism of schemes $f:X->Y$, it's called #text(weight: "bold")[locally of finite type] if there exists an affine cover ${V_i}$ of $Y$ (denote each $V_i = Spec(A_i)$), such that each $f^(-1)(V_i)$ has an affine cover ${U_(i j)}$ (denote each $U_(i j) = Spec(A_(i j))$), which the restricted morphism $f:U_(i j) -> V_i$ induces a ring homomorphism $f^\#:A_i -> A_(i j)$ that realizes $A_(i j)$ as a finitely-generated $A_i$-algebra.

  \ 

  Similarly, $f$ is called #text(weight: "bold")[finite type] if the covering $f^(-1)(V_i)=union.big_(j)U_(i j)$ can be chosen using finite number of $j$.
]

#definition[Finite Morphism][
  Given a morphism of schemes $f:X->Y$, it's called #text(weight: "bold")[finite] if there exists a affine cover ${V_i}$ of $Y$ (denote each $V_i = Spec(A_i)$), such that each $f^(-1)(V_i)$ is affine (denote $F^(-1)(V_i) = Spec(B_i)$), where the restricted morphism $f:f^(-1)(V_i)-> V_i$ induces a ring homomorphism $f^\#:A_i -> B_i$, realizing $B_i$ as a finitely-generated $A_i$-module.
]

\ 

Again, similar to the previous definition of Locally Noetherian, it in fact enforces all affine open subsets to have the same properties (the proofs are highly nontrivial though...)
/*
#lemma[
  A morphism of schemes $f:X -> Y$ is locally of finite type iff every affine open subset $V_i subset.eq Y$ (with $V_i=Spec(A_i)$), its preimage $f^(-1)(V_i)$ has affine cover ${U_(i j)}$ (with $U_(i j)=Spec(A_(i j))$), such that each $A_(i j)$ is a finitely-generated $A_i$-algebra.
][
  $<==$:

  This is by definition (since collect all open affine subsets, it satisfies the condition).

  \ 

  $==>:$

  Suppose $f:X->Y$ is locally of finite type, fix the same notation as the definition. 
  
  Given any affine open subset $V = Spec(A)$ in $Y$, the goal is to show that the restricted morphism $f:f^(-1)(V)->V$ is locally of finite type:
  
  By the openness of $V sect V_i$ in $V_i = Spec(A_i)$, it can be covered by finitely many $f_(i,1),...,f_(i,n_i) in A_i$'s fundamental open subsets $D(f_(i,l))$ (which is also open in $Y$), and the corresponding ring $(A_i)_(f_(i,l))$ is a finitely-generated $A_i$-algebra. 
  
  For each $f^(-1)(D(f_(i,l))) subset.eq f^(-1)(V_i)$ open, its intersection with each $U_(i j)$, say $f^(-1)(D(f_(i,l))) sect U_(i j)$ in $U_(i j)=Spec(A_(i j))$ can also be covered by finitely many $g_(i j,l, 1),...,g_(i j,l, k_(i j)) in A_(i j)$'s fundamental open subset $D(g_(i j,l, r))$, and the corresponding ring $(A_(i j))_(g_(i j,l,r))$ is a finitely-generated $A_(i j)$-algebra.

  Notice that this generates a morphism $f:D(g_(i j,l,r)) -> D(f_(i,l))$, and hence a ring homomorphism $(A_i)_(f_(i,l))-> (A_(i j))_(g_(i j,l,r))$. Notice we have the following commutative diagram (the left being morphisms of spaces, the right being ring homomorphisms):
  #set align(center)
  #diagram($
             D(g_(i j,l,r)) edge("d","hook->") edge(->, script(f)) & D(f_(i,l)) edge("d","hook->") && (A_(i j))_(g_(i j,l,r)) & (A_i)_(f_(i,l)) edge("l",->) \ 
             U_(i j) edge(->, script(f), #right) & V_i && A_(i j) edge("u",->) & A_i edge("l") edge("u", ->)
           $)
  #set align(left)
  Each map on the right hand side is of finite type ring homomorphism, so are their compositions, hence $(A_(i j))_(g_(i j,l,r))$ can be recognized as a finitely-generated $A_i$-algebra (also a finitely-generated $(A_i)_(f_(i,l))$).

  Finally, we ought to argue that $(A_i)_(f_(i,l))$ is in fact a finitely-generated $A$-algebra to finish the proof. However, notice that $D(f_(i,l))$ in $V sect V_i$ is also open in $V$, hence can be covered by $f_(i,l,1),...,f_(i,l,m) in A$'s fundamental open subsets $D(f_(i,l,q))$, in particular 
]*/

Now, let's dive into some properties on open / closed subschemes:

#definition[Open Subscheme, Open Immersion][
  Let $X$ be a scheme, a scheme $U$ is an #text(weight: "bold")[open subscheme] of $X$, if there exists an open subset $U' subset.eq X$, such that as schemes one has $(U,cal(O)_U) tilde.equiv (U', cal(O)_X|_(U'))$.

  An #text(weight: "bold")[open immersion] is a morphism $f:X->Y$, such that it can be recognized as the inclusion $iota:U arrow.hook X$ of open subscheme $U$ (or, an isomorphism of open subschemes).
]

#definition[Closed Immersion, Closed Subscheme][
  A morphism of schemes $f:X->Y$ is a #text(weight: "bold")[closed immersion] if as topological space, $X$ is homeomorphic to $f(X)$ that is a closed subset of $Y$, while the induced sheaf morphism $f^\#:cal(O)_Y-> f_* cal(O)_X$ is surjective.

  A #text(weight: "bold")[closed subscheme] of $Y$ is a scheme $X$ together with a closed immersion $f:X->Y$. This is also classified up to isomorphism.
]

\ 

As of examples, we have the following:

#example[Ring Projection][
  Given any projection of rings $A ->> A\/I$, it induces a homeomorphism $f:Spec(A\/I) arrow.tilde V(I) arrow.hook Spec(A)$, which is a closed map in topological sense; the reason why it's surjective on the morphism of sheaves, is because for any prime ideal $P  subset.eq A\/I$, with prime ideal $P^c subset.eq A$, one has the following commutative diagram:
  #set align(center)
  #diagram($
             A edge(->>) edge("d",->) & A\/I edge("d",->)\ 
             A_(P^c) edge(->>) & (A\/I)_P tilde.equiv A_(P^c)\/I_(P^c)
           $)
  #set align(left)
  Where, the property that localization and quotient commutes (as long as the ideal does't touch the multiplicatively closed set) shows the bottom map is surjective.

  Hence, the morphism $cal(O)_A -> f_* cal(O)_(A\/I)$ is surjective as sheaves (since it's surjective on stalks, while stalks preserve exactness).
]

\ 

We'd also like to talk about how to "induce" a scheme structure on a closed subset of a scheme. For open subset it's clear that the choice must be the restriction to subspace topology + the restriction of sheaf, but since there's no notion of sheaf over closed subsets, we do need a bit more work.

#example[Reduced Induced Closed Subscheme of Affine Scheme][
  Given $X=Spec(A)$ an affine scheme, and $Y subset.eq X$ be a closed subset. Then, $Y=V(I)$ for some ideal $I$, which one can take $Y = V(sqrt(I))$ (the largest ideal that doesn't change $Y$). Which, using the homeomorphism $V(sqrt(I)) tilde.equiv A\/sqrt(I)$, this induces a reduced scheme structure on $Y$ using $sqrt(I)$.
]

For general schemes, we require the gluing of schemes as description.
#example[Structure on General Schemes][
  Let $X$ be arbitrary scheme, and $Y subset.eq X$ a closed subset. Let ${U_i}$ be an affine cover of $X$ (with $U_i = Spec(A_i)$), and consider $Y_i = Y sect U_i$ (which is closed in $U_i$), which has an induced reduced structure given for the affines (this structure may be dependent on $U_i$).

  Now, to glue the schemes together, we need to argue that any $Y_i sect Y_j subset.eq Y_i$ is isomorphic to $Y_i sect Y_j subset.eq Y_j$ (since they may induce different structures). Since $Y_i sect Y_j = Y sect(U_i sect U_j) = Y_i sect U_j$, one needs to prove the induced structure is independent of the order of restriction (i.e. one can restrict to one then the other, or vice versa). This suffices to prove the case for the fundamental open subsets. 
  
  The full statement is: Given $U=Spec(A)$, if $f in A$ and $V=D(f) = Spec(A_f)$, then the reduced induced structure on $Y sect U$ restricts to $Y sect V$ agrees with $Y sect V$'s reduced induced structure. However, given any ideal $I subset.eq A$ that's a radical, one has $I = sect.big_(P in V(I))P$ in $A$, when extending it becomes $I^e = sect.big_(P in V(I))P^e$ in $A_f$, which $P^e$ is prime $<==>$ its intersection with the set of $f^n$'s is empty, or $P in D(f)$. So, going from $Y sect U$ (as $V(I)$) to $Y sect V$ (as $V(I^e)$) under extension, is the same as the structure on $Y sect V$ (as $V(I) sect D(f)$).

  Finally, the gluing condition of sheaves ensure the existence of a structure after gluing all affines together.
]

\ 

This unfortunately is not mentioned in class, which is a bit annoying (since it's still important in our sense).

#pagebreak()

= Fibre Product

This will be the most complicated part in this section, as the construction is highly nontrivial. The goal is to get the categorical fibre prodct in the category of schemes. Similar to what we've been doing, it's the matter of reducing down to the fibre products between affine schemes. For this, let's focus on one tool first:
#theorem("Affinization")[
  Given the functor $Spec(\_):CRing^op -> Sch$, it has a left adjoint, named "Affinization functor" $"Aff"_((\_)):Sch -> CRing^op$, that's based on the universal property:

  Given any scheme $X$, its affinization $"Aff"_X$ is an affine scheme with a morphism of schemes $f:X->"Aff"_X$, such that for any affine scheme $Y$ and morphism of schemes $g:X->Y$, there exists a nique morphism of affine schemes $overline(g):"Aff"_X->Y$, such that $g = overline(g) compose f$. 
  #set align(center)
  #diagram($
             X edge("dr",->, script(forall g), #right)edge("rr",->, script(f)) && "Aff"_X edge("dl", "..>", script(exists ! overline(g)), #left)\ 
             & Y
           $)
  #set align(left)
  This provides a natural isomorphism as follow (where $"Aff"_X = Spec(B)$ and $Y=Spec(A)$):
  $ Hom_(CRing^op)(B,A) tilde.equiv Hom_(AffSch)("Aff"_X,Y) tilde.equiv Hom_(Sch)(X, Y) $
][
  For any scheme $X$, define the ring $A_X:= cal(O)_X (X)$ (i.e. the ring associated to the global section, $A_X$ is often denoted as $Gamma(X< cal(O)_X)$, called the "global section functor"). And, define $"Aff"_X := Sp(A_x)$.

  \ 

  Which, given any affine scheme $Y = Spec(B)$, and morphism of schemes $f:X->Y$, it associates with the morphism of sheaves $f^\#:cal(O)_Y -> f_* cal(O)_X$, which $h=f^\#_Y:cal(O)_Y (Y) -> cal(O)_X (f^(-1)(Y)) = cal(O)_X (X)$ is a ring homomorphism $h:B -> A_x$, hence reverses to a unique morphism of schemes on the spectrum level $h^*: Spec(A_X)= "Aff"_X -> Spec(B) = Y$. So, if such map exists, it must be unique.

  \ 

  Now, we need to show: Given any ring homomorphism $alpha:B = cal(O)_Y (Y) -> A_X = cal(O)_X (X)$, it defines a morphism of schemes $alpha^*:X -> Y$. For this, we need gluin of schemes again.

  Suppose ${U_i}$ collects all affine open subsets of $X$, each $U_i = Spec(A_i)$, then the inclusion $iota_i:U arrow.hook X$ together with $f:X -> Y$ composes to $f compose iota_i:U_i -> Y$, a morphism between affine schemes, hence it reverses to a ring homomorphism $alpha_i^*:B = cal(O)_Y (Y)-> A_i = cal(O)_X (U)$. Also, the way we define the morphism enforces this to be coming from the composition of $f^\#_Y: B=cal(O)_Y (Y)-> A=cal(O)_X (X)$ and $iota_i^*: A=cal(O)_X (X) -> A_i = cal(O)_X (U)$:
  #set align(center)
  #diagram($
             U_i edge("rd",->, script(f compose iota_i), #right) edge("rr","hook->", script(iota_i)) && X edge("dl", ->, script(f), #left) && A_i && A edge("ll", ->, script(iota_i^*)) \ 
             & Y &&&& B edge("ul", ->, script(alpha_i^*), #left) edge("ur", ->, script(f^\#_Y), #right)
           $)
  #set align(left)
  Now, consider $U_i sect U_j$. As a remark, it may not be affine, but it has affine neighborhoods in each $U_i, U_j$, so WLOG assume we're working with the affine neighborhood $W subset.eq U_i sect U_j$. Which, we claim that the structure on $W$ is independent of $U_i, U_j$, and this is because for the two inclusions $W arrow.hook U_i arrow.hook X$ and $W arrow.hook U_j arrow.hook X$, the restriction of sheaves forces $cal(O)_W (W) = cal(O)_X (W)$, independent of which $U_i$ it passes through.

  In particular, this forces the ring homomorphism $alpha^*_W : A = cal(O)_Y (Y) -> cal(O)_W (W)$ to be compatible in the following sense (where the top is morphism of schemes, the bottom is ring homomorphisms):
  #set align(center)
  #diagram($
             & U_i edge("d","hook->", script(iota_(i)), #left) edge("dr", ->, script(f compose iota_i)) \ 
             W edge("ur", "hook->", script(iota_(W,i))) edge("dr","hook->",script(iota_(W,j)), #right) edge("hook->", script(iota_W)) & X edge(->, script(f))  & Y\ 
             & U_j edge("u","hook->", script(iota_j)) edge("ur", ->, script(f compose iota_j), #right)
           $)
  #set align(left)

  \ 

  #set align(center)
  #diagram($
             & A_i edge("dl", ->, script(iota_(W,i)^*)) \ 
             cal(O)_W (W) & A edge("u",->, script(iota_i^*)) edge("d",->, script(iota_j^*)) edge("l", ->, script(iota_W^*)) & B edge("l", ->, script(f^\#_Y)) edge("dl", ->, script(alpha_j^*), #left) edge("ul", ->, script(alpha_i^*)) \
             & A_j edge("ul", ->, script(iota_(W,j)^*), #left)
           $)
  #set align(left)
  So, it's a really large commutative diagram chase between $CRing$ and $Sch$.

  Which, the morphism $W-> Y$ induces a clear ring homomorphism $B -> O_W (W)$ that's compatible with the restriction (and intersection), showing the morphisms could glue together (in a unique way). Globally, this is the morphism $alpha: X-> Y$ (and the property forces it to be unique).
]

\ 

With this, we can define the fibre product over affine schemes:
#lemma("Fibre Product of Affine Schemes")[
  Given three affine affine schemes $X,Y,Z$ (corresponds to ring $C,B,A$ respectively), and morphisms of schemes $f:X -> Z$, $g: Y -> Z$ (corresponds to ring homomorphisms $f^*: A -> C$, $g^*: A -> B$ respectively), then the fibre product in $Sch$ exists.
][
  Note that we seek for something stronger: Instead of fibre product over $AffSch$, it's fibre product over $Sch$ for any morphisms between affine schemes (so, the universal property must work for any schemes, not just affine schemes). Nonetheless, we can start with just affine schemes:

  \ 

  Since we have the ring homomorphisms going out from $A$, it's suitable to construct  the fibre coproduct in $CRing$, namely the tensor product:
  #set align(center)
  #diagram($
             A edge("d",->, script(g^*)) edge(->, script(f^*)) & C edge("d",->, script((g^*)'), #left) edge("ddr",->, script(d^*_c), bend: #20deg) \ 
             B edge("drr", ->, script(d^*_b), bend: #(-20deg)) edge(->, script((f^*)'), #right) & B tensor_A C edge("dr","..>", script(exists ! h^*)) \ 
             && D
           $)
  #set align(left)
  Which, we define $X times_Z Y:= Spec(B tensor_A C)$, and $f': X times_Z Y-> Y$, $g': X times_Z Y -> X$ be induced by $(f^*)', (g^*)'$ respectively. Then, the commutativity of the ring homomorphism guarantees the following diagram:
  #set align(center)
  #diagram($
             Z & X edge("l",->, script(f)) \ 
             Y edge("u",->, script(g), #left) & X times_Z Y edge("l",->, script(f'), #left) edge("u",->, script(g'))
           $)
  #set align(left)
  And, over $AffSch$, it satisfies the universal propety, since for any affine schemes $W$ (say corresponds to ring $D$), together with morphisms of schemes $d_B:W -> Y$ and $d_C:W -> X$, such that $f compose d_C = g compose d_B$. Then, let $d^*_B:B->D$ and $d^*_C: C -> D$ denotes the reversed ring homomorphism of the spaces, then one has $d'_C compose f^* = d'_b compose g^*$. Hence, going back to the top diagram, one has a unique ring homomorphism $h^*: B tensor_A C -> D$ by the fibre coproduct property in $CRing$, hence generates a unique morphism of schems $h:W = Spec(D) -> X times_Z Y = Spec(B tensor_A C)$ (and any such morphism of schemes $h$ must corresponds to $h^*$, showing the uniqueness):
  #set align(center)
  #diagram($
             Z & X edge("l",->, script(f)) \ 
             Y edge("u",->, script(g), #left) & X times_Z Y edge("l",->, script(f'), #left) edge("u",->, script(g'))\ 
             && W edge("ull",->, script(d_B), #left, bend: #(20deg)) edge("uul",->, script(d_C), bend:#(-20deg)) edge("ul","..>", script(exists ! h))
           $)
  #set align(left)
  Basically, it's the reversed diagram of the very first one.

  \ 

  Finally, we ought to show its fibre product property in $Sch$. This can be done through affinization: Suppose $W$ is arbitrary schemes, with $d_B:W->Y$ and $d_C:W -> X$ satisfies $g compose d_B=f compose d_C$. The universal property of affinization guarantees a factorization $d'_B:"Aff"_W -> Y$ and $d'_C:"Aff"_W -> C$ as follow:
  #set align(center)
  #diagram($
             Z & X edge("l",->, script(f)) \ 
             Y edge("u",->, script(g), #left) & X times_Z Y edge("l",->, script(f'), #left) edge("u",->, script(g'))\ 
             && "Aff"_W edge("uul", ->, script(d'_C), bend: #(-20deg)) edge("ull", ->, script(d'_B), #left, bend: #20deg) edge("ul", "..>", script(exists ! h)) \ 
             &&& W edge("uuull", ->, script(d_C), bend: #(-40deg)) edge("uulll", ->, script(d_B), #left, bend: #40deg) edge("ul", ->, script(a_W))
           $)
  #set align(left)
  Where, the universality of $X times_Z Y$ over affine schemes guarantees a unique morphism of schemes $h:"Aff"_W -> X times_Z Y$ for the diagram to commute, and composing with the affinization morphism $a_W:W -> "Aff"_W$, it generates a morphism for $W$ to satisfy the fibre product property. It is unique, simply because any morphism of schemes $W -> X times_Z Y$ (where $X times_Z Y$ is affine!) must also factor through $"Aff"_W$ uniquely, and such factor must be unique by the fibre product in $AffSch$ shown above. So, it's indeed a fibre product in $Sch$, not just in $AffSch$.
]

\ 

To show it works for general schemes, it's similar to before: Restrict them to affine neighborhoods, construct fibre product neighborhood-wise, then glue all of them together. For this, we need some machineries of gluging morphisms:
#lemma("Gluing of Morphisms")[
  
][]