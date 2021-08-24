# Moya_Practice

### 목표: Moya를 통해서 API 사용해 코로나 접종센터를 테이블 뷰에 뿌려준다

![ezgif com-video-to-gif](https://user-images.githubusercontent.com/70513066/130564248-913053ca-bb76-4150-974e-5b0140315d1f.gif)

    1. 테이블 뷰 만들기
    2. pod 추가 
    3. Moya 이용해서 API사용 
    4. 테이블 뷰에 데이터 뿌려준다 (완성!)

#### 1. 테이블 뷰 만들기
테이블 뷰 생성 후 오토레이아웃 잡고 컨트롤러에 연결

-   ViewController
```

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
    
```

-   ViewController Extention 


```
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITalbeViewCell()
    }
}
```

- Cell 

```
class Cell: UITableViewCell {
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lng: UILabel!
    
}
```

####  pod 추가
```
pod 'Moya', '~> 14.0'
``` 

#### Moya 이용해서 API사용

- Target
``` 
import Foundation
import Moya

enum MoyaService {
    case getCenterList(page: Int, perPage: Int)
}
```

- TargetType 
```
import Moya


// 타켓타입으로 API 사용으로 네트워킹 메서드의 상세기능을 설정한다
extension MoyaService: TargetType {
    // API 기본 URL
    var baseURL: URL {
        guard let url = URL(string: "https://api.odcloud.kr/api") else {
            fatalError()
        }
        return url
    }
    
    // 기능별 추가 되는 URL
    var path: String {
        switch self {
        case .getCenterList: return "/15077586/v1/centers"
        }
    }
    
    // REST API Type 설정 (.get, .post, ...)
    var method: Moya.Method {
        switch self {
        case .getCenterList: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCenterList(let page, let perPage): return .requestParameters(parameters: ["page": page, "perPage": perPage], encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Contetnt-type": "application/json",  "Authorization": CenterKey.Authorization]
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }

}

```

- Model

```
struct CenterModel: Codable {
    var currentCount: Int
    var data: [Center]
    var matchCount: Int
    var page: Int
    var perPage: Int
    var totalCount: Int
}

struct Center: Codable {
    var address: String
    var centerName: String
    var lat: String
    var lng: String
}
```

-  ViewModel

```
// ver. Moya 이용

import Moya

class CenterViewModel {
    fileprivate let provider = MoyaProvider<MoyaService>()
    func requestCenterList(page: Int, perPage: Int, completion: @escaping (CenterModel)-> (), failure: @escaping (String)-> ()) {
        provider.request(.getCenterList(page: page, perPage: perPage)) { result in
            switch result {
            case let .success(reponse):
                do {
                    let centerList = try JSONDecoder().decode(CenterModel.self, from: reponse.data)
                    completion(centerList)
                } catch let error {
                    print("여기로 들어옴\(result)")
                    failure(error.localizedDescription)
                }
            case let .failure(error):
                
                failure(error.localizedDescription)
            }
        }
    }
}
```
- ViewContorller 

```
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let disposeBag = DisposeBag()
    
    var centers: [Center] = []
    let viewModel = CenterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getCenterList()
    }
    
    func getCenterList() {
        viewModel.requestCenterList(page: 1, perPage: 284) { data in
            self.centers = data.data
            self.tableView.reloadData()
        } failure: { error in
            let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
```

