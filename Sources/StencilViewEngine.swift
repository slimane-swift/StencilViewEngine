@_exported import HTTPCore
@_exported import Suv
@_exported import Stencil

public struct StencilViewEngine: Responder {

    public var fileExtension = "stencil"

    public let path: String

    public let context: Context

    public let loop = Loop.defaultLoop

    public init(path: String, context: Context = Context(dictionary: [:])){
        self.path = path
        self.context = context
    }

    public func respond(request: Request, response: Response, completion: @escaping (Chainer) -> Void) {
        let ctx = QueueWorkContext(
            workCallback: { ctx in
                do {
                    let template = try Template(URL: URL(string: "file://\(self.path).\(self.fileExtension)")!)
                    ctx.storage["rendered"] = try template.render(self.context)
                } catch {
                    ctx.storage["error"] = error
                }

            }, afterWorkCallback: { ctx in
                if let error = ctx.storage["error"] as? Error {
                    completion(.error(error))
                }
                else if let rendered = ctx.storage["rendered"] as? String {
                    var response = response
                    let data = rendered.data
                    response.body = .buffer(data)
                    response.contentLength = data.count
                    completion(.respond(response))
                }
        })
        let qw = QueueWork(loop: loop, context: ctx)
        qw.execute()
    }
}

extension Response {
    public mutating func render(with engine: StencilViewEngine){
        self.customResponder = engine
    }
}
