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
  title: "Math 231B HW 2",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(i)")

= (iv) ND :(//1
#problem[
  Let $Q$ be the root lattice of a simple Lie algebra $frak(g)$, $Q_+$ be its positive part. Define the #text(weight: "bold")[Kostant partition function] to be the function $p:Q->ZZ_(>=0)$ which attaches to $beta in Q_+$ the number of ways to write $beta$ as a sum of positive roots of $frak(g)$ (where the order does not matter), and $p(beta)=0$ if $beta in.not Q_+$.
  + Show that 
    $ sum_(beta in Q_+)p(beta) e^(-beta) = 1/(product_(alpha in R_+)(1-e^(-alpha))) $
  + Prove the #text(weight: "bold")[Kostant multiplicity formula]
    $ dim L_lambda [ gamma] = sum_(w in W)(-1)^(ell(w))p(w(lambda + rho)-rho-gamma) $
  + Compute $p(k_1 alpha_1 + k_2 alpha_2)$ for $frak(g)=sl_3$ and $frak(g)=sp_4$.
  + Use (iii) to compute explicitly the weight multiplicities of the irreducible representations $L_lambda$ for $frak(g)=sl_3$ and $frak(g)=sp_4$. (You should get a sum of $6$, respectively $8$ terms, not particularly appealing, but easily coputable in each special cases).
][
  Here, we'll assume $alpha_1,...,alpha_n$ are all the positive roots under some polarization.

  \
  
  + First, suppose $beta in Q_+$, then $beta = k_1 alpha_1+...+k_n alpha_n$ for some $k_1,...,k_n in NN$. As a result:
    $ e^(-beta) = e^(-k_1 alpha_1-...-k_n alpha_n)= e^(-k_1 alpha_1)...e^(-k_n alpha_n) $
    Now, consider the fact that as operators, all $alpha in R_+$ satisfies the following:
    $ 1/(1-e^(-alpha)) = sum_(k=0)^infinity e^(-k alpha) $
    Hence, the product formula (after expanding the product) becomes the following:
    $ 1/(product_(alpha in R_+)(1-e^(-alpha))) = product_(alpha in R_+)(sum_(k=0)^infinity e^(-k alpha)) = sum_((k_1,...,k_n) in NN^n)e^(-k_1 alpha_1-...-k_n alpha_n) $
    Notice that each $(k_1,...,k_n) in NN^n$ corresponds to a unique $beta in Q_+$, namely $beta = k_1 alpha_1+...+k_n alpha_n$. And, the number of elements in $NN^n$ corresponding to each $beta in Q_+$ is precisely given by the partition $p(beta)$ (i.e. distinct numbers of nonnegative integer combinations of simple roots that form $beta$, which corresponds to the distinct $n$-tuples corresponding to $beta$).

    Hence, the sum is naturally equal to $sum_(beta in Q_+)p(beta)e^(-beta)$, since there are $p(beta)$ distinct $n$-tuples $(k_1,...,k_n) in NN^n$ satisfying $beta = k_1 alpha_1+...+k_n alpha_n$.

    \ 

  + Using the Weyl Character Formulas, one gets the following characterization:
    $ chi_lambda &= (sum_(w in W)(-1)^(ell(w))e^(w(lambda + rho)))/(product_(alpha in R_+)(e^(alpha/2)-e^(-alpha/2)))\ 
    &= (sum_(w in W)(-1)^(ell(w))e^(w(lambda + rho)))/(product_(alpha in R_+)(1-e^(-alpha))e^(alpha/2))\ 
    &=(sum_(w in W)(-1)^(ell(w))e^(w(lambda + rho))e^(-rho))/(product_(alpha in R_+)(1-e^(-alpha)))\ 
    &= (sum_(w in W)(-1)^(ell(w))e^(w(lambda + rho)-rho))product_(alpha in R_+)(1+e^(-alpha)+e^(-2alpha)+...) $
    (Note: recall the definition $rho := 1/2 sum_(alpha in R_+) alpha$).
    $ chi_lambda = sum_(gamma in P)dim L_lambda [gamma]e^(gamma) $
    Given any $gamma in P$, suppose the $n$-tuples $(k_1,...,k_n) in NN^n$ (corresponding to $beta = k_1 alpha_1+...+k_n alpha_n$) satisfies $e^gamma = e^(w(lambda+rho)-beta-rho)$, one has $gamma = w(lambda+rho)-beta-rho$, or $beta = w(lambda+rho)-gamma - rho$ (here, denote it as $beta_(w,gamma)$). Based on part (i), one knows there are total of $p(beta_(w,gamma))$ number of $e^(-beta_(w,gamma))$ appearing in the large product above, then the term can also be rewritten as the following:
    $ chi_lambda &= (sum_(w in W)(-1)^(ell(w))e^(w(lambda + rho)-rho))product_(alpha in R_+)(1+e^(-alpha)+e^(-2alpha)+...)\ 
    &= sum_(gamma in P)(sum_(w in W)(-1)^(ell(w))p(beta_(w,gamma))e^(w(lambda+rho)-beta_(w,gamma)-rho))\ 
    &= sum_(gamma in P)(sum_(w in W)(-1)^(ell(w))p(beta_(w,gamma))e^gamma) $
    So, the coefficient of $e^gamma$ must be $sum_(w in W)(-1)^(ell(w))p(beta_(w,gamma))$, where $p(beta_(w,gamma)) = p(w(lambda+rho)-gamma-rho)$. And, the second equation states that such coefficient is $dim L_lambda [gamma]$. So, one gets:
    $ dim L_lambda [gamma] = sum_(w in W)(-1)^(ell(w))p(w(lambda+rho)-gamma-rho) $

    \ 
    \ 
    \ 
    \ 


  + #text(weight: "bold")[Case for $sl_3$:]
  
    First, for the case of $sl_3$ (or $A_2$, with $6$ roots), since the graphs are formed by structure similar to regular hexagons, let $alpha_1, alpha_2$ be two simple roots under some polarization, then the third positive root $alpha_3 = alpha_1+alpha_2$.

    Now, given arbitrary $k_1,k_2 in ZZ$, to consider $p(k_1 alpha_1+k_2 alpha_2)$: Since if $k_1<0$ or $k_2<0$, $k_1 alpha_1 + k_2 alpha_2 in.not Q_+$, then $p(k_1 alpha_1+k_2 alpha_2)=0$. Now, we'll focuse on $k_1,k_2>=0$. 
    
    To consider the case $k_1 <= k_2$, notice that if $l_1,l_2,l_3 in NN$ satisfies $l_1 alpha_1+l_2 alpha_2+l_3 alpha_3=k_1 alpha_1+k_2 alpha_2$, then one has the following:
    $ (l_1+l_3)alpha_1+(l_2+l_3)alpha_2= k_1 alpha_1+k_2 alpha_2 $
    Which, since the simple roots $alpha_1,alpha_2$ form a basis, the above enforces $l_1+l_3=k_1$ and $l_2+l_3=k_2$. With all components being nonnegative together with $k_1<= k_2$, one observes that $0<=l_3 <= k_1<= k_2$, which implies there are at most $k_1+1$ distinct choices for $l_3$ (namely $0,1,...,k_1$). However, for each fixed $l_3 in {0,1,...,k_1}$, one has the equation $l_1 = k_1-l_3>=0$ and $l_2 = k_2-l_3>=0$ by how we define $k_1,k_2,$ and $l_3$. So, each fixed $l_3$ corresponds to a unique tuple, showing there are total of $k_1+1$ ways of writing $k_1 alpha_1+k_2 alpha_2$ ($k_1<= k_2$) as nonnegative integer sums of the positive roots $alpha_1,alpha_2, alpha_3=alpha_1+alpha_2$ of $sl_3$.

    Finally, for the case $k_1>k_2$, notice that if reversing all the inequalities beforehand, one gets that the multiplicity will be $k_2+1$ instead. Hence, one can conclude that for $sl_3$, the partition function is given as follow:
    $ p(k_1 alpha_1+k_2 alpha_2) = cases(
      0 & k_1<0 "or" k_2<0,
      min{k_1,k_2}+1 quad & k_1\,k_2>=0
    ) $

    \ 

    \

    For the case of $sp_4$ (or $C_2$), let $alpha_1$ indicates the shorter simple root and $alpha_2$ indicates the longer simple root. Then, the remaining positive roots have $alpha_3 = alpha_1+alpha_2$, and $alpha_4 = 2alpha_1+alpha_2$.

    Similarly, given arbitrary $k_1 alpha_1 + k_2 alpha_2$ (where $k_1,k_2 in ZZ$), if $k_1<0$ or $k_2<0$, since $k_1 alpha_1+k_2 alpha_2 in.not Q_+$, one has $p(k_1 alpha_1+k_2 alpha_2)=0$. So, we'll again focus on the case $k_1,k_2>=0$.

    \ 

    First, look at the case $k_1<=2k_2$: If the integers $l_1,l_2,l_3,l_4 in NN$ satisfies $k_1 alpha_1+k_2 alpha_2 = l_1 alpha_1+l_2 alpha_2 + l_3 alpha_3+ l_4 alpha_4$, one gets the following simplification:
    $ (l_1+l_3+2 l_4)alpha_1 + (l_2+l_3+l_4)alpha_2 = k_1 alpha_1+k_2 alpha_2 $
    With $alpha_1,alpha_2$ being a basis, this enforces $l_1+l_3+2l_4 = k_1$ and $l_2+l_3+l_4 = k_2$. So, the first requirement is: $0<=2l_4<=k_1$ and $0<=l_4<=k_2$, or $0<=l_4 <= k_1/2 <= k_2$. This enforces $0<=l_4 <= floor(k_1/2)$ (so, there are at most $floor(k_2/2)+1$ choices for $l_4$, namely $0,1,...,floor(k_1/2)$).

    Then, when fixing $l_4$, the system reduces to $l_1+l_3 = k_1-2l_4$ and $l_2+l_3 = k_2-l_4$. Notice that with $2l_4<=k_1$ and $l_4<=k_2$, the above has $0<=k_1-2l_4, k_2 - l_4$. So, again with $l_1,l_2,l_3 in NN$, it reduces to the case computed for $sl_3$, namely there are $min{k_1-2l_4,k_2-l_4}+1$ distinct choices of the 3-tuple $(l_1,l_2,l_3)$. Hence, the following is the total number of ways (given $k_1<=k_2$):
    $ sum_(l_4=0)^floor(k_1/2)min{k_1-2l_4,k_2-l_4}+1 $
    There are two separated case to consider now: If $k_1<=k_2$ is true, then $k_1-2l_4 <= k_2-l_4$ for all given $l_4$. Hence, the equation reduces to the following:
    $ sum_(l_4=0)^floor(k_1/2)min{k_1-2l_4,k_2-l_4}+1 &= sum_(l_4=0)^floor(k_1/2)(k_1-2l_4+1)\
    &= (floor(k_1/2)+1)(k_1+1) - floor(k_1/2)(floor(k_1/2)+1)\ 
    &= (floor(k_1/2)+1)(k_1-floor(k_1/2)+1) $
    Else, if $k_1>k_2$, we aim to find the range where $k_1-2l_4<=k_2-l_4$, or when $k_1 <= k_2+l_4$, equivalent to say $k_1-k_2<=l_4$. Notice that by our initial assumption, $k_1<=2k_2$, then one has $k_1-k_2 <= k_1-k_1/2 = k_1/2$, so $k_1-k_2<=floor(k_1/2)$ (since both are integers with the same bound), hence it makes sense to talk about $k_1-k_2<=l_4$. As a result the formula becomes:
    $ sum_(l_4=0)^floor(k_1/2)min{k_1-2l_4,k_2-l_4}+1 =& sum_(l_4=0)^(k_1-k_2-1)(k_2-l_4+1)+sum_(l_4=k_1-k_2)^floor(k_1/2)(k_1-2l_4+1)\ 
    =& k_2(k_1-k_2)+(k_1+1)(floor(k_1/2)-k_1+k_2)\
    &- floor(k_1/2)(floor(k_1/2)+1)+(k_1-k_2-1)(k_1-k_2)/2\ 
    =& (k_1+k_2-1)(k_1-k_2)/2+(k_1+1)(floor(k_1/2)-k_1+k_2)\ 
    &- floor(k_1/2)(floor(k_1/2)+1) $

    \

    Now, to consider the case $k_1>2k_2$, then the previous restrictions become $0<=l_4<=k_1/2$ and $0<=l_4<=k_2$, in this case $k_2<k_1/2$, so the bound becomes $0<=l_4<=k_2$ (so $l_4 = 0,1,...,k_2$).

    Then, with any fixed $l_4$, one requires $l_1+l_3 = k_1-2l_4$, and $l_2+l_3=k_2-l_4$; again using the case computed for $sl_3$, one has total of $min{k_1-2l_4,k_2-l_4}+1$ different ways of expressing $(l_1,l_2,l_3) in NN^3$. So, the formula is the following:
    $ sum_(l_4=0)^(k_2) min{k_1-2l_4,k_2-l_4}+1 $
    Which, since $k_2 - l_4<= 2k_2-2l_4 < k_1-2l_4$, one has the minimum be $k_2-l_4$ always. SO, the equation reduces to the following:
    $ sum_(l_4=0)^(k_2)min{k_1-2l_4,k_2-l_4}+1 &= sum_(l_4=0)^(k_2)(k_2-l_4+1)\ 
    &= (k_2+1)^2 - (k_2(k_2+1))/2\ 
    &= ((k_2+1)(k_2+2))/2 $

    \ 

    Finally, here's the full list:
    $ p(k_1 alpha_1+k_2 alpha_2) = cases(
      0 & k_1<0 "or" k_2<0,
      (floor(k_1/2)+1)(k_1-floor(k_1/2)+1) & 0<=k_1<=k_2,
      ,
      ((k_1+k_2-1)(k_1-k_2))/2+(k_1+1)(floor(k_1/2) -k_1+k_2)&,
      -floor(k_1/2)(floor(k_1/2)+1) & k_2<k_1<=2k_2,
      ,
      ((k_2+1)(k_2+2))/2 & 2k_2<k_1

    ) $


    \

    \ 

  + Didn't finish the calculation :(
]