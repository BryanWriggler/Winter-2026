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
  title: "Hartshorne Chapter 2 Section 3: Separated / Proper",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline(title: "Table of Content:")

= Separatedness//1

#definition[Diagonal Morphism][
  Given $f:X->Y$ a morphism of schemes. The #text(weight: "bold")[Diagonal morphism] is the unique morphism $Delta_X:X->X times_Y X$ that satisfies the following commutative diagram:
  #set align(center)
  #diagram($
             X edge("dr","..>", script(Delta_X)) edge("drr",->, script(id_X), bend: #20deg)edge("ddr",->, script(id_X), bend: #(-20deg)) \
             & X times_Y X edge("d",->, script(f')) edge(->, script(f')) & X edge("d",->,script(f), #left)\
             & X edge(->,script(f),#right) & Y
           $)
  #set align(left)
]
Then:
#definition[Separated Morphism][
  $f:X->Y$ is #text(weight: "bold")[Separated] if the diagonal morphism $Delta_X$ is a closed immersion. $X$ is then said to be #text(weight: "bold")[separated over $Y$].

  $X$ is called a #text(weight: "bold")[Separated Scheme] if it is separated over $Spec(ZZ)$ the final object.
]

About affine schemes:
#proposition[
  Any morphism of affine schemes $f:X=Spec(B)->Y=Spec(A)$ is separated.
][
  In this case, since one has $f^\#:A->B$ realizing $B$ as an $A$-algebra, then $X times_Y X tilde.equiv Spec(B tensor_A B)$. In particular, with identity $id_X:X->X$ reversing to $id_B:B->B$, the diagonal morphism $Delta_X:X -> X times_Y X$ reverses to $Delta_X^*:B tensor_A B -> B$, that satisfies the following:
  #set align(center)
  #diagram($
             & B edge("d",->, script(iota), #left) edge("ddr",->, script(id_B), bend: #20deg) \
             B edge(->, script(iota), #right)edge("drr",->,script(id_B), bend: #(-20deg)) & B tensor_A B edge("dr","..>", script(Delta_X^*)) \ 
             && B
           $)
  #set align(left) 
  An explicit dexcription is $Delta_X^*(a tensor a') = a a'$. Since this is a surjective ring homomorphism, one realizes $B tilde.equiv B tensor_A B\/I$ for some ideal $I subset.eq B tensor_A B$. In particular, as affine schemes one has $Spec(B) tilde.equiv V(I) arrow.hook Spec(B tensor_A B)$ using the diagonal morphism.
]

\ 

Another conenient thing, is that separatedness can be checked purely topological:
#proposition[
  Given an arbitrary morphism $f:X->Y$, it's separated $<==>$ the image of diagonal morphism is a closed subset of $X times_Y X$.
][
  $==>:$

  If $f$ is separated, then $Delta:X -> X times_Y X$ is a closed immersion of schemes, showing $Delta(X) subset.eq X times_Y X$ is a closed subset.

  \ 

  $<==:$

  Suppose $Delta(X) subset X times_Y X$ is a closed subset, we need to show $Delta$ is a closed immersion of schemes (meaning it's a homeomorphism of $X-> Delta(X)$, and $cal(O)_(X times_Y X)-> Delta_* cal(O)_X$ is surjective).

  Recall that we have projection $p_1,p_2:X times_Y X-> X$, such that $p_i compose Delta = id_X$. This shows that when restricting to $Delta(X)$, the morphism $Delta$ is a homeomorphism (as the restriction of $p_i$ forms a two-sided inverse).

  Now, consider $cal(O)_(X times_Y X)-> Delta_* cal(O)_X$, the surjectivity is a local question (since it's surjective $<==>$ all stalks are surjective). For any $P in X$, let $P in U subset.eq X$ be an open affine neighborhood. Also, choose $U$ to be small enough, such that $f(U) subset.eq V subset.eq Y$ (where $V$ is also an oppen affine neighborhood). Then, $Delta$ restricts to the following diagram:
  #set align(center)
  #diagram($
             U edge("dr", ->, script(Delta)) edge("drr",->, script(id_U), bend: #20deg) edge("ddr",->, script(id_U), bend: #(-20deg))\ 
             & U times_V U edge(->, script(p_1)) edge("d",->, script(p_2)) & U edge("d",->, script(f), #left)\
             & U edge(->, script(f), #right) & V
           $)
  #set align(left)
  Which, $Delta:U -> U times_V U$ is a closed immersion (because now $U, U times_V U$ are all affine). Hence, for $P in U$, the following is a surjective map:
  $ cal(O)_(X times_Y X, Delta(P))=cal(O)_(U times_V U, Delta(P))->> Delta_* cal(O)_(U, P) = Delta_* cal(O)_(X,P) $
  Which, it shows the original diagonal morphism is a closed immersion. (I love the local property).
]

\ 

Some review of valuation rings:
#definition[Valuation of a Field][
  Let $k$ be a field, and $G$ a totally ordered abelian group (for instance $G=ZZ$ is a common one). A #text(weight: "bold")[valuation] of $k$ with values in $G$ is a map $v:K\\{0}-> G$, such that for any nonzero $x,y in k$, one has:
  1. $v(x y)=v(x)+v(y)$
  2. $v(x+y)>= min{v(x),v(y)}$
]
#definition[Valuation ring of a Field][
  Given a field $k$ together with a valuation $v:k\\{0}->G$, let $R = {x in k\\{0} | v(x)>=0} union {0}$. Notice that $R$ is a ring:
  - Since $v(1) = v(1 dot 1) = v(1)+v(1)$, then $v(1)=0$, so $1 in R$. $0 in R$ is given. As a side note, since $0=v(1) = v((-1)^2) = v(-1)+v(-1)$, then one has $v(-1)=-v(-1)$ (if order of any nontrivial element is not 2, then we're good, since it implies $v(-1)=0$).
  - Suppose $x,y in R$ (i.e. $v(x),v(y)>=0$), then $v(x+y)>= min{v(x),v(y)}>=0$, showing $x+y in R$; similarly, $v(x y)=v(x)+v(y)>=0$, showing $x y in R$.
  - Any $x in k\\{0}$ has $v(-x) = v((-1)x)=v(-1)+v(x)=v(x)>=0$, showing $-x in R$.

  Which, $R$ is a ring, and it's called the valuation ring of valuation $v$. If $k$ is a fraction field of $R$, then $R$ is a valuation ring of $k$ with (implicitly: with valuation $v$).
]

Which, it has a maximal ideal defined by $m := {x in R | v(x)>0}$, since any $x,y in m$ (with $x!=y$) has $v(x-y) >= min{v(x),v(-y)}>0$ (because $v(x),v(y)=v(-y)>0$), and any $x in R$, $y in m$ has $v(x y)= v(x)+v(y) > 0$ (because $v(y)>0$). so it an ideal. To verify it's a maximal ideal, notice that any nonzero element $x in R$ has $v(x)=0$ iff $v(x^(-1))=0$ (since $v(1)= v(x x^(-1)) = v(x)+v(x^(-1))$) iff $x$ is invertible in $R$. As a result, one has all element $x in R\\m$ being invertible, which $R,m$ forms a local ring.

(for more information, check Atiyah-Macdonald, and also Hartshorne Chapter 1 Section 6).

\ 

== The Valuative Criterion of Separatedness
#theorem("Valuative Criterion of Separatedness")[
  Let $f:X->Y$ be a morphism of schemes, with assumption $X$ is Noetherian, then $f$ is separated iff the following holds:
  - for any valuation ring $R$ with fraction field $K$, let $T=Spec(R)$, $U=Spec(K)$, let $j:U->T$ be the morphism induced by the inclusion $R arrow.hook K$ (which brings $U={*}$ to the generic point of $T$, namely the zero ideal). Then, given any morphism $alpha:T->Y$ and morphism $alpha':U->X$ such that the following diagram commutes:
  #set align(center)
  #diagram($
             U edge("d","hook->", script(j)) edge(->, script(alpha')) & X edge("d",->, script(f), #left)\
             T edge("ur","..>") edge(->, script(alpha), #right) & Y
           $)
  #set align(left)
  Then, there exists at most one morphism $h:T->X$ making the whole diagram commutes.
][]
Note here that $j$ is an open embedding if $R$ is a Discrete Valuation Ring (as the map $R arrow.hook K$ induces $U arrow.hook T$ by mapping the zero ideal to the zero ideal; moreover, $R$ only has one nonzero prime/maximal ideal, so the set of zero ideal is open). 

More generally (in Vakil), if $X$ is locally Noetherian, then $R$ can be taken as Discrete Valuation Rings (the general case requires Valuation Ring that're not discrete).

Introduce some lemma:
#lemma[
  With the notation of $R,K,U,T$:
  - Giving a morphism $U->Y$ is equivalent to giving a point $x_1 in X$ and inclusion of fields $k(x_1) arrow.hook K$.
  - Giving a morphism $T->Y$ is equivalent to giving two points $x_0,x_1 in Y$, with $x_0$ being a specialization of $x_1$, and an inclusion $k(x_1) arrow.hook K$, such that $R$ dominates the local ring $cal(O)_(x_0)$ on $Z=overline({x_1}) subset Y$, with its reduced induced structure.
][
  The first part is fine: A morphism $alpha':U -> Y$ induces a local homomorphism $alpha'^\#: cal(O)_(Y, alpha'(0)) -> cal(O)_(U, 0) = K$ (since $U$ is a one-point scheme of the field $K$). Denotes $x_1:= alpha'(0)$, it factors through an embedding of residue field $k(x_1) arrow.hook K$.

  Conversely, if pick a point $x_1 in Y$ and there is an embedding $k(x_1) arrow.hook K$, choose an open affine neighborhood $x_1 in V subset.eq Y$, with $V=Spec(A)$, then there is a ring homomorphism $A -> cal(O)_(Y, x_1) = cal(O)_(V,x_1) ->> k(x_1) arrow.hook K$, which revert to a morphim $U -> V arrow.hook Y$.

  \ 

  For the second part, since $R$ is a valuation ring, it only has one maximal ideal, say $t_0 := frak(m)$ is the closed point of $T= Spec(R)$ (the maximal ideal), and $t_1 = (0)$ be the generic point of $T$ (the zero ideal). Given a morphism $alpha:T-> X$, denote $x_i = alpha(t_i)$, then with $T$ being reduced (since $R$ is an integral domain), it uniquely factors to a morphism $alpha:T -> Z = overline({x_1})$ (as $alpha(overline({t_1})) subset.eq overline({alpha(t_1)}) = overline({x_1})$ by continuity, and the reduced induced structure guarantees the uniqueness, cf. exercise 3.11 in Hartshorne Chapter 2). This generates a morphism $cal(O)_(x_0, Z) -> cal(O)_(t_0, T) = R$ (as $t_0$ is the closed point of $T=Spec(R)$), and another morphism $ cal(O)_(x_1, Z) -> cal(O)_(t_1, T) = K$ (as $t_1$ is the generic point of $T=Spec(R)$, then the stalk is the field of fraction). And, since they're induced by the same morphism of schemes, they're compatible (and the second one factors to $k(x_1) arrow.hook K$). So, $R$ dominates $cal(O)_(x_0,Z)$.

  For the converse, given $x_0,x_1 in Y$, with the inclusion $k(x_1) arrow.hook K$, and $R$ dominates $cal(O))_(x_0, Z)$, then $cal(O)_(x_0, Z) arrow.hook R$ reverses to a morphism of affine schemes $T -> Spec(cal(O)_(x_0, Z))$. Which, choose an open affine neighborhood $x_1 in V subset.eq Y$, $V=Spec(A)$, we have a natural map $A-> cal(O)_(x_0,Z)$, which generates $Spec(cal(O)_(x_1,Z))-> V arrow.hook Y$. Compose the two maps generates it.
]

\ 

#lemma[
  Let $f:X->Y$ be a quasi-compact morphism of schemes (so, the preimage of some affine covers are quasi-compact; equivalently all affine open has preimage being quasi-compact). Then, the subset $f(X) subset.eq Y$ is closed $<==>$ it's stable under specialization (i.e. every point in the image, has the closure in the image).
][
  $==>:$

  If it's closed, it's closed under specialization (as any $a in f(X)$ has $overline({a}) subset.eq overline(f(X))=f(X)$).

  \ 

  $<==:$

  Suppose $f(X)$ is closed under specialization. Then, we can replace $Y$ by $overline(f(X))$, using its reduced induced structure, and $X$ can be assumed as reduced (as we always have the morphism $X_("red")-> X$, which is identity on the topological space). So, we just need to consider $f:X-> overline(f(X))$, both source and target are reduced.

  \ 

  Let $y in overline(f(X))$ be a point, we need to show $y in f(X)$. Choose an open affine neighborhood $y in V subset.eq Y$, and take the nonempty preimage $U = f^(-1)(V)$ (not necessarily affine), but by quasi-compactness of $f$, $U = union.big_(i=1)^n X_i$, where each $X_i$ is open affine. (Note: The intersection of closed subset with reduced induced structure, together with an open affine, generates an open affine on the closed subscheme, as topologically the intersection is homeomorphic to a closed subscheme of an affine scheme, which is also affine. That's why the restriction doesn't destroy the quasi-compactness, as taking the larger open affine in $Y$, take the preimage, it's quasi-compact; then, the intersection as the closed part pullsback to a closed subset of the preimage, which is also quasi-compact).

  \ 
  
  As a result,  since $overline(f(U))= union.big_(i=1)^n overline(f(X_i))$, we have $y in overline(f(X_i))$ for some $i$. Finally, restrict to $f:X_i -> overline(f(X_i))$ (with its reduced induced structure). Now, because $overline(f(X_i))$ is a closed subset of $V$ (which is affine), then $f$ restricts to morphisms between affine schemes, and in particular is dominant (hence injective on the rings).

  Let $overline(f(X_i))=Spec(A)$, $X_i = Spec(B)$, then $f:Spec(B)-> Spec(A)$ (dominant) reverses to an injective ring homomorphism $f^\#:A arrow.hook B$ (Note: Both $A,B$ are reduced by the construction). Which, $y in overline(f(X_i))$ corresponds to a prime ideal, say $P subset.eq A$. Consider $P' subset.eq P$ as a minimal prime ideal contained in $P$. Then, $P'$ corresponds to a point $y' in overline(f(X_i))$, such that $y$ is a specialization of $y'$ (or, $y in overline({y'})$, which is a set of all prime ideals containing $y'=P'$). The goal is to claim $y' in f(X_i)$ (then by the assumption of closed under specialization, we automatically has $y in overline({y'}) subset.eq f(X)$).

  \ 

  Consider $A_(P') arrow.hook B_(P') tilde.equiv B tensor_A A_(P')$. The injectivity is because of the exactness of localization. Now, since localizing by a minimal prime ideal over a reduced ring forms a field (since $P' A_(P')$ is the one and only prime ideal of $A_(P')$ by minimality of $P' subset A$, showing $P' A_(P') = Nil(A_(P'))$; then, reduced structure guarantees it to be $0$). Then, for any prime ideal $Q' subset B tensor_A A_(P')$, we must have $Q' sect A_(P') = (0)$ (as the pullback of proper ideal must be proper). Given the map $A -> A_(P') arrow.hook B tensor_A A_(P')$, let $Q subset A$ be the preimage of $Q'$, since $Q' sect A_(P')=(0)$, then $Q = P'$ (since it's the preimage of $Q' sect A_(P')$). This shows that $P' = y' in f(X_i)$, by considering the following commutative diagram:
  #set align(center)
  #diagram($
             A edge("hook->") edge("d",->) & B edge("d",->)\
             A_(P') edge("hook->" )& B tensor_A A_(P')
           $)
  #set align(left)
  Where, take $(Q')^c subset B$, it's a prime ideal that contracts to $Q = P' subset A$ based on the commutativity. So, we have $P'$ being a contraction for some prime ideal in $B$, then $y' = P' in f(X_i)$, finishes the proof.
]

\ 

Now, here's the actual proof of the theorem:

#proof[
  $==>:$

  First, suppose $f:X->Y$ is separated, let $R$ be a valuation ring, $K$ its field of fraction, $U = Spec(K)$, $T = Spec(R)$. Suppose $alpha:T-> Y$ and $alpha':U->X$, together with two morphisms $h,h':T-> X$ forms the following commutative diagram:
  #set align(center)
  #diagram($
             U edge("d","hook->",script(j)) edge(->, script(alpha')) & X edge("d",->, script(f), #left)\
             T edge(->, script(alpha), #right) edge("ur",->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) & Y
           $)
  #set align(left)
  Then, since $f compose h=f compose h'$, consider the unique morphism $h'':T -> X times_Y X$, such that $p_1 compose h''= h$, and $p_2 compose h'' = h'$:
  #set align(center)
  #diagram($
             T edge("dr","..>", script(exists ! h'')) edge("drr",->, script(h), bend: #20deg) edge("ddr",->, script(h'), bend: #(-20deg))\
            & X times_Y X edge(->, script(p_1)) edge("d",->, script(p_2)) & X edge("d",->, script(f), #left)\
            & X edge(->, script(f), #right) & Y

           $)
  #set align(left)
  Now, compose $h,h'$ with $j:U arrow.hook T$, since the first diagram tells us that $h compose j=h' compose j:U -> X$, then $h''(U) subset.eq Delta(X)$, then the generic point $t_1 in T$ has its diagonal image in $Delta(X)$. By the closeness of $Delta(X)$ (the separatedness of $f$), we have the closed point $t_0 in overline({t_1})$ also has its diagonal image in $Delta(X)$.

  As a result, $h(t_0)=x_0=h'(t_0)$, and $h(t_1)=x_1=h'(t_1)$, and also they both induces the same embedding $k(x_1) arrow.hook K$ (the structure sheaf morphism of $j compose h=j compose h'$, which is also the same on stalk of $x_1$), it follows that $h=h'$ by the first lemma of this subsection. (Wait, why is th valuation ring $R$ dominating the local ring $cal(O)_(X, x_0)$?)

  \ 

  $<==:$

  Now, suppose the valuative criterion holds. To show that $f$ is separated, one of the previous propositions suggested we only need to check if $Delta(X) subset.eq X times_Y X$ is closed subset. Also, with $X$ being Noetherian scheme, any of its open subset is quasi-compact, in particular $Delta$ is a quasi-compact morphism. So, we only need to check if it's closed under specialization.

  Let $xi_1 in Delta(X)$ be a point, and $xi_0 in overline({zeta_1})$ be one of its specialization. Consider the field $K = k(xi_1)$, and $cal(O)_(Z, xi_0)$ be the local ring of $xi_0 in Z=overline({xi_1})$ (with reduced induced structure, which automatically becomes integral). Then, restrict to an affine neighborhood $V= Spec(A)$ of $xi_0$ in $X times_Y X$ (which automatically contains $xi_1$), we see that $xi_1$ is the generic point of the affine neighborhood. Then, as a result $K = k(xi_1)$ contains $cal(O)_(Z,xi_0)$ (since the field of fraction of $A$ is $K$, and it contains all localization of $A$). So, given $cal(O)_(Z, xi_0) arrow.hook K$, it's dominated by some valuation ring $R arrow.hook K$.

  \ 

  Let $U = Spec(K)$, $T=Spec(R)$, then the ring homomorphism $A arrow.hook cal(O)_(Z, xi_0) arrow.hook R arrow.hook K$ generates a morphism of schemes $U arrow.hook T -> V arrow.hook X times_Y X$, let $h'': T-> V arrow.hook X times_Y X$, so the two morphisms $h = p_1 compose h'', h' = p_2 compose h''$ are two morphisms that satisfies the following commutative diagram:
  #set align(center)
  #diagram($
             U edge("d","hook->",script(j)) edge(->, script(alpha')) & X edge("d",->, script(f), #left)\
             T edge(->, script(alpha), #right) edge("ur",->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) & Y
           $)
  #set align(left)
  This reason is because: With $t_0 in overline({t_1})$ (where $t_1 in T$ the generic point, or the image of $j:U arrow.hook T$), the above has image of $t_i$ in $Z$ being $xi_i$, in particular with $xi_1 in Delta(X)$ by assumption, then $h(t_1)=h'(t_1)$ (as $t_1$ maps to $xi_1 in Delta(X)$, so the projection $p_1,p_2$ sends it to the same point in $X$). Hence, by the assumption of valuative criterion, $h=h'$.

  \ 

  As a result, $h'': T-> X times_Y X$ factors through the diagonal morphism $Delta:X -> X times_Y X$, showing that $t_0 mapsto xi_0 in Delta(X)$, so $Delta(X)$ is closed under specialization.
]

\ 

\ 

As a side note, $p_1 (xi)=p_2 (xi)$ doesn't imply $xi in Delta(X)$ (as in general scheme product is a lot different from set product). And, the Noetherian property can be omitted in general

\ 

Here are some properties of separated morphisms (which can be deduced using Valuative Criterion a lot easier than bruteforcing it):
#corollary[
  1. Open and closed immersions are separated.
  2. Composition of separated morphisms is separated.
  3. Separated morphisms are stable under base change.
  4. If $f:X->Y$ and $f':X'->Y'$ are separated morphisms of schemes over a base scheme $S$, then $f times f':X times_S X' -> Y times_S Y'$ is also separated.
  5. If $f:X->Y$ and $g:Y->Z$ are two morphisms such that $g compose f:X->Z$ is separated, then $f$ is separated.
  6. A morphism $f:X->Y$ is separated $<==>$ $Y$ can be covered by open subsets ${V_i}$, such that $f:f^(-1)(V_i)-> V_i$ is separated for each $i$.
][
  1. For open immersion $X arrow.hook Y$, the fibre product has $X times_Y X tilde.equiv X$ (since the topological map is injective, then any schemes with two morphisms to $X$ satisfying the fibre square must have the two morphisms being the same), hence $Delta:X-> X times_Y X$ is identity, which is obviously closed.

    Then, for closed immersion $f:X arrow.hook Y$, WLOG cover $Y$ with affine open subsets ${V_i}$ (each $V_i = Spec(A_i)$), then as a result each $X sect V_i$ is affine, and $X sect V_i = Spec(A_i\/I_i)$ for some ideal $I_i subset A_i$. So, when restricting the fibre square to these open covers ${V_i}$, we get:
    #set align(center)
    #diagram($
               X sect V_i edge("dr",->, script(Delta)) edge("drr", ->, script(id), bend: #20deg) edge("ddr",->, script(id), bend: #(-20deg))\
               &(X sect V_i) times_(V_i) (X sect V_i) edge(->, script(p_1)) edge("d",->, script(p_2), #right) & X sect V_i edge("d","hook->")\
               &X sect V_i edge("hook->") & V_i
             $)
    #set align(left)
    Which, it reverses to the following diagram of ring homomorphisms:
    #set align(center)
    #diagram($
               A\/I\ 
               & A\/I tensor_A A\/I edge("ul",->>, script(m)) & A\/I edge("l", ->, script(iota_2)) edge("ull",->, script(id), bend: #(-20deg))\
               & A\/I edge("uul",->, script(id), bend: #(20deg)) edge("u",->, script(iota_1)) & A edge("l",->>) edge("u",->>)
             $)
    #set align(left)
    Here, $m$ denotes the multiplication map (as the multiplication is consistent with the $A$-action on $A\/I$), even stronger we have $A\/I tensor_A A\/I tilde.equiv A\/I$, then in particular $Delta|_(X sect V_i): Spec(A\/I)arrow.hook Spec(A\/I tensor_A A\/I)$ is an isomorphism. Since it restricts to isomorphism on open covers, together with the fibre product property (where restriction onto preimages of open subsets, is the fibre product of the preimages), then one again has $X times_Y X tilde.equiv X$.

    \ 

  2. Suppose $f:X->Y$, $g:Y->Z$ are both separated, the goal is proving $g compose f:X->Z$ is separated. Then, consider the valuative criterion on $g compose f$ (with the same notation as before), suppose the following diagram holds:
    #set align(center)
    #diagram($
              U edge("d","hook->", script(j), #right) edge(->, script(alpha')) & X edge(->, script(f)) & Y edge("d",->, script(g), #left)\
              T edge("ur", ->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) edge("rr",->, script(alpha), #right) && Z
            $)
    #set align(left)
    Notice that $f compose h, f compose h':T->Y$ are two "diagonal direction" morphisms that makes the large commutative square holds, hence by valuative criterion on $g$, we have $f compose h=f compose h'$.

    Then, it reduces to the following commutative diagram:
    #set align(center)
    #diagram($
              U edge(->, script(alpha')) edge("d","hook->", script(j)) & X edge("d",->, script(f), #left)\
              T edge("ur", ->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) edge(->, script(f compose h=f compose h'), #right) & Y
            $)
    #set align(left)
    Then, valuative criterion on $f$ guarantees $h=h'$. This shows that $g compose f$ satisfies the valuative criterion for separatedness, hence is separated.

    \ 

  3. Let $f:X->Y$ be separated, and $b:Y'->Y$ be a morphism of schemes. Let $f':X times_Y Y' -> Y'$ be the pullback of $f$ (and $b':X times_Y Y' -> X$ be the pullback of $b$). Then, use the valuative criterion on $f'$, say the following diagram holds:
    #set align(center)
    #diagram($
               U edge(->, script(alpha')) edge("d","hook->", script(j), #right) & X times_Y Y' edge(->, script(b')) edge("d",->, script(f'), #left) & X edge("d",->, script(f), #left)\
               T edge("ur", ->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) edge(->, script(alpha), #right) & Y' edge(->, script(b), #right) & Y
             $)
    #set align(left)

    As a result, since $f$ is separated, the valuative criterion on $f$ guarantees $b' compose h=b' compose h'$. 

    Now, denote $beta := b' compose h = b' compose h'$. Notice that it satisfies the following diagram with fibre product:
    #set align(center)
    #diagram($
               T edge("ddr",->, script(alpha), bend: #(-20deg)) edge("drr",->, script(beta), bend: #(20deg)) edge("dr","..>", script(exists ! h''))\
               & X times_Y Y' edge("d",->, script(f')) edge(->, script(b')) & X edge("d",->, script(f), #left)\
               & Y' edge(->, script(b), #right) & Y
             $)
    #set align(left)
    Which, $b' compose h = b' compose h' = beta = b' compose h''$, then by the universality of fibre product, $h=h' = h''$, which finishes the valuative criterion on $f'$.

    \ 

  4. Given the setup, notice we have the following commutative diagram:
    #set align(center)
    #diagram($
               X edge("d",->, script(f), #right) & X times_S X' edge("d", ->, script(f times f')) edge("l",->, script(p_X)) edge(->, script(p_X')) & X' edge("d",->, script(f'), #left)\
               Y & Y times_S Y' edge("l",->, script(p_Y), #left) edge(->, script(p_Y'), #right) & Y'
             $)
    #set align(left)
    Apply valuative criterion to $f times f'$, we have the following diagram:
    #set align(center)
    #diagram($
              U edge(->, script(alpha')) edge("d","hook->", script(j)) & X times_S X' edge("d",->, script(f times f'), #left) edge(->, script(p_X)) & X edge("d",->, script(f), #left)\
              T edge("ur", ->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) edge(->, script(alpha), #right) & Y times_S Y' edge(->, script(p_Y), #right) & Y
            $)
    #set align(left)
    #set align(center)
    #diagram($
              U edge(->, script(alpha')) edge("d","hook->", script(j)) & X times_S X' edge("d",->, script(f times f'), #left) edge(->, script(p_X')) & X' edge("d",->, script(f'), #left)\
              T edge("ur", ->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) edge(->, script(alpha), #right) & Y times_S Y' edge(->, script(p_Y'), #right) & Y'
            $)
    #set align(left)
    Which, valuative criterion on $f,f'$ forces $a:=p_X compose h=p_X compose h'$, and $b:=p_X' compose h=p_X' compose h'$. Then, using the universality of $X times_S X'$, notice that it enforces $h=h'$, due to the following commutative diagram:
    #set align(center)
    #diagram($
               T edge("dr",->, script(h), shift: #3pt) edge("dr",->, script(h'), #right, shift: #(-3pt)) edge("drr",->, script(a), bend: #20deg) edge("ddr",->, script(b), bend: #(-20deg))\ 
               & X times_S X' edge("d",->, script(p_X')) edge(->, script(p_X)) & X edge("d",->)\
               & X' edge(->) & S
             $)
    #set align(left)
    This shows that $f times f': X times_S X'-> Y times_S Y'$ is separated.

    \ 

  5. Suppose $f:X->Y$, $g:Y->Z$ such that $g compose f$ is separated, apply valuative criterion to $f$, say the following diagram holds:
    #set align(center)
    #diagram($
               U edge("dd","hook->", script(j)) edge("rr",->, script(alpha)) && X edge("d",->, script(f), #left)\
               && Y edge("d",->, script(g), #left)\
               T edge("uurr", ->, script(h), shift: #3pt) edge("uurr",->, script(h'), #right, shift:#(-3pt)) edge("urr",->, script(alpha), #right) edge("rr",->, script(g compose alpha), #right) && Z
             $)
    #set align(left)
    It follows immediately that $h=h'$, using the valuative criterion on $g compose f$, and its separatedness.

    \ 

  6. First, if $f:X->Y$ is separated, it's clear that for any open subset $V subset.eq Y$, $f:f^(-1)(V)-> V$ is separated (since the diagonal morphism of this restriction, is $Delta:f^(-1)(V) -> f^(-1)(V) times_V f^(-1)(V)$, which is precisely the preimage of $V$ under the fibre product $X times_Y X$).

    \ 

    Conversely, if there exists open cover ${V_i}$ of $Y$, such that each $f^(-1)(V_i)-> V_i$ is separated, then apply the valuative criterion, suppose the following holds:
    #set align(center)
    #diagram($
              U edge(->, script(alpha')) edge("d","hook->", script(j)) & X edge("d",->, script(f), #left)\
              T edge("ur", ->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) edge(->, script(alpha), #right) & Y
            $)
    #set align(left)
    Then, let $t_0,t_1 in T$ denotes its closed point and generic point of $T$, respectively. Then, consider $y_i = alpha(t_i) in Y$, then notice the following:
    $ t_0 in overline({t_1})==> y_0 = alpha(t_0) in alpha(overline({t_1})) subset.eq overline({alpha(t_1)}) = overline({y_1})  $
    Since $y_0 in V_j$ for some $j$, then it implies $y_1 in V_j$ also. By restricting to suitable affine neighborhood in $V_j$, and pass to its reduced structure (in that case the affine subset will be integral), we can see it induces a morphism $T -> V_j$ that must agree with $T->Y$.
    
    Hence, the morphism $alpha:T->Y$ has its image solely contained in one of the $V_j$, similarly $alpha':U-> X$ has all its image contained in $f^(-1)(V_j)$. Also, it enforces $h,h'$ to have image contained in $f^(-1)(V_j)$ (since $f compose h=f compose h' = alpha$ has image in $V_j$). So, it reduces to the following:
    #set align(center)
    #diagram($
              U edge(->, script(alpha')) edge("d","hook->", script(j)) & f^(-1)(V_j) edge("d",->, script(f), #left)\
              T edge("ur", ->, script(h), shift: #3pt) edge("ur",->, script(h'), #right, shift:#(-3pt)) edge(->, script(alpha), #right) & V_j
            $)
    #set align(left)
    As a result, the separatedness of the above restriction forces $h=h'$, proving the desired result.
]

\ 

Damn the results are massive...Anyway, separatedness has another really powerful application:
#corollary[
  Let $X$ be a separated scheme (i.e. $X-> Spec(ZZ)$ is separated). Let $U,V subset.eq X$ be two affine open subsets, such that $U sect V!= emptyset$. Then, $U sect V$ is also affine in $X$.
][
  Look at the product of open subsets $U times V arrow.hook X times X$, and consider the following fibre product:
  #set align(center)
  #diagram($
             N edge("hook->", script(p_(u,v))) edge("d","hook->", script(p_(x)), #right) & U times V edge("d","hook->", script(iota), #left)\
             X edge("hook->", script(Delta), #right) & X times X
           $)
  #set align(left)  
  Since the diagonal morphism $Delta:X arrow.hook X times X$ is a closed immersion, and the pullback of closed immersion is a closed immersion, then $N arrow.hook U times V$ is a closed immersion. With $U,V$ being affine, $U times V$ is also affine, so $N$ as a closed subscheme of it, is also affine.

  Finally, notice that $N tilde.equiv U sect V$: It's clear how $U sect V$ satisfies the fibre square (as it includes into both $U,V$, and $X$). To show that it satisfies the universality, suppose $w_1:W-> X$ and $w_2: W-> U times V$ satisfies the following commutative diagram:
  #set align(center)
  #diagram($
             W edge("drr",->, script(w_2), bend: #20deg) edge("ddr",->, script(w_1), bend: #(-20deg))\
             &U sect V edge("hook->", script(p_(u,v))) edge("d","hook->", script(p_(x)), #right) & U times V edge("d","hook->", script(iota), #left)\
             &X edge("hook->", script(Delta), #right) & X times X
           $)
  #set align(left) 
  Then, let $p_1,p_2:X times X->X$ be the projection onto the first / second factor respectively (which also restricts to $p_1:U times V->U$, $p_2:U times V->V$), we have the following:
  $ &p_1 compose Delta compose w_1(W)= p_1 compose iota compose w_2(W) subset.eq U\ 
  &p_2 compose Delta compose w_1(W)= p_1 compose iota compose w_2(W) subset.eq V $
  And, since $p_1 compose Delta = p_2 compose Delta = id_X$, we have $w_1(W) subset.eq U,V$, showing it uniquely factors into $w_1:W -> U sect V$ (as the topological image belong in it). Finally, the uniqueness of the morphism $W -> U sect V$ is enforced (as composing with the inclusion $U sect V arrow.hook X$, it must agree with $w_1$). So, $N tilde.equiv U sect V$, showing the intersection is affine.
]

\ 

== Properness \& The Valuative Criterion of Properness

For this, let's review / extend the definition of a morphism being universally closed:
#definition[Universally Closed Morphism][
  Let $f:X->Y$ be a morphism of schemes. It is universally closed, if for any base map $b:Y' -> Y$, the pullback $f':X times_Y Y' -> Y'$ is a closed map:
  #set align(center)
  #diagram($
             X times_Y Y' edge("d",->, script(f'), #right) edge(->, script(b')) & X edge("d",->, script(f), #left)\
             Y' edge(->, script(b), #right) & Y
           $)
  #set align(left)
]
If going back to general topology class (where fibre product is just a subset of set wise product), then any $X$ being compact and $Y$ being Housdorff has this property. So, the goal is to characterize similar results in scheme theory, that replaces the idea of compact housdorff with "Properness" (similar to the relation between "separatedness" and "Housdorff"):
#definition[Proper Morphism][
  Let $f:X->Y$ be a morphism of schemes, then it's #text(weight: "bold")[Proper], if it's separated, finite type, and universally closed.
]

\ 

Similar to the concepts of separatedness, we again have the valuative criterion for properness:
#theorem("Valuative Criterion for Properness")[
  Let $f:X->Y$ be a morphism of finite type, and $X$ Noetherian. Then, $f$ is proper $<==>$ for every valuation ring $R$ ($T=Spec(R)$) and its field of fraction $K$ ($U=Spec(K)$), with morphism $alpha':U->X$, $alpha:T-> Y$, and inclusion $j:U -> T$, there exists a unique morphism $h:T->X$ such that the following diagram holds:
  #set align(center)
  #diagram($
             U edge("d","hook->", script(j)) edge(->, script(alpha')) & X edge("d",->, script(f), #left)\
             T edge("ur","..>", script(exists ! h)) edge(->, script(alpha), #right) & Y
           $)
  #set align(left)
][
  $==>:$

  Suppose $f$ is proper, and we have the above diagram, with $h$ existing. Then, the separatedness of $f$ forces $h$ to be unique, so it suffices to check existence.

  Now, consider $alpha:T->Y$ as the base change, we have the following fibre product:
  #set align(center)
  #diagram($
             X times_Y T edge("d",->, script(f'), #right) edge(->, script(alpha')) & X edge("d",->, script(f), #left)\
             T edge(->, script(alpha), #right) & Y
           $)
  #set align(left)
]
