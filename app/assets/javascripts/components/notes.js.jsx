var Notes = React.createClass({
    getInitialState: function() {
      return {
        current_note: this.props.notes[0],
        edit_mode: false
      };
    },

    setCurrentNote: function(note) {
      this.setState({current_note: note});
    },

    setEditMode: function(editing) {
      this.setState({edit_mode: editing});
    },

    render: function() {
      return (
        <div>
          <div class='notes-list'>
            <ul>
              {
                this.props.notes.map((note) => {
                return (
                <li key={note.id} onClick={() => { this.setCurrentNote(note)} }>
                  {note.title}
                </li>
                )
              })
              }
            </ul>
          </div>
          <div class='note-view'>
            {
              this.state.edit_mode ?
              <NoteForm note={this.state.current_note} setEditMode={this.setEditMode} key={this.state.current_note.id}/> :
              <Note note={this.state.current_note} setEditMode={this.setEditMode} key={this.state.current_note.id}/>
            }
          </div>
        </div>
      );
    }
});
