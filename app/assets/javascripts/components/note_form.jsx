var NoteForm = React.createClass({
  componentDidMount: function() {

  },

  render: function() {
    const action = this.props.note ? `/notes/${this.props.note.id}` : `/notes`;
    const method = this.props.note ? `patch` : `post`;
    return (
      <form action={action} method="post">
        <input type="hidden" name="_method" value={method} />
        <input type='text' name='title' defaultValue={this.props.note.title} placeholder="Title" />
        <br />
        <textarea autoFocus='true' name='text' ref='note_text' defaultValue={this.props.note.text} onBlur={() => {this.props.setEditMode(false) }} placeholder="Text"/>
        <input type='submit' name='submit' />
      </form>
    );
  }
});
