import UIKit

extension UIImageView {

    func setImage(with url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                if 200..<300 ~= response.statusCode {
                    let apiResponse = APIResponse(data: data, response: response)
                    guard let data = apiResponse.data, let image = UIImage(data: data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }

        task.resume()
    }

}
