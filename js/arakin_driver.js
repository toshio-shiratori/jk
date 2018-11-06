/**
 * メイン処理のインスタンス取得
 */
function getArakinMain() {
  return window.arakinMain
}

/**
 * 同期処理
 * 各シーンの同期を行います。
 */
function syncArakinMain() {
  // 現在のタイマー値を取得して
  // 各シーンの同期処理を行う
  var dt = new Date();
  timerValue = dt.getTime();

  // 同期処理を行う
  window.arakinMain.onEvent('proc', null, timerValue);
}
