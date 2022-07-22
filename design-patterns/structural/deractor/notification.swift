import Foundation

struct Payload {
    var name: String
}

protocol INoti {
    func send(_ data: Payload)
}

class EmailPushNotifi: INoti {
    func send(_ data: Payload) {
        print("push noti with email")
    }
}

class SlackPushNotifi: INoti {
    func send(_ data: Payload) {
        print("Push noti with slack")
    }
}

func main() {
    let pushToSlack = true
    let pushToEmail = false

    let payload = Payload(name: "Payload for send notification")
    if pushToEmail {
        let push = EmailPushNotifi()
        push.send(payload)
    }

    if pushToSlack {
        let push = SlackPushNotifi()
        push.send(payload)
    }
}

main()