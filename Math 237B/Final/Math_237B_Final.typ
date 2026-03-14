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
    colors: ergo-colors.bw,  
    styles: ergo-styles.basic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 237B Final",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(a)")

= D//1
#problem[
  Let $X xarrow(f) Y xarrow(g) Z$ be morphisms of schemes such that $g compose f$ is proper, $g$ is quasi-projective and $f$ is surjective. Prove or disprove that $g$ is proper.

  \ 

  #line(length: 100%)

  \ 
][
  We'll prove that $g$ is proper. We'll prove relevant statements in the following order:
  + $g$ is separated, and $f$ is proper.
  + $g$ is of finite type.
  + $g$ is universally closed.
  Finally, use these results we can conclude that $g$ is proper.

  \ 

  \ 

  #text(weight: "bold")[Proof of (a):]

  Since $g:Y->Z$ is quasi-projective, there exists some scheme $Y'$, together with open immersion $iota:Y arrow.hook Y'$ and projective morphism $pi:Y'->Z$, such that the following commutative diagram holds:
  #set align(center)
  #diagram($
             Y edge("hook->", script(iota)) edge("d",->, script(g)) &Y' edge("dl",->, script(pi), #left)\
             Z
           $)
  #set align(left)
  Which, recall that any open immersion is separated, and projective morphisms are proper (in particular separated), so $g = pi compose iota$ is also separated.

  As a consequence, since $g compose f$ is proper, while $g$ is separated, we concluded that $f$ is proper also.

  \ 

  \

  #text(weight: "bold")[Proof of (b):]

  First, let's show $g$ is locally of finite type: Using the diagram in part (a), since $pi:Y'->Z$ is projective, it is proper (hence of finite type), so for any open affine subset $U subset.eq Z$ (say $U tilde.equiv Spec(A)$), such that $pi^(-1)(U) = union.big_(i=1)^n V_i$, where each $V_i$ is affine open subset, and $V_i tilde.equiv Spec(B_i)$ for some $B_i$ that's finitely generated $A$-algebra.

  Then, with open immersion $iota:Y arrow.hook Y'$, one has $iota^(-1)(pi^(-1)(V)) = Y sect f^(-1)(V) = union.big_(i=1)^n Y sect V_i$. Since $Y$ is open in $Y'$, each $Y sect V_i$ is an open subset of $V_i$ under its subspace topology, hence each $Y sect V_i = union.big_(j in J_i)D(f_(i j))$ for some $f_(i j) in B_i$ (running over some index set $J_i$). Because each $D(f_(i j)) tilde.equiv Spec((B_i)_(f_(i j)))$ (which $(B_i)_(f_(i j))$ is a finitely generated $B_i$-algebra), then with $B_i$ being a finitely generated $A$-algebra, $(B_i)_(f_(i j))$ is a finitely generated $A$-algebra also.

  As a result, one has $g^(-1)(U)=iota^(-1)(pi^(-1)(U)) = union.big_(i=1)^n Y sect B_i = union.big_(i=1)^n union.big_(j in J_i)D(f_(i j))$, where each $D(f_(i j)) tilde.equiv Spec((B_i)_(f_(i j)))$ has $(B_i)_(f_(i j))$ being a finitely generated $A$-algebra. Since $U subset.eq Z$ is arbitrary affine open subset, this shows $g$ is locally of finite type.

  \ 

  Then, let's show $g$ is of finite type: Use the previous notation, since $g compose f$ is finite type, it's quasi-compact, hence with affine open subset $U subset.eq Z$, one has $(g compose f)^(-1)(U) = f^(-1)(g^(-1)(U))$ being quasi-compact. However, since $f$ is surjective, one has $g^(-1)(U) = f(f^(-1)(g^(-1)(U)))$. Because it's an image of a quasi-compact set under continuous map, $g^(-1)(U)$ is quasi-compact. Hence, the previous cover for locally of finite type property, say $g^(-1)(U) = union.big_(i=1)^n union.big_(j in J_i)D(f_(i j))$, can be chosen as finite. This shows that $g$ is of finite type.

  \

  \ 

  #text(weight: "bold")[Proof of (c):]

  To prove $g$ is universally closed, for any morphism of schemes $h:Z' -> Z$ consider the following commutative diagram of multiple fibre products:
  #set align(center)
  #diagram($
             (Z' times_Z Y) times_Y edge("d",->>, script(f'), #right) edge(->, script(h'')) X & X edge("d",->>, script(f), #left)\
              Z' times_Z Y edge(->, script(h')) edge("d",->, script(g'), #right) & Y edge("d",->, script(g), #left)\
             Z' edge(->, script(h), #right) & Z
           $)
  #set align(left)
  Which:
  - $g':Z' times_Z Y->Z'$ denotes the base change of $g:Y->Z$ by $h:Z' -> Z$.
  - $f':(Z' times_Z Y) times_Y X->> Z' times_Z Y$ denotes the base change of $f:X->>Y$ by $h':Z' times_Z Y-> Y$ (the pullback of $h:Z'->Z$), which the surjectivity of $f$ ensures the surjectivity of $f'$. And, since part (a) shows $f$ is proper (whic is universally closed), then $f'$ is closed.

  \ 

  Now, we ought to show $(Z' times_Z Y) times_Y X$ together with $g' compose f'$ and $h''$ satisfies the universal property of the fibre product $Z' times_Z X$. For any scheme $W$ together with two morphisms $p_1:W-> X$ and $p_2:W->Z'$, such that $(g compose f) compose p_1=h compose p_2$. Then, the universal property of $Z' times_Z Y$ guarantees a unique morphism of schemes $phi:W -> Z' times_Z Y$, such that $p_2= g' compose phi$, and $f compose p_1 = h' compose phi$, as follow:
  #set align(center)
  #diagram($
             W edge("dddr", ->, script(p_2), #right, bend: #(-20deg)) edge("drr",->, script(p_1), bend:#30deg) edge("ddr","..>", script(exists ! phi), #right, bend: #(-10deg))\
             &(Z' times_Z Y) times_Y edge("d",->>, script(f'), #right) edge(->, script(h'')) X & X edge("d",->>, script(f), #left)\
             &Z' times_Z Y edge(->, script(h')) edge("d",->, script(g'), #right) & Y edge("d",->, script(g), #left)\
             &Z' edge(->, script(h), #right) & Z
           $)
  #set align(left)

  Furthermore, with the universal property of $(Z' times_Z Y) times_Y X$, the equality $f compose p_1 = h' compose phi$ guarantees a unique morphism of schemes $psi:W-> (Z' times_Z Y) times_Y X$, such that $phi = f' compose psi$ and $p_1 = h'' compose psi$, as follow:
  #set align(center)
  #diagram($
             W edge("dddr", ->, script(p_2), #right, bend: #(-40deg)) edge("drr",->, script(p_1), bend:#30deg) edge("ddr","..>", script(exists ! phi), #right, bend: #(-20deg)) edge("dr","..>", script(exists ! psi))\
             &(Z' times_Z Y) times_Y edge("d",->>, script(f'), #right) edge(->, script(h'')) X & X edge("d",->>, script(f), #left)\
             &Z' times_Z Y edge(->, script(h')) edge("d",->, script(g'), #right) & Y edge("d",->, script(g), #left)\
             &Z' edge(->, script(h), #right) & Z
           $)
  #set align(left)
  This proves both the existence and the uniqueness of the morphism $psi:W-> (Z' times_Z Y)times_Y X$, such that $p_2 = g' compose phi = (g' compose f') compose psi$, and $p_1 = h'' compose psi$ (as any $psi':W->(Z' times_Z Y) times_Y X$ with such property is enforced to be equal to $psi$, based on individual fibre product's property). So, $(Z' times_Z Y) times_Y X$ indeed satisfies the universal property of $Z' times_Z X$, showing that $g' compose f'$ is the base change of the morphism $(g compose f):X->Z$. Which, since $g compose f$ is proper, $g' compose f'$ is closed.

  \ 

  Finally, with $f'$ and $g' compose f'$ being closed, and $f'$ being surjective, we claim that $g'$ is closed: 
  
  For any closed subset $V subset.eq Z' times_Z Y$, by the continuity of $f'$, the subset $(f')^(-1)(V) subset.eq (Z' times_Z Y)times_Y X$ is closed. Hence, $(g' compose f')((f')^(-1)(V)) subset.eq Z'$ is closed (by closeness of $g' compose f'$).

  Also, since $f'$ is surjective, one simply has $f' ((f')^(-1)(V)) = V$. Hence, the above set equality shows that $(g' compose f')((f')^(-1)(V)) = g'(V) subset.eq Z'$ is closed. This proves that $g'$ is closed.

  \

  With $g'$ being based change of $g$ over arbitrary morphism of schemes $h:Z'->Z$, this shows that $g$ is universally closed.

  \

  \

  With all information above, we can conclude that $g$ is separated, finite type, and universally closed, hence proper.
]

#pagebreak()

= ND (finish the segre embedding)//2

#problem[
  Let $f:X->S$ and $g:Y->S$ be projective morphisms. Prove or disprove that the projection map $X times_S Y -> S$ is projective.

  \ 

  #line(length: 100%)

  \ 
][
  We'll show that $X times_S -> S$ is projective. We'll prove the following two statements:
  + Base change of projective morphisms are projective.
  + Composition of projective morphisms are projective.

  Then, the two will help conclude the desired result.

  \ 

  \

  #text(weight: "bold")[Proof of (a):]

  First, we'll show that base change preserves projective spaces: More precisely, given any $n in NN$, with morphisms $g:Y->S$, the projective $n$-space over $S$, $pi:PP^n_S -> S$ has fibre product $Y times_S PP^n_S$ satisfies the universal property of $PP^n_Y$.

  Indeed, with the definition of $PP^n_S := S times_Spec(ZZ) PP^n_ZZ$, we form the following commutative diagram:
  #set align(center)
  #diagram($
             Y times_S PP^n_S edge("d",->, script(pi')) edge(->, script(g')) & PP^n_S edge(->, script(s')) edge("d",->, script(pi), #left) & PP^n_ZZ edge("d",->, script(phi))\
             Y edge(->, script(g), #right) & S edge(->, script(s), #right) & Spec(ZZ)
           $)
  #set align(left)
  Where, both small squares are fibre product diagrams. Also, the morphism $s compose g:Y -> Spec(ZZ)$ is the unique morphism based on the terminal property of $Spec(ZZ)$ in the category of schemes.
  
  Now, given any scheme $W$ together with two morphisms $p_1:W->PP^n_ZZ$ and $p_2:W->Y$, such that $phi compose p_1=(s compose g) compose p_2$, then the universal property of $PP^n_S$ generates a unique morphism $psi:W -> PP^n_S$, such that $p_1 = s' compose psi$, and $g compose p_2 = pi compose psi$, as follow:
  #set align(center)
  #diagram($
            W edge("ddr",->, script(p_2), #right, bend: #(-20deg)) edge("drrr",->, script(p_1), bend: #40deg) edge("drr","..>", script(exists ! psi), bend: #20deg)\
             &Y times_S PP^n_S edge("d",->, script(pi')) edge(->, script(g')) & PP^n_S edge(->, script(s')) edge("d",->, script(pi), #left) & PP^n_ZZ edge("d",->, script(phi), #left)\
             &Y edge(->, script(g), #right) & S edge(->, script(s), #right) & Spec(ZZ)
           $)
  #set align(left)
  Then, with the universal property of $Y times_S PP^n_S$, the second equality $g compose p_2 = pi compose psi$ guarantees a unique morphism $rho:W -> Y times_S PP^n_S$, such that $psi = g' compose rho$, and $p_2=pi' compose rho$, as follow:
  #set align(center)
  #diagram($
            W edge("ddr",->, script(p_2), #right, bend: #(-20deg)) edge("drrr",->, script(p_1), bend: #40deg) edge("drr","..>", script(exists ! psi), bend: #20deg) edge("dr", "..>", script(exists ! rho))\
             &Y times_S PP^n_S edge("d",->, script(pi')) edge(->, script(g')) & PP^n_S edge(->, script(s')) edge("d",->, script(pi), #left) & PP^n_ZZ edge("d",->, script(phi), #left)\
             &Y edge(->, script(g), #right) & S edge(->, script(s), #right) & Spec(ZZ)
           $)
  #set align(left)
  Again, this proves both the existence and the uniqueness of the morphis $rho:W -> Y times_S PP^n_S$, such that $p_1 = s' compose psi = (s' compose g') compose rho$, and $p_2 = pi' compose rho$. Hence, $Y times_S PP^n_S$ satisfies the universal property of $PP^n_Y := Y times_Spec(ZZ) PP^n_ZZ$, showing $Y times_S PP^n_S tilde.equiv PP^n_Y$.

  \ 

  Now, we'll prove that base change preserves projective morphisms, again by the universality argument: Given a projective morphism $f:X->S$, and another morphism $g:Y->S$, we know there exists a suitable $n in NN$, such that there exists a closed immersion $iota:X arrow.hook PP^n_S$ and the projection $pi:PP^n_S -> S$, such that $f = pi compose iota$. 

  Which, based on the previous argument, we'll simply denote $Y times_S PP^n_S$ as $PP^n_Y$. Together with the previous diagrams, we have the following:
  #set align(center)
  #diagram($
             X times_(PP^n_S) PP^n_Y edge("d","hook->",script(iota')) edge(->, script(g'')) & X edge("d","hook->", script(iota), #left)\
             PP^n_Y edge("d",->, script(pi'), #right) edge(->, script(g')) & PP^n_S edge(->, script(s')) edge("d",->, script(pi), #left) & PP^n_ZZ edge("d",->, script(phi))\
             Y edge(->, script(g), #right) & S edge(->, script(s), #right) & Spec(ZZ)
           $)
  #set align(left)
  Which, we took the fibre product $X times_(PP^n_S) PP^n_Y$, and the morphism $iota':X times_(PP^n_S) PP^n_Y arrow.hook PP^n_Y$ is the pullback of the closed immersion $iota:X arrow.hook PP^n_S$, hence $iota'$ is also a closed immersion.
  
  Now, we claim that it satisfies the universal property of $X times_S Y$: In general, the above proof of preserving projective spaces shows that successive fibre product preserves fibre product in the full generality. By modifying the labels / objects a bit, we indeed get a proof that $X times_(PP^n_S) PP^n_Y$ satisfies the universal property of $X times_S Y$ as fibre product, hence $X times_(PP^n_S) PP^n_Y tilde.equiv X times_S Y$.

  \ 

  Finally, by denoting $X times_(PP^n_S) PP^n_Y$ as $X times_S Y$, the above diagram reduces to the following fibre product diagram:
  #set align(center)
  #diagram($
             X times_S Y edge(->, script(g'')) edge("d","hook->", script(iota')) & X edge("d",->, script(iota), #left) edge("dd",->, script(f), #left, bend:#40deg)\ 
             PP^n_Y edge("d",->, script(pi'), #right)  & PP^n_S edge("d",->, script(pi), #left)\ 
             Y edge(->, script(g), #right) & S
           $) 
  #set align(left)
  Which, the pullback of $f$ is $pi' compose iota':X times_S Y-> Y$, which is precisely a closed immersion into $PP^n_Y$, then a projection onto $Y$. This shows that the pullback of $f$ is still projective, hence projective morphisms are preserved under base change.

  \ 

  \ 

  #text(weight: "bold")[Proof of (b):]

]

#pagebreak()

= D//3

#problem[
  Let $f:X->Y$ be a morphism of separated scheme of finite type over a Noetherian scheme $S$. Let $Z subset X$ be a closed subscheme which is proper over $S$. Show that $f(Z)$ is closed in $Y$.

  \ 

  #line(length: 100%)

  \ 
][
  To show $f(Z) subset.eq Y$ is closed, we'll show that with the closed immersion $iota:Z arrow.hook X$, one has $f compose iota:Z->Y$ is proper, which will show $f compose iota(Z) = f(Z)$ is closed in $Y$.

  \ 

  First, let $phi_X:X->S$ and $phi_Y:Y->S$ be the morphism that define $X,Y$ as separated schemes of finite type over $S$, this implies both $phi_X, phi_Y$ are of finite type and separated morphisms. 

  Also, consider the closed immersion $iota:Z arrow.hook X$, since $Z$ is proper over $S$, we have this morphism $phi_X compose iota:Z->S$ be proper.

  \ 

  Now, since $f:X->Y$ is a morphism of schemes over $S$, we have the following commutative diagram:
  #set align(center)
  #diagram($
             Z edge("dr","hook->", script(iota), #right)\
             &X edge("dr",->, script(phi_X), #right) edge("rr",->, script(f)) && Y edge("dl", ->, script(phi_Y), #left)\
             && S
           $)
  #set align(left)
  Or, $phi_X = phi_Y compose f$, which implies $phi_X compose iota = phi_Y compose (f compose iota)$. Since $phi_X compose iota$ is proper, with $phi_Y$ being separated, we have $f compose iota$ being proper also (which is a closed map). With $Z$ being closed in itself, $f compose iota(Z) = f(Z) subset.eq Y$ is closed. This finishes our proof.
]

#pagebreak()

= ND (Type some ideal up, fxxk you localization)//4
#problem[
  Let $k$ be a field and let $R=k[X,Y,Z]\/I$, where $I=(X-Y Z,X Z-Y^2)$. Let $W=Spec(R)$.
  + Is $W$ a reduced scheme? Justify your answer.
  + Is $W$ irreducible? If not, what are its irreducible components?
  + Prove or disprove that $W$ has infinitely many rational points if $k$ is infinite (recall that a point $x in W$ is called rational point if the canonical map $k->k(x)$ is an isomorphism, where $k(x)$ is the residue field of the local ring $cal(O)_(X,x)$).

  \ 

  #line(length: 100%)

  \ 
][
  + This is kind of fucked (look at localization at $(X,Y)$, I believe this causes $Y$ to be zero divisor, as we have $X=Y Z = Y^2/Z$, so $Y^2 = Y Z^2$, or $Y(Y-Z^2)=0$).

  + Also kind of fucked (classically the solutions are $(X,Y,Z)=(t^3,t^2,t)$, corresponding to ideal $(X-Z^3, Y-Z^2)$ prime, refer to 237A HW about twisted cubics; the other one is $(X,Y,Z)=(0,0,t)$, corresponding to ideal $(X,Y)$ also prime). Hence, a natural guess here is $V((X-Z^3, Y-Z^2))$ and $V((X,Y))$ should cover up the space (while both irreducible components). Here, I guess we can use prime avoidance theorem / prime inclusion theorem in a suitable way.

  + If $k$ is infinite, then consider the stalks of $(x,y,z-t)$ for all $t in k$, and/or $(x-t^3,y-t^2,z-t)$, I believe these two do the job (in particular, because they're maximal ideals, which corresopnds to closed point in all ring). Here, I believe it uses the fact that localization preserves surjectivity, and the fact that they're local homomorphisms (so by taking infinite maximal ideals containing $I$, the quotient should form an isomorphism, bc. the residue field of a maximal ideal containing $I$ should be $k$).
]

#pagebreak()

= ND//5
#problem[
  Let $f:X->Y$ be a surjective morphism between two schemes which are finite type and separated integral schemes over a field. Assume that $X$ is an affine scheme. Prove or disprove that $Y$ is an affine scheme if and only if it is a quasi-affine scheme (recall that quasi-affine means open subscheme of an affine scheme).

  \ 

  #line(length: 100%)

  \ 
][
  It's clear that affine $==>$ quasi-affine (regardless of the situation). So, the converse is the actual nontrivial part to prove / disprove
]



