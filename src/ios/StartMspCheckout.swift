@objc(StartMspCheckout)
class StartMspCheckout : CDVPlugin {

    @objc func echo(_ command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

        let msg = command.arguments[0] as? String ?? ""

        if msg != "" {
            /* UIAlertController is iOS 8 or newer only. */
            let toastController = UIAlertController(
                    title: "", 
                    message: msg, 
                    preferredStyle: .alert
                )

            self.viewController?.present(
                toastController, 
                animated: true, 
                completion: nil
            )

            let duration = Int(3000)
            let deadline = DispatchTime.now() + .milliseconds(duration)
            DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
              toastController.dismiss(animated: true, completion: nil)
            })

            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: msg
            )
        }

        self.commandDelegate!.send(
            pluginResult, 
            callbackId: command.callbackId
        )
    }
}
