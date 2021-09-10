/*@override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('broker'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    initialValue: _broker,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'Please enter at least 8 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'MQTT Broker URL',
                    ),
                    onSaved: (value) {
                      _broker = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('clientid'),
                    autocorrect: true,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    validator: (value) {
                      //if (value!.isEmpty || value.length < 4) {
                      //  return 'Please enter at least 4 characters';
                      //}
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'ClientID'),
                    onSaved: (value) {
                      _clientid = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('user'),
                    autocorrect: true,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    validator: (value) {
                      //if (value!.isEmpty || value.length < 4) {
                      //  return 'Please enter at least 4 characters';
                      //}
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Username'),
                    onSaved: (value) {
                      _user = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      //if (value!.isEmpty || value.length < 7) {
                      //  return 'Password must be at least 7 characters long.';
                      //}
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('topic'),
                    autocorrect: true,
                    initialValue: _topic,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Please enter at least 4 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Topic'),
                    onSaved: (value) {
                      _topic = value;
                    },
                  ),
                  SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      child: Text('Connect to Broker'),
                      onPressed: _trySubmit,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/