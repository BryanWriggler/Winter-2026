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

  Suppose that $Y$ is quasi-affine. Here, we'll denote the global section of $Y$ as $A := cal(O)_Y (Y)$, and let $B$ be a commutative ring satisfies $X tilde.equiv Spec(B)$ (which, $X,Y$ being integral schemes implies $A,B$ are integral domains). 

  \

  Let's first deal with a special case: Suppose $B$ is a field, then $X=Spec(B)$ is a one point scheme, hence with $f:X->>Y$ being surjective, $Y$ must be a one point scheme also. Take any affine neighborhood of the only point of $Y$, it must be $Y$ itself, showing that $Y = Spec(A')$ for some ring $A'$ (in particular, $A'=cal(O)_Y (Y)=A$). So, $Y$ is affine.

  From now one, we'll assume $B$ (the global section of $X$) is not a field.

  \ 
  
  Let $k$ be a field where $X,Y$ are finite type and separated integral schemes over it. Which, given $phi_X:X->Spec(k)$, $phi_Y:Y-> Spec(k)$ as the corresponding morphisms, $phi_X,phi_Y$ are finite type and separated morphisms that satisfy the following diagram:
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

  Where, $phi_X$ being of finite type implies that $B$ is a finitely generated integral $k$-algebra (since of finite type implies for any $V subset.eq Spec(k)$ affine open, and any $U subset.eq phi_X^(-1)(V)$ affine open, the induced homomorphism $cal(O)_(Spec(k))(V) -> cal(O)_X (U)$ is a finite type ring homomorphism; take $V=Spec(k)$ and $U = X=Spec(B)$, this implies $phi_X^\#:k-> B$ is finite type ring homomorphism). 

  Also, since $phi_X = phi_Y compose f$ is separated, one also has $f$ being separated.
  
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

  However, if consider $f^\# (frak(m))B$ as an ideal 
]