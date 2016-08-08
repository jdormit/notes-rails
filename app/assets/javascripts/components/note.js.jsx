var Note = React.createClass({
  render: function() {
    return (
      <div>
        <div>
          <strong>Title:</strong>
          {this.props.note.title}
        </div>
        <div dangerouslySetInnerHTML={{__html: marked(this.props.note.text)}} onClick={() => { this.props.setEditMode(true) }}></div>
      </div>
    )
  }
});
