import { AppRegistry } from 'react-native';
import { StackNavigator } from 'react-navigation';

// Components
import notesApp from './components/notesApp';
import Note from './components/Note';
import AddNote from './components/AddNote';
import ImageBrowser from './components/ImageBrowser';

const NotesNavigator = StackNavigator({
    Notes: {screen: notesApp},
    Note: {screen: Note},
    AddNote: {screen: AddNote},
    ImageBrowser: {screen: ImageBrowser}
});

AppRegistry.registerComponent('notesApp', () => NotesNavigator);
