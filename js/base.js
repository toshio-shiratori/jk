// イベントの定義
const EVENT_MAIN_INIT      = 'main:init'
const EVENT_MAIN_START     = 'main:start'

// ローカルストレージのキーバリュー
const LOCAL_STORAGE_TEST = 'isSupport'
const LOCAL_STORAGE_SETTING = 'arakinSetting'

/**
 * 乱数取得
 * 
 * @param int max 
 * @return 乱数値
 */
function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max))
}

/**
 * 現在時間の取得
 * 
 * @return 現在時間
 */
function getTimeValue() {
  var dt = new Date()
  return dt.getTime()
}

/**
 * グー・チョキ・パーのいずれかを取得
 * 
 * @param json probability 
 */
function getGCP(probability) {
  var value = getRandomInt(100)
  var g = probability.g
  var c = g + probability.c
  if (value < g) return 'g'
  if (value < c) return 'c'
  return 'p'
}

/**
 * 画面サイズを取得
 * 
 * @return json 画面サイズ
 */
function getWindowSize() {
  return {
    'height': window.screen.availHeight,
    'width': window.screen.availWidth
  }
}

/**
 * デフォルト設定
 */
function getDefaultSetting() {
  return {
    "g": 34, "c": 33, "p": 33
  }
}

/**
 * ローカルストレージの利用可否
 * 
 * @return true 利用できる
 * @return false 利用できない
 */
function isLocalStorageAvailable() {
  let isAvailable = false;

  try {
    localStorage.setItem(LOCAL_STORAGE_TEST, 'test')
    isAvailable = true
  } catch(e) {
    alert('LocalStorage は利用できない端末です。');
  }

  return isAvailable
}

/**
 * ローカルストレージから設定情報を取得
 * 
 * @return json 設定情報
 */
function getSetting() {
  var setting = localStorage.getItem(LOCAL_STORAGE_SETTING)
  if (setting == null) {
    //return getDefaultSetting()
    return null
  }
  return JSON.parse(setting)
}

/**
 * ローカルストレージに設定情報を保存
 * 
 * @param json setting 
 */
function setSetting(setting) {
  if (!isLocalStorageAvailable()) {
    // ローカルストレージが利用できない場合は何もしない。
    return
  }

  var obj = JSON.stringify(setting)
  localStorage.setItem(LOCAL_STORAGE_SETTING, obj)
}
