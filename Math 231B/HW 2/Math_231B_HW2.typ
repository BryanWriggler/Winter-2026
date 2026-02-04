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

= ND//1
#problem[
  Le $Q$ be the root lattice of a simple Lie algebra $frak(g)$, $Q_+$ be its positive part. Define the #text(weight: "bold")[Kostant partition function] to be the function $p:Q->ZZ_(>=0)$ which attaches to $beta in Q_+$ the number of ways to write $beta$ as a sum of positive roots of $frak(g)$ (where the order does not matter), and $p(beta)=0$ if $beta in.not Q_+$.
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
]