import UIKit
import Shadhin_BL

class RadioCollectionCell: UICollectionViewCell {

    static let identifier = "RadioCollectionCell"

    private var radioView: BLRadioView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRadioView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupRadioView()
    }

    private func setupRadioView() {
        // Create a BLRadioView instance from SDK
        if let vv = ShadhinBL.shared.radioView(isAutoPlay: false) {
            radioView = vv
            contentView.addSubview(vv)
            vv.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                vv.topAnchor.constraint(equalTo: contentView.topAnchor),
                vv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                vv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                vv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
    }

    public func configure(title: String? = "Demo Radio", seeAllArrowTint: UIColor = .green) {
        radioView?.setTitle(
            title: title,
            backgroundColor: .white,
            isDotHide: false,
            isSeeAll: true,
            seeAllArrowTint: seeAllArrowTint,
            radioImage: UIImage(named: "radio_img")
        )
    }
}



class A: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize horizontal layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self

        // Register custom cell
        collectionView.register(RadioCollectionCell.self, forCellWithReuseIdentifier: RadioCollectionCell.identifier)
        view.addSubview(collectionView)

        // Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 240)
        ])

        // Initialize SDK
        if let tabBar = self.tabBarController {
            ShadhinBL.shared.radioInitialise(tabBarController: tabBar, delegate: self)
        }
    }

    // MARK: - CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 // Demo items
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RadioCollectionCell.identifier, for: indexPath) as? RadioCollectionCell else {
            fatalError()
        }
       // cell.configure(title: "New Radio")
        return cell
    }

    // MARK: - CollectionView DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 240)
    }
}

extension A: RadioCallBack {
    func radioSeeAll(rcCode: String) {
        print("Radio see all pressed")
    }

    func fetchTokenForRadio(complete: @escaping (String, Bool) -> Void) {
        ShadhinBL.shared.login(number: "8801930186707") { isDone, token in
            if isDone {
                complete(token,true)
            }
        }
    }
}


