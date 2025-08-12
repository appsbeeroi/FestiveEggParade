import UIKit

fileprivate final class ProductImageStore {

    static let shared = ProductImageStore()

    private let folderName = "ProductImages"
    private let fileManager: FileManager
    private let directoryURL: URL

    private init(fileManager: FileManager = .default) {
        self.fileManager = fileManager

        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.directoryURL = documentsURL.appendingPathComponent(folderName, isDirectory: true)

        ensureDirectoryExists()
    }

    private func ensureDirectoryExists() {
        var isDir: ObjCBool = false
        if !fileManager.fileExists(atPath: directoryURL.path, isDirectory: &isDir) || !isDir.boolValue {
            do {
                try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
            } catch {
                print("❌ Не удалось создать директорию изображений: \(error)")
            }
        }
    }

    private func fileURL(for id: UUID) -> URL {
        directoryURL.appendingPathComponent("\(id.uuidString).png", isDirectory: false)
    }

    private func fileURL(for fileName: String) -> URL {
        directoryURL.appendingPathComponent(fileName, isDirectory: false)
    }

    func save(_ image: UIImage, for id: UUID) async -> String? {
        let url = fileURL(for: id)

        guard let data = image.pngData() else {
            print("❌ Не удалось преобразовать UIImage в PNG")
            return nil
        }

        do {
            try data.write(to: url, options: .atomic)
            return url.lastPathComponent
        } catch {
            print("❌ Ошибка при сохранении изображения: \(error)")
            return nil
        }
    }

    func load(from fileName: String) async -> UIImage? {
        let url = fileURL(for: fileName)
        return UIImage(contentsOfFile: url.path)
    }

    func delete(for id: UUID) async {
        let url = fileURL(for: id)
        guard fileManager.fileExists(atPath: url.path) else { return }
        do {
            try fileManager.removeItem(at: url)
        } catch {
            print("❌ Ошибка при удалении изображения: \(error)")
        }
    }
}

final class ImageStorageService {

    static let shared = ImageStorageService()

    private init() {}

    private let store = ProductImageStore.shared

    @discardableResult
    func saveImage(_ image: UIImage, for id: UUID) async -> String? {
        await store.save(image, for: id)
    }

    func loadImage(from fileName: String) async -> UIImage? {
        await store.load(from: fileName)
    }

    func deleteImage(for id: UUID) async {
        await store.delete(for: id)
    }
}
