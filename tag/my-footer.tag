<my-footer>

  <footer style={ myStyle }>
    <p>Copyright© シンプルアップ工房</p>
  </footer>

  <style>
    :scope footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      /* Set the fixed height of the footer here */
      background: linear-gradient( #e6e6e6 0% , #ffffff 100%);
      border: 0 none;
      text-align: center;
      font-size: 10pt;
      right: 0px;
    }
  </style>

  <script>
    const myTagName = 'my-footer'
    var self = this
    self.myStyle = {
      height: opts.height+'px'
    }    
  </script>

</my-footer>
