<my-header>

  <header style={ myStyle }>
    <h1>Jan Ken</h1>
  </header>

  <style>
    :scope header {
      width: 100%;
      /* Set the fixed height of the header here */
      /* background-color: #f5f5f5; */
      color: #fff;
      background: #3f3f3f;
      background: -webkit-linear-gradient(
        #3f3f3f 0% ,
        #6f6f6f 100%);
      background: linear-gradient(
        #3f3f3f 0% ,
        #6f6f6f 100%);
      border: 0 none;
      text-align:center;
      margin-bottom: 1em;
    }
    :scope h1 {
      display: inline-block;
      font-size: 2.0rem;
      margin: 0;
    }
  </style>

  <script>
    const myTagName = 'my-header'
    var self = this
    self.observer = opts.observer
    self.myStyle = {
      height: opts.height+'px'
    }
  </script>

</my-header>
