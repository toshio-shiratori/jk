<content-main>

  <div style={ myStyle } onclick={ onNext }>
    <!-- JKゲーム用のキャンバス -->
    <canvas id="canvas1" width={ opts.width } height={ opts.height }></canvas><br />
  </div>

  <style>
  </style>

  <script>
    const myTagName = 'content-main'
    var self = this
    self.observer = opts.observer
    self.myStyle = {
      height: opts.height+'px',
      width: opts.width+'px'
    }

    // マウントイベント受信
    self.on('mount', function() {
      self.init()
    })

    // メイン処理開始イベント受信
    self.observer.on(EVENT_MAIN_START, function(param) {
      console.log('EVENT_MAIN_START', param)
      self.start(param)
    })

    // 遅延処理
    const delayRun = (waitSeconds, someFunction) => {
      return new Promise(resolve => {
        setTimeout(() => {
          resolve(someFunction())
        }, waitSeconds)
      })  
    }

    // グー・チョキ・パーの出現率設定を取得
    getProbabilityDecision() {
      // 既に設定取得済みの場合
      if (self.setting != null) {
        var param = self.setting
        // 1秒後にイベント通知
        delayRun(1, function() {
          self.observer.trigger(EVENT_MAIN_INIT, param)
          console.log('SND ' + EVENT_MAIN_INIT, param)
        })
      }
      else {
        // 後でAPIにするかもしれない。
        fetch('assets/json/probabilityDecision.json')
        //fetch('https://api.sastd.com/api/rubi',{
        //  mode: 'cors'
        //})
        .then(function(data) {
          return data.json()
        })
        .then(function(json) {
          var probabilityDecision = json
          var index = getRandomInt(probabilityDecision.length)
          var param = probabilityDecision[index]
          // ローカルストレージ利用可能か？
          if (isLocalStorageAvailable()) {
            self.setting = param
            setSetting(self.setting)
          }
          self.observer.trigger(EVENT_MAIN_INIT, param)
          console.log('SND ' + EVENT_MAIN_INIT, param)
        })
      }
    }

    init() {
      // メイン処理用のインスタンスを取得
      self.arakinMain = getArakinMain()
      if (typeof self.arakinMain === 'undefined') {
        // インスタンスが取得できるまで1秒遅延で自身のループ処理
        delayRun(1, self.init)
        return
      }

      // ローカルストレージ利用可能か？
      if (isLocalStorageAvailable()) {
        self.setting = getSetting()
        //self.setting = null
      }

      // グー・チョキ・パーの出現率設定を取得した後
      // 処理開始のイベント通知
      self.getProbabilityDecision()
    }

    start(param) {
      console.log('start()', param)
      if (typeof self.arakinMain === 'undefined') {
        console.error('start() self.arakinMain is undefined.');
        return
      }

      // 同期処理を10ミリ秒毎に発生させるタイマーを登録
      setInterval(syncArakinMain, 10)
    }

    /**
     * クリックイベント
     * スマホ等のタップも同じイベントになります。
     * @param event e キーコードなどの情報
     */
    onNext(e) {
      if (typeof self.arakinMain === 'undefined') {
        console.error('onNext() self.arakinMain is undefined.');
        return
      }
      self.arakinMain.onEvent('mousedown', {e:e}, getTimeValue());
    }
  </script>

</content-main>
