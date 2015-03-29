//
//  ConseilsViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 29/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "ConseilsViewController.h"
#import "ConseilViewController.h"
#define detail1 @"La première recommandation pour bien gèrer son diabète est la perte de quelques kilos, souvent à l’origine de ce type de diabète.\
Si le poids est normal (ce qui est rarement le cas, avec IMC<25), il faut réduire les lipides et surtout les lipides saturés, c’est-à-dire les graisses animales (viandes rouges, charcuterie, fromages..).\
S’il existe une surcharge pondérale (IMC > 25, surcharge abdominale) : les régimes basses calories (< 1200 K calories / jour) sont déconseillés. une réduction modérée des apports est mieux tolérée et donne de meilleurs résultats au long cours  L’avis d’un nutritionniste, d’une diététitienne est utile. De manière générale, ayez une alimentation équilibrée respectant les repas et prenant en compte l’activité physique."
#define detail2 @"Tabac : il est nécessaire d’arrêter de fumer car l’association diabète de type 2 et cigarettes majore les risques de maladies cardiovasculaires\
Alcool : très riche en glucides, son apport doit être modéré et limité au vin - 2 verres (femmes) à 3 verres (hommes) de vin par jour avec un ou deux jours par semaine sans consommation\
Hygiène : afin d’éviter les infections cutanées, fréquentes chez les diabétiques, il faut veiller à une hygiène corporelle scrupuleuse, notamment des pieds."

#define detail3 @"Pendant un exercice physique, pour répondre à la demande en énergie et en oxygène des muscles, le coeur active sa pompe et envoie le sang dans les artères et les vaisseaux. L'augmentation du débit sanguin dilate les vaisseaux, entraînant une \"oxygénation\" du corps et des organes. Si elle est régulière, cette opération contribue à maintenir l'élasticité des artères, elle permet une bonne irrigation des organes.\
\
En pratiquant un sport régulièrement ou une activité physique régulière, on maintient le muscle du cœur (et l'organisme tout entier) dans un entraînement régulier. Entraîné, le cœur a un meilleur rendement. Il est plus efficace, bat plus lentement (les grands cyclistes ont un pouls à 40-45 battements par minute), se fatigue moins et s'adapte mieux aux demandes de l'organisme.\
																								\
																										 De plus, lors d'un exercice physique, une quantité importante de sucre est brûlée par le muscle, l'action de l'insuline s'en trouve améliorée."

@interface ConseilsViewController ()

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageDetail;
@property (strong, nonatomic) NSArray *pageImages;

@end

@implementation ConseilsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.pageTitles = @[@"Surveiller votre poids et votre alimentation", @"Avoir une bonne hygiène de vie", @"Les bénéfice d'une activité sportive"];
	self.pageDetail = @[detail1, detail2, detail3];
	self.pageImages = @[@"manger.png", @"dormir.png", @"courir.png"];
	
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
	NSUInteger index = ((ConseilViewController*) viewController).pageIndex;
	
	if ((index == 0) || (index == NSNotFound)) {
		return nil;
	}
	
	index--;
	return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
	NSUInteger index = ((ConseilViewController*) viewController).pageIndex;
	
	if (index == NSNotFound) {
		return nil;
	}
	
	index++;
	if (index == [self.pageTitles count]) {
		return nil;
	}
	return [self viewControllerAtIndex:index];
}


- (ConseilViewController *)viewControllerAtIndex:(NSUInteger)index
{
	if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
		return nil;
	}
	
	// Create a new view controller and pass suitable data.
	ConseilViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConseilViewController"];
	pageContentViewController.adviceImage = self.pageImages[index];
	pageContentViewController.titleAdvice = self.pageTitles[index];
	pageContentViewController.adviceContent = self.pageDetail[index];
	pageContentViewController.pageIndex = index;
	
	return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
	return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
	return 0;
}

@end
