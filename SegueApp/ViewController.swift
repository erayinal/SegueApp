//
//  ViewController.swift
//  SegueApp
//
//  Created by Eray İnal on 30.10.2023.
//


// Burada ikinci bir main ekranı üzerinden de çalışabilmeyi öğreneceğiz
// Bunun için öncelikle main sekmesine gelip oradan '+' tuşuna basıp ''View Controller' ekleyeceğiz
// Sonrasında açılan bu ikinci bir ViewController ekranı için ikinci bir ViewController kod sayfası açmamız lazım, bunun için:
// Olduğumuz dosya üzerine sağ click yapıp oradan 'new file' seçiip, 'Cocoa Touch Class' açmamız lazım
// Sadece eklemekle bitmiyor bir de bu iki şeyi birbirine bağlamamız lazım:
// İkinci eklediğimiz ekranın özellikleri kısmında 'İdenty inspector' kısmından 'Class' seçeneğinden yeni eklediğimiz 'secondViewController' sınıfı ile eşleştirmemiz lazım. Hepsi bu kadar



// Bu iki ekranı açığımıza göre nasıl geçiş yapacağımızı da öğrenelim. Öncelikle bilmemiz gereken bir şey var:
// * Main'de ekran yanındaki Ok işareti, uygulama çalışınca hangi ekranı çalıştırması gerketirğini belirtir. O oku istediğimiz ekrana taşıyarak istediğimiz ekranı çalıştırabiliriz

// Ekranlar arası geçiş için çeşitli yöntemler vardır
// 1)Şimdi uygulamaya bir buton ekleyelim ve bu butona basınca ikinci ekranıma gitsin. Bunu yapmak için:
// Buton açıp control tuşuna basarak ikinci ekrana sürükleyelim ve 'Action Segue' diye bir pop-up ekran çıksın. Nu ekranda 'Show' seçiyoruz. Bu yöntem aslında çok kullanılmaz çünkü geçiş yaptığımız ekran bir pop-up ekran gibi çıkar

// 2) ilk ViewController'imize tıklayıp üstten 'editör' kısmından 'embed in' sekmesinden 'Navigation Controller' seçiyoruz ve böylece üstte bir navigasyon barı ekliyor ve ilk ekrana bağlı olan her viewController'a 'Back' tuşunu ekliyor. Genelde bu yöntem kullanılır

// Şimdi böyle her şey tamam kolay kolay hallediliyor ama kodla da nasıl segue yapıldığını bilmemiz lazım çünkü ileride if-else'ler ile bazı durumları kontrol ettikten sonra segue yapmamız gereken çok fazla durumalar olacak. Şimdi de bunu öğrenelim


// Bir de bu konudan bağımsız ama öğrenilmesi lazım olan bir konu var. LifeCycle(Yaşamdöngüsü). Kodu çalıştırdığımızda fonksiyonların gerçekleşme sırası: 1) viewDidLoad            (görüntü yüklendi)
//  2) viewWillAppear         (görüntü gözükecek)
//  3) viewDidAppear          (görüntü gözüktü)
//  4) viewWillDisappear      (görüntü kaybolacak)
//  5) viewDidDisappear       (görüntü kayboldu)

// Eğer bu noktadan 'Back' ile geri gidilirse fonksiyonların uygulanma sırası şöyle olur:
// 1) viewWillAppear         (görüntü gözükecek)
// 2) viewDidAppear          (görüntü gözüktü)
// Burada önemli olan nokta şu ki 'viewDidLoad' çalışmadı. Yani ben eğer her VC açıldığında bir şey olsun istiyorsam 'viewDidLoad' altına yazmamam lazım yanlış olur ⭐️. İlk açtığımda olur ama başka yere gidip geldiğimde olmaz



import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameText: UITextField!
    
    var userName = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func nextClicked(_ sender: Any) {
        
        userName = nameText.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Bu fonksiyon segue olmadan önce en son çalıştırılan fonksiyondur. Bu olmazsa olmazdır
        
        if(segue.identifier == "toSecondVC"){
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
        }
    }
    

}

