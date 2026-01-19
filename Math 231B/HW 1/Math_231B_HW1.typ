#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.8" as fletcher: *

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
  title: "Math 231B HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= D//1
#problem[
  Etingof Problem Set 7.1:

  Let $R subset RR^n$ be given by 
  $ R={pm e_i, pm 2e_i | 1<=i<=n} union {pm e_i pm e_j | 1<=i,j<=n, i!=j} $
  where $e_i$ is the standard basis in $RR^n$. Show that $R$ is a non-reduced root system.
][
  First, it's clear that $R$ spans the whole space, since all the standard basis elements are contained in $R$.

  \ 

  Now, given any $alpha, beta in R$ (WLOG, say they're positive components in $R$ by factoring out the $-1$, wo we'll test it for the $e_i$'s, $2 e_i$'s, and $e_i pm e_j$'s), we want to show the property $(2(alpha,beta))/((alpha,alpha)) in ZZ$. Here are some cases:
  \ 
  - If both are $e_i, e_j$, one has $(2(e_j,e_i))/((e_i,e_i)) = 2 delta_(i j) in ZZ$.
  \ 
  - If one is $e_i$ while the other is $2e_j$, one has $(2(e_i, 2e_j))/((e_i,e_i)) = 4 delta_(i j) in ZZ$; for the other order, one also has $(2(2e_j, e_i))/((2e_j,2e_j)) = (4 delta_(i j))/4 = delta_(i j) in ZZ$.
  \ 
  - If one is $e_i$ and the other is $e_j pm e_k$, one has $(2(e_i, e_j pm e_k))/((e_i,e_i)) = 2(delta_(i j) pm delta_(i k)) in ZZ$; for the other order, one also has $(2(e_j pm e_k, e_i))/((e_j pm e_k, e_j pm e_k)) = (2(delta_(i j) pm delta_(i k))/2) = delta_(i j)pm delta_(i k) in ZZ$.
  \ 
  - If both are $2e_i, 2e_j$, one has $(2(2e_i,2e_j))/((2e_i,2e_i)) = (8 delta_(i j))/4 = 2 delta_(i j) in ZZ$.
  \ 
  - If one is $2e_i$ while the other is $e_j pm e_k$, one has $(2(2e_i, e_j pm e_k))/((2e_i,2e_i)) = (4(delta_(i j)pm delta_(i k)))/4 = delta_(i j) pm delta_(i k) in ZZ$; for the other order, one also has $(2(e_j pm e_k, 2e_i))/((e_j pm e_k, e_j pm e_k)) = (4(delta_(i j) pm delta_(i k)))/2 = 2(delta_(i j) pm delta_(i k)) in ZZ$.
  \ 
  - Finally, if both are $e_i pm_(i j) e_j$, $e_k pm_(k l) e_l$, one has $(2(e_i pm_(i j) e_j,e_k pm_(k l)e_l))/((e_i pm e_j, e_i pm e_j)) = (2(delta_(i k) pm_(i j)delta_(j k) pm_(k l)delta_(i l) + (pm_(i j)1)(pm_(k l)1)delta_(j l)))/2 = (delta_(i k) pm_(i j)delta_(j k) pm_(k l)delta_(i l) + (pm_(i j)1)(pm_(k l)1)delta_(j l)) in ZZ$.

  \ 

  Then, the last condition is regarding the reflections (which the coefficients will be coming from the above calculation):
  - Given $s_(e_i)(e_j) = e_j - 2 delta_(i j)e_i$, if $i!=j$ this is $e_j in R$; else if $i=j$ this is $-e_i in R$.
  \ 
  - Given $s_(e_i)(2e_j) = 2e_j - 4 delta_(i j) e_i$, if $i!=j$ this is $2e_j in R$; else if $i=j$ this is $-2e_i in R$. 
  
    When reversing the order, $s_(2e_j)(e_i) = e_i - delta_(i j)2e_j$, if $i!=j$ this is $e_i in R$; else if $i=j$ this is $-e_i in R$.
  \ 
  - Given $s_(e_i)(e_j pm e_k) = (e_j pm e_k) - 2(delta_(i j)pm delta_(i k))e_i$, for $i=j$ (which $i!=k$) this becomes $-e_i pm e_k in R$; for $i=k$ (which $i!=j$) this becomes $e_j mp e_i in R$; else if $i!=j$ and $i!=k$, it's just $e_j pm e_k in R$.

    When reversing the order, $s_(e_j pm e_k)(e_i) = e_i - (delta_(i j)pm delta_(i k))(e_j pm e_k)$, for $i=j$ (which $i!=k$) this is $mp e_k in R$; if $i=k$ (which $i!=j$) this is $mp e_j in R$; else if $i!=j$ and $i!=k$, this is $e_i in R$.
  \ 
  - Given $s_(2e_i)(2e_j) = 2e_j - 2 delta_(i j)(2e_i)$, if $i!=j$ this is $2e_j in R$; else if $i=j$ this is $-2e_i in R$.
  \ 
  - Given $s_(2e_i)(e_j pm e_k) = (e_j pm e_k) - (delta_(i j)pm delta_(i k))2e_i$, if $i=j$ (which $i!=k$) this is $-e_i pm e_k in R$; if $i=k$ (which $i!=j$) this is $e_j in R$; else if $i!=j$ and $i!=k$ this is $e_j pm e_k in R$.

    When reversing the order, $s_(e_j pm e_k)(2e_i) = 2e_i - 2(delta_(i j)pm delta_(i k))(e_j pm e_k)$, if $i=j$ (which $i!=k$) this is $mp 2e_k in R$; if $i=k$ (which $i!=j$) this is $mp 2e_j in R$; else if $i!=j$ and $i!=k$ this is $2e_i in R$.
  \ 
  - Given $s_(e_i pm_(i j) e_j)(e_k pm_(k l)e_l) = (e_k pm_(k l)e_l) - (delta_(i k) pm_(i j)delta_(j k) pm_(k l)delta_(i l) + (pm_(i j)1)(pm_(k l)1)delta_(j l))(e_i pm_(i j)e_j)$ (yep this term is diabolical...). If ${i,j,k,l}$ are four distinct indices, this reduces to $e_k pm_(k l)e_l in R$; if they form only three distinct indices (say $i=k$ up to some reordering and $pm$ sign) then $i!=j$, $j!=k$ and $i,j!=l$, so the term reduces to $pm_(k l)e_l mp_(i j)e_j in R$; finally, if they form only two distinct indices (say $i=k$, $j=l$ up to reordering and $pm$ signs), if $pm_(i j)$ and $pm_(k l)$ have the same sign, the term reduces to $-e_i mp e_j in R$, else if $pm_(i j)$ and $pm_(k l)$ have different signs, this reduces to $e_k pm_(k l)e_l in R$.

  So, all possible reflection combinations of the roots (up to signs and reorderings) are still in $R$, showing it satisfies the root system axioms.

  Then, since $e_i in R$ satisfies $2 e_i in R$, this shows that the root system is non-reduced.
]

#pagebreak()

= D//2
#problem[
  Etingof Problem Set 7.2:

  + Let $R subset E$ be a root system. Show that the set 
    $ R^or = {alpha^or | alpha in R} subset E^* $
    where $alpha^or in E^*$ is the coroot corresponding to $alpha$ is also a root system. It is usually called the #emph[dual root system] of $R$.
  + Let $Pi = {alpha_1,...,alpha_r} subset R$ be the set of simple roots. Show that the set $Pi^or = {alpha_1^or, ..., alpha_r^or} subset R^or$ is the set of simple roots of $R^or$. 
  
    (Note: this is not completely trivial, as $alpha mapsto alpha^or$ is not a linear map.)  
][
  Given that $E$ is an $RR$-inner product space, hence the linear map $E -> E^*$ by $v mapsto (v,\_)$ is an isomorphism. Which, given any $phi, psi in E^*$, say $phi = (v,\_)$ and $psi = (u,\_)$ for $v,u in E$, define an inner product $(\_,\_)_*:E^* times E^* -> E^*$ by $(phi, psi)_* = (v,u)$.

  In particular, for any root $alpha in R$, the coroot $alpha^or (\_) = (2(alpha, \_))/((alpha, alpha)) = (2alpha/((alpha,alpha)),\_)$.

  \ 

  + First, to show $R^or$ is a root system of $E^*$, notice that since the root system $R$ spans $E$, while the assignment $alpha mapsto (alpha,\_)$ defines an isomorphism $E arrow.tilde E^*$, then the collection $R' = {(alpha,\_) | alpha in R} subset E^*$ is the image of $R$ under the assignment, which spans $E^*$. 
  
    Since every $alpha in R$ is nonzero, then by positive definiteness, $(alpha,\_)!=0$ and $(alpha, alpha)>0$. Hence, up to rescaling, one has $R^or = {alpha^or | alpha in R} = {2/((alpha, alpha))(alpha,\_) | alpha in R}$, with each element being a rescale of a unique element of $R'$ (and for every element in $R'$, say $(alpha,\_)$, its rescale $2/((alpha,alpha))(alpha,\_)$ is in $R^or$). Hence, one has $R^or$ spanning $E^*$ (since $R'$ does).

    \ 

    Second, for any $alpha, beta in R$, the corrsponding coroot $alpha^or = (2alpha/((alpha,alpha)),\_)$ and $beta^or = (2beta/((beta,beta)),\_)$. So, by the above definition of the induced inner product on $E^*$, one has the following:
    $ &(alpha^or, beta^or)_* = (2alpha/((alpha,alpha)),2beta/((beta,beta))) = (4(alpha,beta))/((alpha,alpha)(beta,beta))\ 
    &(alpha^or,alpha^or)_* = (2alpha/((alpha,alpha)), 2alpha/((alpha,alpha))) = 4/((alpha,alpha)) $
    Hence, the value $n_(beta^or, alpha^or)$ is given as follow:
    $ n_(beta^or, alpha^or) = (2(alpha^or,beta^or))/((alpha^or,alpha^or)) = (2 dot 4(alpha,beta))/((alpha,alpha)(beta,beta)) dot ((alpha,alpha))/4 = (2(alpha,beta))/((beta,beta)) = n_(alpha,beta) in ZZ $

    \ 

    Now, regarding the reflections, one has the following:
    $ s_(alpha^or)(beta^or) &= beta^or - n_(beta^or,alpha^or)alpha^or = (2beta/((beta,beta)),\_) - (2(alpha,beta))/((beta,beta))(2alpha/((alpha,alpha)),\_)\ 
    &= 2/((beta,beta))(beta - (2(alpha,beta))/((alpha,alpha))alpha, \_) = 2/((beta,beta))(beta - n_(beta,alpha)alpha,\_)\ 
    &= 2/((beta,beta))(s_alpha (beta),\_) $
    Lastly, remember that for any $alpha,beta in R$, one has $(beta,beta) = (s_alpha (beta),s_alpha (beta))$, so it reduces to the following:
    $ s_(alpha^or) (beta^or) = 2/((s_alpha (beta),s_alpha (beta)))(s_alpha (beta),\_) = (s_(alpha)(beta))^or in R $
    Hence, $R^or$ satisfies all requirements for being a root system.

    \ 

    \ 

  + First, if $t in E$ is the element used for the polarization of $R$, then using the element $(t,\_) in E^*$ as the polarization  for $R^or$, one has the following:
    $ alpha in R_+ <==> (alpha, t)>0 <==> (2alpha/((alpha,alpha)),t)>0 <==> (alpha^or, (t,\_))_* >0 <==> alpha^or in (R^or)_+ $
    Which, the set of positive roots have their coroots being precisely the positive roots of $R^or$ under this polarization.

    \ 

    \

    Now, suppose the contrary that $Pi^or$ is not all the simple roots of the coroot system, then there exists $alpha_i^or$ that's not a simple roots.

    Let $S = {r_1^or,...,r_n^or}$ be the set of simple roots for $R^or$ (where each $r_i in R_+$ since we have the same polarization), this implies that $alpha_i^or = sum_(j in J)n_j r_j^or$ for some positive integer $n_j$ (Note: Here we eliminate all the zero coefficients of the $r_i^or$'s).

    Hence, based on the isomorphism between $E$ and $E^*$, one gets the following:
    $ 2alpha_i/((alpha_i,alpha_i)) = sum_(j in J)n_j dot 2r_j/((r_j,r_j)) ==> alpha_i = sum_(j in J)(n_j (alpha_i,alpha_i))/((r_j,r_j))r_j $
    Which, each $((alpha_i,alpha_i))/((r_j,r_j))>0$ because of the positive definiteness of the inner product, together with $0 in.not R$.

    Then, since each $r_j in R_+$, one can write $r_j = sum_(k=1)^n n^j_k alpha_k$ where each $n^j_k$ is a nonnegative integer (since $Pi={alpha_1,...,alpha_n}$ is the set if simple roots in $R_+$). Then, we get the following:
    $ alpha_i = sum_(j in J)(n_j (alpha_i,alpha_i))/((r_j,r_j))r_j = sum_(k=1)^n sum_(j in J)(n_j (alpha_i,alpha_i))/((r_j,r_j))n^j_k alpha_k $
    So, with the linear independence of $Pi={alpha_1,...,alpha_n}$, this implies that for $k in {1,...,n}$, one has $sum_(j in J)(n_j (alpha_i,alpha_i))/((r_j,r_j))n^j_k = delta_(i k)$. 
    
    And, with each $(n_j (alpha_i,alpha_i))/((r_j,r_j))$ being positive, and each $n^j_k$ being nonnegative, for $k!=j$, $sum_(j in J)(n_j (alpha_i,alpha_i))/((r_j,r_j))n^j_k = 0$ implies each $n^j_k = 0$. So, each $r_j = sum_(k=1)^n n^j_k alpha_k = n^j_i alpha_i$, with $n^j_i$ being some nonnegative integer.

    Finally, recall that $alpha in R$ satisfies $c alpha in R$ iff $c=pm 1$, so the equality $r_j = n^j_i alpha_i$ enforces $n^j_i = pm 1$; yet, since $r_j in R_+$, this further implies $n^j_i = 1$, or each $r_j = alpha_i$. But, this implies $alpha_i^or = r_j^or in S$ (the set of simple roots of $R^or$), which contradicts the assumption that $alpha_i^or$ is not a simple roots.

    Hence, our assumption is false, the set $Pi^or = {alpha_1^or,...,alpha_n^or}$ must be the set of simple roots of $R^or$, under this polarization.

]

#pagebreak()

= ND//3
#problem[
  Etingof Problem Set 7.8:

  Let $overline(C_+)$ be the closure of the positive Weyl chamber, and $lambda in overline(C_+)$, $w in W$ be such that $w(lambda) in overline(C_+)$.
  + Show that $lambda in overline(C_+) sect w^(-1)(overline(C_+))$.
  + Let $L_alpha subset E$ be a root hyperplane which separates $C_+$ and $w^(-1)(C_+)$. Show that then $lambda in L_alpha$.
  + Show that $w(lambda) = lambda$.

  Deduce from this that every $W$-orbit in $E$ contains a unique element from $overline(C_+)$.
][
  + Given that $w(lambda) in overline(C_+)$, it's clear that $lambda in w^(-1)(overline(C_+))$. So by definition $lambda in overline(C_+) sect w^(-1)(overline(C_+))$.

    \ 

  + Given $L_alpha$ being a root hyperplane separating $C_+$ and $w^(-1)(C_+)$ (and assume that $alpha in R_+$), this implies that for any $v in overline(C_+)$, one has $(v,alpha)>=0$, and $w^(-1)(v) in w^(-1)(overline(C_+)) = overline(w^(-1)(C_+))$ satisfies $(w^(-1)(v),alpha)<=0$ (Note: for finite dimensional $RR$-Euclidean spaces, any linear map is continuous, hence linear isomorphism is a homeomorphism, which preserves closure).

    As a result, since $lambda in overline(C_+) sect w^(-1)(overline(C_+))$, one has $(lambda, alpha)>=0$ by the first inequality, while $(lambda, alpha)<=0$ by the second inequality, so $(lambda, alpha)=0$, showing $lambda in L_alpha$.

    \ 

  + We'll use induction on the length of $w$, $ell(w)$ (which represents the minimal number of simple reflections needed to generate $w$).

    For $ell(w)=1$ (namely $w = s_(alpha_i)$ for some $alpha_i$), then since $w(alpha_i) = - alpha_i$ (also $w = w^(-1)$ since it's a reflection), then $L_(alpha_i)$ is a hyperplane separating $overline(C_+)$ and $w^(-1)(overline(C_+))$, showing that $lambda in L_(alpha_i)$, hence $(lambda, alpha_i)=0$. This implies that $w(lambda) = lambda - (2(lambda, alpha_i))/((alpha_i,alpha_i))alpha_i = lambda$.

    Now, suppose for $ell(w)=k-1$, one has $w(lambda) = lambda$. Then, now given $ell(w) = k$, say $w = s_(alpha_(i_1)) compose ... compose s_(alpha_(i_k))$, notice that $alpha_(i_k)$ is a simple root that gets send to a negative root: 

    Notice that each simple reflection only sends one positive root to negative root (namely $S_(alpha_i)$ has $alpha_i mapsto -alpha_i$, while other positive roots are mapped to positive roots, since for all positive root $alpha = sum_(j=1)^n n_j alpha_j$ where $n_j>=0$, one has $s_(alpha_i)(alpha) = alpha - sum_(i=1)^k n_j n_(alpha_j alpha_i) alpha_i$ with each $n_(alpha_j alpha_i<=0$ by the property of simple roots, hence $s_(alpha_i)(alpha)$ is again nonnegative integral sum of $alpha_j$'s, which is still a positive root).
]

#pagebreak()

= D//4
#problem[
  Etingof Problem Set 7.12:

  Let $phi:R_1 arrow.tilde R_2$ be an isomorphism between irreducible root systems. Show that then $phi$ is a composition of an isometry and a scalar operator: $(phi(v),phi(w)) = c(v,w)$ for any $v,w in E_1$.
][
  It is both sufficient and necessary to prove the case for the simple roots of $R_1$ (since the simple roots form a basis). 

  \ 

  Let $Pi={alpha_1,...,alpha_n}$ be the set of simple roots of $R_1$ under a chosen polarization. Due to the irreducibility of $R_1$, there doesn't exist nontrivial proper subset $Pi_1, Pi_2$ or $Pi$, such that $Pi_1 union.sq Pi_2 = Pi$ and $Pi_1 perp Pi_2$.

  \

  Now, since $phi$ is an isomorphism of vector spaces, each $phi(alpha_i)!=0$, and $(phi(alpha_i),phi(alpha_i))>0$. Let us define the value $c_i := ((phi(alpha_i),phi(alpha_i)))/((alpha_i,alpha_i))>0$ for each index $i$. Then, since $phi$ preserves each $n_(beta alpha)$ for all $alpha, beta in R$, for each indices $i,j$, one has the following:
  $ (2(alpha_i,alpha_j))/((alpha_i,alpha_i)) = n_(alpha_j alpha_i) = n_(phi(alpha_j)phi(alpha_i)) = (2(phi(alpha_i),phi(alpha_j)))/((phi(alpha_i),phi(alpha_i))) = (2(phi(alpha_i),phi(alpha_j)))/(c_i (alpha_i,alpha_i)) $
  So, one gets the following equality:
  $ c_i (alpha_i,alpha_j) = (phi(alpha_i),phi(alpha_j)) $
  Which, since $i,j$ are arbitrary, switching the two indices, one gets $c_j (alpha_i,alpha_j) = (phi(alpha_i),phi(alpha_j))$ also (since over $RR$-inner product space, inner product is symmetric). Hence, one gets $c_i (alpha_i,alpha_j)=(phi(alpha_i),phi(alpha_j)) = c_j (alpha_i,alpha_j)$.

  \ 

  Then, we claim that the colection of $c_i$'s only has one value (i.e. all $c_i$'s are the same).
  
  Suppose the contrary that the $c_i$'s have more than 1 value, then partition $Pi$ using the values of $c_i$: Let $Pi_1$ denotes all simple roots with $c_i = c_1$, $Pi_2$ denotes all simple roots wit $c_j != c_1$. Then, up to reordering, one can say $Pi_1 = {alpha_1,...,alpha_i}$ and $Pi_2={alpha_(i+1),...,alpha_n}$ (which, the assumption provides that both $Pi_1,Pi_2 != emptyset$).

  For any index $1<=k<=i$ and $i+1<=l<=n$, one has the following:
  $ c_1 (alpha_k,alpha_l) = c_k (alpha_k,alpha_l) = c_l (alpha_k,alpha_l) ==> (c_1-c_l)(alpha_k,alpha_l)=0 $
  Since $alpha_l in Pi_2$, one has $c_l != c_1$, so $(c_1-c_l)!=0$, then the above equality enforces $(alpha_k,alpha_l)=0$, or the two vectors are orthogonal. Yet, with $1<=k<=i$ and $i+1<=l<=n$ being arbitrary, this implies $Pi_1 perp Pi_2$, which contradicts the fact that $R_1$ is irreducible. 

  Therefore, all $c_i$'s must be the same, denote as $c:= c_i$ for all $i$.

  \ 

  Finally, the above equality $c_i (alpha_i,alpha_j) = (phi(alpha_i),phi(alpha_j))$ implies $c(alpha_i, alpha_j)= (phi(alpha_i),phi(alpha_j))$ for all indices $i,j$, then $phi$ is a composition of isometry and scalar operator on the simple roots $Pi$, hence on the whole vector space $R_1$, and this completes the proof.
]

#pagebreak()

= D//5
#problem[
  Etingof Prolem Set 7.15:

  Let $R subset E$ be an irreducible root system. Show that then $E$ is an irreducible representation of the Weyl group $W$.
][
  Suppose the contrary that $E$ is not an irreducible representation of the Weyl group $W$, which implies some nonzero proper subspace $U subset.neq E$ is invariant under the Weyl group $W$'s action. On the other hand, after picking some polarization, let $Pi = {alpha_1,...,alpha_n}$ be the set of simple roots.

  \ 

  First, pick any nonzero $x in U$, there must exist $alpha_i in Pi$, such that $(alpha_i,x)!=0$. Since if all $(alpha_i,x)=0$, one has $x in (span Pi)^perp = E^perp = 0$, which is a contradiction (since $Pi$ spans the whole space, while $x$ is assumed to be nonzero). WLOG, say $alpha_i$ is $alpha_1$ up to some reordering.

  Then, since $x$ is invariant under the Weyl group action, one has $s_(alpha_1) (x) = x - (2(alpha_1,x))/((alpha_1,alpha_1))alpha_1 in U$, showing that $(2(alpha_1,x))/((alpha_1,alpha_1))alpha_1 = x - s_(alpha_1)(x) in U$. With $(alpha_1,x)!=0$, one has $alpha_1 in U$.

  \ 

  Now, let $alpha_1,...,alpha_i in Pi$ be all the simple roots, such that there exists nonzero $x_l in U$ satisfying $(alpha_l,x_l)!=0$ (for all index $1<=l<=i$). The above process implies that each $alpha_l in U$, hence one has $span{alpha_1,...,alpha_i} subset.eq U subset.neq E$, so by linear independence of the $alpha_l$'s, $i<n$ (since it must necessarily have a smaller dimension). 

  However, for all index $i<k<=n$, since $alpha_j$ is not in the given list, it implies for all nonzero $x in U$, it must have $(alpha_k,x)=0$. In particular, all index $1<=l<=i$ satisfies $(alpha_k, alpha_l)=0$. So, take the set $Pi_1 = {alpha_1,...,alpha_i}$ and $Pi_2 = {alpha_(i+1),...,alpha_n}$, these two (nonempty) proper subsets of $Pi$ are mutually orthogonal by the above claim. Yet, this contradicts the irreducibility of $R$.

  Hence, the assumption must be false, $E$ must be an irreducible representation of the Weyl group $W$.
]