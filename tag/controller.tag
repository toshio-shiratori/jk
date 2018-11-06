<controller>

  <script>
    var self = this
    self.observer = opts.observer
    var subRoute = route.create() // create another routing context

    // メイン初期処理イベント受信
    self.observer.on(EVENT_MAIN_INIT, function(param) {
      console.log('EVENT_MAIN_INIT', param)
      var param = {
        "decision": getGCP(param),
        "level": 0
      }
      eventNotify(EVENT_MAIN_START, param)
    })

    // イベント通知
    // ログ出力 ON/OFF の切り替えを制御するためにラッパーを作成
    function eventNotify(event, param) {
      if (event == null) {
        return
      }
      self.observer.trigger(event, param)
      console.log('SND ' + event, param)
    }
  </script>

</controller>