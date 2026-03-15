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

  Let's show $g$ is of finite type: Using the diagram in part (a), since $pi:Y'->Z$ is projective, it is proper (hence of finite type), so for any open affine subset $U subset.eq Z$ (say $U tilde.equiv Spec(A)$), such that $pi^(-1)(U) = union.big_(i=1)^n V_i$, where each $V_i$ is affine open subset, and $V_i tilde.equiv Spec(B_i)$ for some $B_i$ that's finitely generated $A$-algebra.

  Then, with open immersion $iota:Y arrow.hook Y'$, one has $iota^(-1)(pi^(-1)(V)) = Y sect f^(-1)(V) = union.big_(i=1)^n Y sect V_i$. Since $Y$ is open in $Y'$, each $Y sect V_i$ is an open subset of $V_i$ under its subspace topology, hence each $Y sect V_i = union.big_(j in J_i)D(f_(i j))$ for some $f_(i j) in B_i$ (running over some index set $J_i$). Because each $D(f_(i j)) tilde.equiv Spec((B_i)_(f_(i j)))$ (which $(B_i)_(f_(i j))$ is a finitely generated $B_i$-algebra), then with $B_i$ being a finitely generated $A$-algebra, $(B_i)_(f_(i j))$ is a finitely generated $A$-algebra also.

  As a result, one has $g^(-1)(U)=iota^(-1)(pi^(-1)(U)) = union.big_(i=1)^n Y sect B_i = union.big_(i=1)^n union.big_(j in J_i)D(f_(i j))$, where each $D(f_(i j)) tilde.equiv Spec((B_i)_(f_(i j)))$ has $(B_i)_(f_(i j))$ being a finitely generated $A$-algebra. 
  
  Finally, since $g compose f$ is finite type, it's quasi-compact, hence with affine open subset $U subset.eq Z$, one has $(g compose f)^(-1)(U) = f^(-1)(g^(-1)(U))$ being quasi-compact. However, since $f$ is surjective, one has $g^(-1)(U) = f(f^(-1)(g^(-1)(U)))$. Because it's an image of a quasi-compact set under continuous map, $g^(-1)(U)$ is quasi-compact. Hence, the previous cover for $g^(-1)(U)$, say $g^(-1)(U) = union.big_(i=1)^n union.big_(j in J_i)D(f_(i j))$, can be chosen as finite. This shows that $g$ is of finite type.

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

