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
  title: "Math 231B HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= ND//1
#problem[
  Etingof Problem Set 7.1:

  Let $R subset RR^n$ be given by 
  $ R={pm e_i, pm 2e_i | 1<=i<=n} union {pm e_i pm e_j | 1<=i,j<=n, i!=j} $
  where $e_i$ is the standard basis in $RR^n$. Show that $R$ is a non-reduced root system.
][
  First, it's clear that $R$ spans the whole space, since all the standard basis elements are contained in $R$.

  \ 

  Now, given any $alpha, beta in R$ (WLOG, say they're positive components in $R$ by factoring out the $-1$), we want to show the property $(2(alpha,beta))/((alpha,alpha)) in ZZ$. Here are some cases:
  \ 
  - If $alpha = e_i$ and $beta = e_j$, one has $(2(e_i,e_j))/((e_i,e_i)) = 2 delta_(i j) in ZZ$.
  \
  - If $alpha = 2e_i$ and $beta = e_j$, one has $(2(2e_i, e_j))/((2e_i,2e_i)) = (4 delta_(i j))/4 = delta_(i j) in ZZ$.
  \
  - If $alpha = 2e_i$ and $beta = 2e_j$, one has $(2(2e_i,2e_j))/((2e_i,2e_i)) = (8 delta_(i j))/4 = 2 delta_(i j) in ZZ$.
  \
  - If $alpha = e_i$ and $beta = e_j+e_k$, one has $(2(e_i, e_j+e_k))/((e_i,e_i)) = (2 delta_(i j)+2 delta(i k)) in ZZ$.
  \
  - If $alpha = 2e_i$ and $beta = e_j+e_k$, one has $(2(2e_i, e_j+e_k))/((2e_i,2e_i)) = (4 delta_(i j)+delta_(i k))/4 = delta_(i j)+delta_(i k) in ZZ$.
  \ 
  - If $alpha = e_i+e_j$ and $beta = e_k + e_l$, one has $(2(e_i+e_j, e_k+e_l))/((e_i+e_j,e_i+e_j)) = (2(delta_(i k)+delta_(i l)+ delta_(j k)+delta_(j l)))/2 = delta_(i k)+delta_(i l)+ delta_(j k)+delta_(j l) in ZZ$.

  So, the above list verifies that any $alpha, beta in R$, one has $(2(alpha,beta))/((alpha,alpha)) in ZZ$.

  \ 

  Finally, based on the value $n_(beta alpha) = n_(alpha beta)$ derived above for all $alpha, beta in R$, one has the following for reflections:
  - If $alpha = e_i$ and $beta = e_j$, $s_alpha (beta) = e_j - 2 delta_(i j)e_i$. If $i=j$, then $s_alpha (beta) = -e_i in R$; else if $i!=j$, then $s_alpha (beta) = e_j in R$ also.
  \
  - If $alpha = 2e_i$ and $beta = e_j$, one has $s_alpha (beta) = e_j - delta_(i j)2 e_i$. If $i=j$, $s_alpha (beta) = -e_i in R$; else if $i!=j$, $s_alpha (beta) = e_j in R$. 

    Similarly , $s_beta (alpha) = 2e_i - delta_(i j)e_j$. If $i=j$, $s_beta (alpha) = e_i in R$; else if $i!=j$, $s_beta (alpha) = 2e_i in R$ also.
  \ 
  - 
]

= ND//2
#problem[
  Etingof Problem Set 7.2:

  + Let $R subset E$ be a root system. SHow that the set 
    $ R^or = {alpha^or | alpha in R} subset E^* $
    where $alpha^or in E^*$ is the coroot corresponding to $alpha$ is also a root system. It is usually called the #emph[dual root system] of $R$.
  + Let $Pi = {alpha_1,...,alpha_r} subset R$ be the set of simple roots. Show that the set $Pi^or = {alpha_1^or, ..., alpha_r^or} subset R^or$ is the set of simple roots of $R^or$. [Note: this is not completely trivial, as $alpha mapsto alpha^or$ is not a linear map].  
][

]

= ND//3
#problem[
  Etingof Problem Set 7.8:

  Let $overline(C_+)$ be the closure of the positive Weyl chamber, and $lambda in overline(C_+)$, $w in W$ be such that $w(lambda) in overline(C_+)$.
  + Show that $lambda in overline(C_+) sect w^(-1)(overline(C_+))$.
  + Let $L_alpha subset E$ be a root hyperplane which separates $C_+$ and $w^(-1)(C_+)$. Show that then $lambda in L_alpha$.
  + Show that $w(lambda) = lambda$.

  Deduce from this that every $W$-orbit in $E$ contains a unique element from $overline(C_+)$.
][]

= ND//4
#problem[
  Etingof Problem Set 7.12:

  Let $phi:R_1 arrow.tilde R_2$ be an isomorphism between irreducible root systems. Show that then $phi$ is a composition of an isometry and a scalar operator: $(phi(v),phi(w)) = c(v,w)$ for any $v,w in E_1$.
][]

= ND//5
#problem[
  Etingof Prolem Set 7.15:

  Let $ subset E$ be an irreudicble root system. Show that then $E$ is an ireducible representation of the Weyl group $W$.
][]