= D //2 (at this point I don't care if I can finish the segre embedding or not...)

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

  Let $rho:T->U$ and $phi:U->V$ be two projective morphisms, then there exists $n,m in NN$, such that there exists open immersion $iota_T: T arrow.hook PP^n_U$ and $iota_U:U arrow.hook PP^m_V$, together with projections $pi_(U,n):PP^n_U -> U$ and $pi_(V,m):PP^m_V -> V$, such that the following diagram commutes:
  #set align(center)
  #diagram($
             PP^n_U edge("dr",->, script(pi_(U,n))) & PP^m_V edge("dr",->, script(pi_(V,m)))\ 
             T edge(->, script(rho), #right) edge("u","hook->", script(iota_T), #left) & U edge(->, script(phi), #right) edge("u","hook->", script(iota_U), #right) & V
           $)
  #set align(left)
  Now, let's use some information from part (a): Recall that given any morphism $Y -> S$ and the projection $PP^n_S -> S$, the fibre product $Y times_S PP^n_S tilde.equiv PP^n_Y$ (and it's true for arbitrary $Y,S$ and $n in NN$, as the proof is universal); then, from the above diagram, consider $phi:U->V$ as the composition $U xarrow(iota_U) PP^m_V xarrow(pi_(V,m))V$, and consider the projection $pi_(V,n):PP^n_V -> V$. Notice by the previous statementment, we can construct the projective space $PP^n_(PP^m_V) tilde.equiv PP^m_V times_V PP^n_V$, as follow:
  #set align(center)
  #diagram($
             & PP^n_(PP^m_V) edge(->, script((pi_(V,m))')) edge("d",script((pi_(V,n))')) & PP^n_V edge("d",->, script(pi_(V,n)), #left)\
             U edge("hook->", script(iota_U), #right) & PP^m_V edge(->, script(pi_(V,m)),#right) & V
           $)
  #set align(left)
  Which, the same argument shows that $PP^n_U tilde.equiv U times_(PP^m_V) PP^n_(PP^m_V)$, as follow:
  #set align(center)
  #diagram($
             PP^n_U edge("hook->", script((iota_U)')) edge("d",->, script(pi_(U,n))) & PP^n_(PP^m_V) edge(->, script((pi_(V,m))')) edge("d",->, script((pi_(V,n))')) & PP^n_V edge("d",->, script(pi_(V,n)), #left)\
             U edge("hook->", script(iota_U), #right) & PP^m_V edge(->, script(pi_(V,m)),#right) & V
           $)
  #set align(left)
  Which, notice that $(iota_U)':PP^n_U arrow.hook PP^n_(PP^m_V)$ is a base change of the closed immerrsion $iota_U:U arrow.hook PP^m_V$, hence is still a closed immersion; composing with the closed immersion $iota_T: T arrow.hook PP^n_U$, we get a closed immesion $(iota_U)' compose iota_T:T arrow.hook PP^n_(PP^m_V) tilde.equiv PP^m_V times_V PP^n_V$, and with the projections $pi_(V,n) compose (pi_(V,m))':PP^n_(PP^m_V) -> V$, they compose to be the original morphism $T xarrow(rho) U xarrow(phi) V$.

  \ 

  Hence, to prove the composition $phi compose rho:T->V$ is projective, it suffices to show that $PP^n_(PP^m_V) tilde.equiv PP^m_V times_V PP^n_V$ embedds into some $PP^N_V$, and the projection backs to $VV$ recovers $phi compose rho$.

  Let's first show that there exists a morphism $p:PP^m_V times_V PP^n_V -> PP^m_ZZ times_(Spec(ZZ))PP^n_ZZ$. Consider the following diagram:
  #set align(center)
  #diagram($
             PP^m_V times_V PP^n_V edge("d",->, script((pi_(V,n))'), #right) edge(->, script((pi_(V,m))')) & PP^n_V edge("d",->, script(pi_(V,n)), #left) edge(->) & PP^n_ZZ edge("dd",->)\
             PP^m_V edge("d",->) edge(->, script(pi_(V,m)), #right) & V edge("dr",->)\
             PP^m_ZZ edge("rr",->) && Spec(ZZ)
           $)
  #set align(left)
  Which, with each "square" (two are deformed a bit) being fibre squares, the above diagram commutes. Hence, by the universal property of $PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ$ guarantees a unique morphism $P:PP^m_V times_V PP^n_V -> PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ$.

  Now, assume we know the existence of Segre Embedding for projective spaces of $ZZ$ (suggested in Hartshorne), say $s: PP^m_ZZ times_(Spec(ZZ))PP^n_ZZ arrow.hook PP^(n m+n+m)_(ZZ)$, the with $N:= n m+n+m$ consider the following commutative diagram:
  #set align(center)
  #diagram($
             PP^m_V times_V PP^n_V edge("d", "..>", script(exists ! s')) edge("dd",->, script(pi_(V,n) compose (pi_(V,m))'), bend: #(-60deg)) edge(->, script(p)) & PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ edge("d","hook->", script(s), #left)\
             PP^(N)_V edge("d",->,script(pi_(V,N))) edge(->) & PP^(N)_ZZ edge("d",->)\
             V edge(->) & Spec(ZZ)
           $)
  #set align(left)
  Then, the universality of $PP^(N)_V = V times_(Spec(ZZ)) PP^(N)_(ZZ)$ guarantees a unique morphism $s':PP^m_V times_V PP^n_V -> PP^(N)_V$. Finally, we claim that $s'$ is a closed immersion:

  Notice in the abov diagram, the tall rectangle involving $PP^m_V times_V PP^n_V, PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ, V, Spec(ZZ)$ forms a fibre square by diagram chase. 
  
  Then, this in fact enforces $PP^m_V times_V PP^n_V tilde.equiv PP^(N)_V times_(PP^(N)_ZZ) (PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ)$: Indeed, given any scheme $W$ together with two morphisms $w_1:W->PP^N_V$ and $w_2:W -> PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ$, such that the following holds:
  #set align(center)
  #diagram($
              W edge("ddr",->, script(w_1), bend: #(-20deg)) edge("rrd", ->, script(w_2), bend:#20deg) edge("dr", "..>", script(exists ! w))\
             &PP^m_V times_V PP^n_V edge("d", "..>", script(exists ! s')) edge(->, script(p)) & PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ edge("d","hook->", script(s), #left)\
             &PP^(N)_V edge("d",->,script(pi_(V,N))) edge(->) & PP^(N)_ZZ edge("d",->)\
             &V edge(->) & Spec(ZZ)
           $)
  #set align(left)
  Which, the existence and uniqueness of $w:W-> PP^m_V times_V PP^n_V$ is guaranteed by the tall fibre rectangle, showing the top square is a fibre square. Since this characterizes $PP^m_V times_V PP^n_V$ as the fibre product $PP^N_V times_(PP^N_ZZ) (PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ)$, then $s':PP^m_V times_V PP^n_V-> PP^N_V$ is a base change of $s:PP^m_ZZ times_(Spec(ZZ)) PP^n_ZZ arrow.hook PP^N_ZZ$ (by the morphism $PP^N_V -> PP^N_ZZ$), showing $s'$ is a closed immersion (since $s$ is).

  \ 

  Finally, we get this massive commutative diagram:
  #set align(center)
    #diagram($
               T edge("d",->, script(rho), #right) edge("hook->", script(iota_T)) & PP^n_U edge("dl",->, script(pi_(U,n))) edge("hook->", script((iota_U)')) & PP^n_(PP^m_V) tilde.equiv PP^m_V times_V PP^n_V edge("dl", ->, script((pi_(V,n))'), #left) edge("hook->", script(s')) & PP^N_V edge("ddlll",->, script(pi_(V,N)), bend: #20deg)\ 
               U edge("d",->, script(phi), #right) edge("hook->", script(iota_U)) & PP^m_V edge("dl",->, script(pi_(V,m)), #left)\ 
               V
             $)
  #set align(left)
  Which, $iota_T, (iota_U)', s'$ are all constructed as closed immersions, hence the composition $T arrow.hook PP^N_V$ is also a closed immersion. This realizes $phi compose rho:T -> V$ as a projective morphism, hence composition of projective morphisms are still projective.

  \ 

  \ 

  Finally, back to the original problem, given $f:X->S$ and $g:Y->S$ two projective morphisms, (a) guarantees their pullbacks to be projective morphisms also. So, $f':X times_S Y -> Y$ and $g':X times_S Y-> X$ are projective morphisms, satisfying the following fibre square:
  #set align(center)
  #diagram($
             X times_S Y edge("d", ->, script(g'), #right) edge(->, script(f')) & Y edge("d",->, script(g), #left)\
             X edge(->, script(f), #right) & S
           $)
  #set align(left)
  Then, (b) guarantees the composition of projective morphisms to be projective, hence $f compose g' = g compose f':X times_S Y -> S$ is projective, finishing our statement.

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

= ND ((a) remaining)//4
#problem[
  Let $k$ be a field and let $R=k[X,Y,Z]\/I$, where $I=(X-Y Z,X Z-Y^2)$. Let $W=Spec(R)$.
  + Is $W$ a reduced scheme? Justify your answer.
  + Is $W$ irreducible? If not, what are its irreducible components?
  + Prove or disprove that $W$ has infinitely many rational points if $k$ is infinite (recall that a point $x in W$ is called rational point if the canonical map $k->k(x)$ is an isomorphism, where $k(x)$ is the residue field of the local ring $cal(O)_(W,x)$).

  \ 

  #line(length: 100%)

  \ 
][
  /*+ This is kind of fucked (look at localization at $(X,Y)$, I believe this causes $Y$ to be zero divisor, as we have $X=Y Z = Y^2/Z$, so $Y^2 = Y Z^2$, or $Y(Y-Z^2)=0$).

  + Also kind of fucked (classically the solutions are $(X,Y,Z)=(t^3,t^2,t)$, corresponding to ideal $(X-Z^3, Y-Z^2)$ prime, refer to 237A HW about twisted cubics; the other one is $(X,Y,Z)=(0,0,t)$, corresponding to ideal $(X,Y)$ also prime). Hence, a natural guess here is $V((X-Z^3, Y-Z^2))$ and $V((X,Y))$ should cover up the space (while both irreducible components). Here, I guess we can use prime avoidance theorem / prime inclusion theorem in a suitable way.

  + If $k$ is infinite, then consider the stalks of $(x,y,z-t)$ for all $t in k$, and/or $(x-t^3,y-t^2,z-t)$, I believe these two do the job (in particular, because they're maximal ideals, which corresopnds to closed point in all ring). Here, I believe it uses the fact that localization preserves surjectivity, and the fact that they're local homomorphisms (so by taking infinite maximal ideals containing $I$, the quotient should form an isomorphism, bc. the residue field of a maximal ideal containing $I$ should be $k$).*/
  For the sake of working through all subproblems, we'll first do some calculations regarding two ideals of $k[X,Y,Z]$, defined by $P=(X,Y)$ and $Q = (X-Z^3, Y-Z^2)$. In particular, we claim that they're prime ideals that contains $I$:
  - For $P=(X,Y)$, it's clear that $k[X,Y,Z]\/PP tilde.equiv k[Z]$, hence it's prime; one the other hand, one has $X,Y in P$ implies $Y Z, X Z, Y^2 in P$, hence $X-Y Z, X Z-Y^2 in P$, showing $I subset.eq P$.

  \ 

  - For $Q$, we'll show that $k[X,Y,Z]\/Q tilde.equiv k[T]$ also: Consider the ring homomorphism $phi:k[X,Y,Z]-> k[T]$ by $phi(f(X,Y,Z)) = f(T^3,T^2,T)$. Which, this morphism is surjective, as any polynomial $f(T) in k[T]$ also appears in $k[X,Y,Z]$ (say denotes as $f(Z)$), then $phi(f(Z))= f(T)$. This shows that $k[X,Y,Z]\/ker(phi) tilde.equiv k[T]$.

    Now, we show that $Q = ker(phi)$: For the generators of $Q$, we have $phi(X-Z^3) = T^3-(T)^3 = 0$, and $phi(Y-Z^2) = T^2 - (T)^2 = 0$, hence $Q subset.eq ker(phi)$ (as its generators are contained in ther kernel).

    \  
    
    For the converse, we claim that all polynomials can be expressed in the form $f dot (X-Z^3)+g dot (Y-Z^2)+h(Z)$ for some $f,g in k[X,Y,Z]$, and $h(Z) in k[Z]$: Given any monomial $X^n Y^m Z^p$, we can rewrite it as the following:
    $ X^n Y^m Z^p &= ((X-Z^3)+Z^3)^n ((Y-Z^2)+Z^2)^m Z^p\ 
    &= (sum_(k=0)^n mat(n;k)(X-Z^3)^k (Z^3)^(n-k))(sum_(l=0)^m mat(m;l)(Y-Z^2)^l (Z^2)^(m-l))Z^p\ 
    &= (Z^(3n)+sum_(k=1)^n mat(n;k)(X-Z^3)^k (Z^3)^(n-k))(Z^(2m)+sum_(l=1)^m (Y-Z^2)^l (Z^2)^(m-l))Z^p $
    Which, define $f:= sum_(k=1)^n mat(n;k)(X-Z^3)^(k-1)(Z^3)^(n-k)$, and $g:= sum_(l=1)^m (Y-Z^2)^(l-1)(Z^2)^(m-l)$, the above can be rewritten as follow:
    $ X^n Y^m Z^p &= (Z^(3n)+f dot (X-Z^3))(Z^(2m)+g dot (Y-Z^2))Z^p\ 
    &= (f g (Y-Z^2)Z^p) dot (X-Z^3) + (g Z^(3n+p)) dot (Y-Z^2) + Z^(3n+2m+p) $
    This shows that each monomial can be written as some $f dot (X-Z^3)+g dot (Y-Z^2)+Z^q$. Hence, with all polynomials being finite $k$-linaer combinations of the monomials, they can all be written in the form of $f dot (X-Z^3)+g dot (Y-Z^2)+h(Z)$ for $f,g in k[X,Y,Z]$ and $h(Z) in k[Z]$.

    As a consequence, for any polynomial $ell(X,Y,Z) in ker(phi)$, since there exists $f,g in k[X,Y,Z]$ and $h(Z) in k[Z]$, such that $ell(X,Y,Z)=f dot (X-Z^3)+g dot (Y-Z^2)+h(Z)$, then the evaluation by $phi$ gives the following:
    $ phi(ell(X,Y,Z)) = phi(f dot (X-Z^3))+phi(g dot (Y-Z^2))+phi(h(Z)) = h(T) = 0 $
    (Note: recall that $X-Z^3, Y-Z^2 in ker(phi)$ are verified). Hence, one must have $h(T)=0$, or $h(Z)=0$, showing that $ell(X,Y,Z)=f dot (X-Z^3)+g dot (Y-Z^2) in Q$. This proves that $ker(phi) subset.eq Q$, finishing the proof of $ker(phi)=Q$.

    \ 

    Then, since $k[X,Y,Z]\/Q tilde.equiv k[T]$ based on the homomorphism $phi$, then $Q$ is a prime ideal. 
    
    Finally, to say $I subset.eq Q$, use the algorithm proposed above, some calculation shows the following:
    - $ X-Y Z = X-((Y-Z^2)+Z^2)Z = (X-Z^3)+Z(Y-Z^2) in Q $
    - $ X Z-Y^2 &= X Z-((Y-Z^2)+Z^2)^2 \
    &= X Z - ((Y-Z^2)^2+2Z^2 (Y-Z^2)+Z^4)\ 
    &= X Z - Z^4 - ((Y-Z^2)+2Z^2)(Y-Z^2) \
    &= Z(X-Z^3)+(Y+Z^2)(Y-Z^2) in Q $
    Hence, the generators of $I$ are in $Q$, showing $I subset.eq Q$.

  \ 

  \ 

  \ 

  Now, since $W=Spec(R) tilde.equiv V(I)$ as closed subschemes of $Spec(k[X,Y,Z])$, we'll work in this regime. 
  #text(weight: "bold")[Here are the solutions to the subproblems:] 

  \ 

  \

  + #text(weight: "bold")[Not done yet.]

    \ 

    \ 

  + /*Consider the element $Z(X-Y Z)-(X Z-Y^2) = Y^2-Y Z^2 = Y(Y-Z^2)$. For any prime containing it, it must contain either $Y$ or $(Y-Z^2)$:
    - If containing $Y$, it contains $Y Z$, hence if containing $I$ also, it contains $(X-Y Z)+Y Z = X$, so $(X,Y)$ is contained in it.
    - Else if containing $Y-Z^2$, then it contains $X-Y Z + Z(Y-Z^2) = X-Z^3$, containig $(X-Z^3, Y-Z^2)$.*/We show that $W$ is reducible, in particular that $W=V(I) = V(P) union V(Q)$, where $V(P), V(Q)$ are its irreducible components.

    \ 

    First, since $I subset.eq P$ and $I subset.eq Q$, it's clear that $V(P),V(Q) subset.eq V(I)$, hence $V(P) union V(Q) subset.eq V(I)$; to claim the reverse inclusion, we'll consider the following element: 
    $ Z(X-Y Z)-(X Z-Y^2) = X Z-Y Z^2-X Z+Y^2 = Y(Y-Z^2) in I $
    Suppose $K in V(I)$ is a prime ideal containing $I$, then $Y(Y-Z^2) in K$, which the prime property guarantees $Y in K$ or $(Y-Z^2) in K$.
      - If $Y in K$, then since $X-Y Z in I subset.eq K$, one has $X = (X-Y Z)+Y Z in K$, showing $P = (X,Y) subset.eq K$, or $K in V(P)$.
      - Else if $Y-Z^2 in K$, then since $X-Y Z in I subset.eq K$ again, one has $X-Z^3 = (X-Y Z)+(Y Z - Z^3) = (X-Y Z)+Z(Y-Z^2) in K$, showing $Q=(X-Z^3,Y-Z^2) subset.eq K$, or $K in V(Q)$.
    Hence, in either case $K in V(P) union V(Q)$, showing $W=V(I)=V(P) union V(Q)$.

    \ 

    To show that $W$ is reducible, we'll show that $V(P), V(Q)$ are proper closed subsets of $W$: Suppose the contrary that one of them is not proper closed subset of $W$, there are two cases:
      - If $V(P)=W$, this shows that $V(Q) subset.eq V(P)$; with $P,Q$ being prime (which both are radicals), this shows that $Q supset.eq P$. However, if consider the ring homomorphism $psi:k[X,Y,Z]->>k$ by $psi(X,Y,Z) = psi(1,1,1)$, notice that $psi(X-Z^3)=1-1^3 = 0$ and $psi(Y-Z^2)=1-1^2=0$, showing $Q=(X-Z^3,Y-Z^2) subset.eq ker(psi)$; yet, if plugin the generators of $P$, we get $psi(X) = psi(Y)=1!=0$, showing $P subset.eq.not ker(psi)$, which contradicts our construction that $ker(phi) supset.eq Q supset.eq P$.
      - Else if $V(Q)=W$, this shows that $V(P) subset.eq V(Q)$, which implies $P supset.eq Q$. Howeve, consider the ring homomorphism $rho:k[X,Y,Z]->>k$ by $rho(f(X,Y,Z))=f(0,0,1)$, notice that $rho(X)=rho(Y)=0$, showing $P = (X,Y) subset.eq ker(rho)$; yet, if plugin the generators of $Q$, we get $rho(X-Z^3)=0-1^3=-1!=0$, showing $Q subset.eq.not ker(rho)$, again this contradicts our construction that $ker(rho) supset.eq P supset.eq Q$.

      Since in either case we get a contradiction, then $V(P),V(Q)$ cannot be the whole $W$, showing they're proper closed subsets, which proves that $W=V(P) union V(Q)$ is reducible.

      \ 

    Finally, to show $V(P),V(Q)$ are its irreducible components, consider any other irreducible subsets $W' subset.eq W=V(I)$, since $W'$ is also closed in $Spec(k[X,Y,Z])$ (by the closeness of $V(I)$ in it), then $W' = V(K)$ for some ideal $K subset.eq k[X,Y,Z]$. Which, the irreducibility of $W'$ guarantees $K$ to be a prime ideal. However, if $V(K) subset.eq V(I)$, one has $I subset.eq sqrt(I) subset.eq K$ (by primeness, it is a radical), showing that $K in V(I) = V(P) union V(Q)$. This implies that either $K in V(P)$ ($P subset.eq K$, or $V(P) supset.eq V(K)$), or $K in V(Q)$ ($Q subset.eq K$, or $V(Q) supset.eq V(K)$), showing that $W' = V(K)$ is contained in $V(P)$ or $V(Q)$. Hence, these two must be the irreducible components of $W$.

    \ 

    \ 

  + /*Consider the infinite family $(X,Y,Z-t)$ or $(X-t^3,Y-t^2,Z-t)$ for all $t in k$, claim that the residue field of these must be $k$ (because of their maximality, and some suitable quotient argument).*/ With $k$ being infinite, we'll show that there are infinitely rational points in $W$. For any $t in k$, consider the maximal ideal $frak(m)_t:=(X,Y, Z-t) subset k[X,Y,Z]$. Notice that it contains $I$, since $X-Y Z, X Z-Y^2 in frak(m)_t$ by the fact that $X,Y in frak(m)_t$. Hence, $x:= frak(m)_t$ can be realized as a maximal ideal in $R = k[X,Y,Z]\/I$ by descending to the quotient, which is realized as a closed point in $W=Spec(R)$.

    To compute its residue field, let $overline(frak(m))_t subset.eq R$ denotes the quotient of $frak(m)_t$. Then, its corresponding residue field is as follow:
    $ k(overline(frak(m))_t) = (R_(overline(frak(m))_t))/(overline(frak(m))_t R_(overline(frak(m))_t)) tilde.equiv (R/(overline(frak(m))_t))_(overline(frak(m))_t) tilde.equiv k $
    Note thaat since $I subset.eq frak(m)_t$, then the composition of projections $phi:k[X,Y,Z]->> R ->> R\/overline(frak(m))_t$ has the kernel being precisly $phi^(-1)(overline(frak(m))_t)= frak(m)_t$, hence $k tilde.equiv k[X,Y,Z]\/frak(m)_t tilde.equiv R\/overline(frak(m))_t$ (where, the first isomorphism can be realized by the evaluation $e:k[X,Y,Z]->> k$ by $e(f(X,Y,Z))=f(0,0,t)$, where the kernel is precisely $frak(m)_t=(X,Y,Z-t)$).

    Hence, with $k$ being infinite, there are infinitely many $t in k$, with $overline(frak(m))_t subset.eq R$ being a maximal ideal (or a closed point in $W=Spec(R)$), such that the residue field is isomorphic to $k$. Hence, $W$ has infinitely many rational points.
]

#pagebreak()

= ND (finish the open subscheme part)//5
#problem[
  Let $f:X->Y$ be a surjective morphism between two schemes which are finite type and separated integral schemes over a field. Assume that $X$ is an affine scheme. Prove or disprove that $Y$ is an affine scheme if and only if it is a quasi-affine scheme (recall that quasi-affine means open subscheme of an affine scheme).

  \ 

  #line(length: 100%)

  \ 
][
  /*It's clear that affine $==>$ quasi-affine (regardless of the situation). So, the converse is the actual nontrivial part to prove / disprove

  \ 

  My intuition tells me this should be a proof: Let $A=cal(O)_Y (Y)$, and $X = Spec(B)$. The condition states that $A,B$ are finitely generated integral $k$-algebra (over some field $k$), together with a $k$-algebra homomorphism $f^\#:A -> B$.

  Assume we now know that there is an open immersion $Y arrow.hook Spec(A)$, since $Spec(A)$ is Noetherian integral (the ring is Noetherian + integral), then $Y$ in particular is irreducible, dense, and quasi-compact. Hence, the morphism $X=Spec(B)-> Spec(A)$ is dense (since the image is $Y subset.eq Spec(A)$ dense), then the generated homomorphism $f^\#:A arrow.hook B$ is injective.

  Finally, choose some closed point in $Spec(A)\\Y$ (suppose that $Y$ is not the whole $Spec(A)$), then the closed point should correspond to a maximal ideal in $A$, which its image and contraction should return the maximal ideal itself, which is a contradiction (since then the closed point / maximal ideal should belong to the image, while it should not).*/
  We'll prove that $Y$ is affine $<==>$ $Y$ is quasi-affine.

  \ 

  $==>:$

  Suppose $Y$ is affine, then it's an open subscheme of $Y$ (an affine scheme), hence $Y$ is quasi-affine.

  \ 

  \ 

  $<==:$

  Suppose that $Y$ is quasi-affine. Here, we'll denote the global section of $Y$ as $A := cal(O)_Y (Y)$, and let $B$ be a commutative ring satisfies $X tilde.equiv Spec(B)$ (which, $X,Y$ being integral schemes implies $A,B$ are integral domains). Let $k$ be a field where $X,Y$ are finite type and separated integral schemes over it. Which, given $phi_X:X->Spec(k)$, $phi_Y:Y-> Spec(k)$ as the corresponding morphisms, $phi_X,phi_Y$ are finite type and separated morphisms that satisfy the following diagram:
  #set align(center)
  #diagram($
             X = Spec(B) edge("dr",->, script(phi_X), #right) edge("rr",->>, script(f)) && Y edge("dl",->, script(phi_Y), #left)\
             & Spec(k)
           $)
  #set align(left)
  Then, on the global section level, this reverses to the following diagram of ring homomorphisms:
  #set align(center)
  #diagram($
             B && cal(O)_Y (Y) = A edge("ll",->, script(f^\#))\
             & k edge("ul", "hook->", script(phi_X ^\#), #left) edge("ur", "hook->", script(phi_Y ^\#), #right)
           $)
  #set align(left)

  \ 

  Now, we claim the following statements in order:
  + $Y$ can be realized as open subschemes of $Spec(A)$.
  + $Y$ is affine, in particular $Y tilde.equiv Spec(A)$.
  Then, we'll use these to patch up more results.

  \ 

  \ 

  #text(weight: "bold")[Proof of (a):]

  Since $Y$ is assumed to be quasi-affine, there exists an open immersion $iota_Y:Y arrow.hook Spec(R)$ for some commutative ring $R$. Then, since the affinization of $Y$, say $"Aff"_Y = Spec(A)$, with the natural morphism of schemes $i_Y:Y -> "Aff"_Y$, there exists a unique morphism of schemes $psi_Y: "Aff"_Y -> Spec(R)$, such that the following commutative diagram holds:
  #set align(center)
  #diagram($
             Y edge("dr", "hook->", script(iota_Y), #right) edge("rr", ->, script(i_Y)) && "Aff"_Y edge("dl", "..>", script(exists ! psi_Y), #left)\ 
             & Spec(R)
           $)
  #set align(left)
  Which, since $iota_Y$ is injective (as set map), this enforces $i_Y$ to also be injective also. 

  \ 

  Now, consider the ring homomorphism $psi_Y^\#:R -> A$. For any $P in Y arrow.hook Spec(R)$, there exists some element $f in R$, such that $P in D(f) subset.eq Y$ (since $Y$ is open subscheme of $Spec(R)$). Then, denote $f' := phi_Y^\# (f) in A$. Using the Hartshorne Notation, we can consider the subset $Y_(f') subset.eq Y$ (denoting all points $y in Y$, such that the localization $f'_y in cal(O)_(Y,y)$ is invertible, or not in the maximal ideal $frak(m)_y subset.eq cal(O)_(Y,y)$). Notice that this set is precisely $Y_(f')=D(f)$: Given the ring homomorphism $phi_Y^\#:R-> A$ that sends $phi_y^\# (f)=f'$, then compose with the localization, ...
  
  as a result, one has $R_f tilde.equiv cal(O)_(Spec(R)) (D(f)) = cal(O)_Y (D(f))=cal(O)_Y (Y_(f')) = cal(O)_Y (D(f')) tilde.equiv A_(f')$, showing that $P in D(f) subset.eq Y$ has an affine neighorhood $D(f) tilde.equiv D(f') tilde.equiv Spec(A_(f'))$ in $Y$. 

  This shows that $i_Y: Y arrow.hook Spec(A)$ is actually an open immersion (as any point in $Y$ has an open neighborhood in $Y$, such that it's scheme-isomorphic to a fundamental open subset of $Spec(A)$). So, $Y$ is an open subscheme of $Spec(A)$.

  \ 

  \ 

  #text(weight: "bold")[Proof of (b):]

  Now, together with the open immersion $i_Y: Y arrow.hook Spec(A)$, the morphism $phi_Y:Y-> Spec(k)$ uniquely factors through some morphism $rho:Spec(A) -> Spec(k)$ (since $Spec(A) = "Aff"_Y$ the affinization), which we have the following commutative diagram of morphisms:
  #set align(center)
  #diagram($
             X edge("dr",->, script(phi_X), #right) edge(->>, script(f)) & Y edge("d",->, script(phi_Y)) edge("hook->", script(i_Y)) & Spec(A) edge("dl", "..>", script(exists ! rho), #left)\ 
             & Spec(k)
           $)
  #set align(left)
  Which, on the level of global section, we have the following commutative diagram:
  #set align(center)
  #diagram($
             B & A edge("l",->, script(f^\#)) & A edge("l", "hook->>", script(id_A))\ 
             & k edge("ul","hook->", script(phi_X^\#), #left) edge("u","hook->", script(phi_Y^\#)) edge("ur","hook->", script(rho^\#), #right)
           $)
  #set align(left)
  Where the middle $A$ is given by the global section of $Y$, $A=cal(O)_Y (Y)$. 

  Then, this implies that the morphism $i_Y compose f:X=Spec(B) -> Spec(A)$ is induced by the ring homomorphism $f^\# compose id_A = f^\#:A-> B$; and, for the diagram to commute, $f^\#$ is in fact a $k$-algebra homomorphism. 
  
  Now, notice that $i_Y compose f$ is a dominant morphism: Because $A$ is an integral domain, then $Spec(A)$ is irreducible, hence $Y subset.eq Spec(A)$ as a open subscheme is dense and irreducible (or $overline(Y) = Spec(A)$). With $f$ being surjective, one has $f(X)=Y$, hence $overline(i_Y compose f(X)) = overline(i_Y (Y)) = overline(Y) = Spec(A)$.

  \ 

  Finally, we claim that $Y = Spec(A)$: Suppose not, then since $Spec(A)\\Y$ is closed nonempty subset (by openness of $Y$), there exists ideal $I subset.eq A$, such that $V(I) = Spec(A)\\Y$ (and $I$ must be proper for $V(I)$ to be nonempty). Now, choose a maximal ideal $frak(m) subset.eq A$ such that $I subset.eq frak(m)$, then $frak(m) in V(I)$ is a point not containing in the image of $i_Y compose f$ by our choice.

  However, if consider $f^\# (frak(m))B$ as an idea
]



