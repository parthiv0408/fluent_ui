import 'package:fluent_ui/fluent_ui.dart';

class InfoBars extends StatefulWidget {
  const InfoBars({Key? key}) : super(key: key);

  @override
  State<InfoBars> createState() => _InfoBarsState();
}

class _InfoBarsState extends State<InfoBars> {
  // First info bar
  bool _firstOpen = true;
  InfoBarSeverity severity = InfoBarSeverity.info;

  // Second info bar
  bool _secondOpen = true;
  bool _isLong = false;
  bool _hasActionButton = true;
  bool _isIconVisible = true;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('InfoBars')),
      children: [
        const Text(
          'Use an InfoBar control when a user should be informed of, acknowledge,'
          ' or take action on a changed application state. By default the notification'
          ' will remain in the content area until closed by the user but will '
          'not necessarily break user flow.',
        ),
        const SizedBox(height: 10.0),
        Text(
          'A closable InfoBar with options to change its severity',
          style: FluentTheme.of(context).typography.subtitle,
        ),
        const SizedBox(height: 10.0),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_firstOpen)
                InfoBar(
                  title: const Text('Title'),
                  content: const Text(
                    'Essential app message for your users to be informed of, '
                    'acknowledge, or take action on.',
                  ),
                  severity: severity,
                  isLong: true,
                  onClose: () => setState(() => _firstOpen = false),
                ),
              const SizedBox(height: 10.0),
              const Divider(),
              const SizedBox(height: 10.0),
              Checkbox(
                checked: _firstOpen,
                onChanged: (v) => setState(() => _firstOpen = v!),
                content: const Text('Is open'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: 150.0,
                child: Combobox<InfoBarSeverity>(
                  isExpanded: true,
                  items: InfoBarSeverity.values
                      .map(
                        (severity) => ComboboxItem(
                          child: Text(severity.name),
                          value: severity,
                        ),
                      )
                      .toList(),
                  value: severity,
                  onChanged: (v) => setState(() => severity = v ?? severity),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'A closable InfoBar with a long and short message and action button',
          style: FluentTheme.of(context).typography.subtitle,
        ),
        const SizedBox(height: 10.0),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_secondOpen)
                InfoBar(
                  title: const Text('Title'),
                  content: Text(
                    _isLong
                        ? 'Essential app message for your users to be informed '
                            'of, acknowledge, or take action on. Lorem Ipsum is '
                            'simply dummy text of the printing and typesetting '
                            'industry. Lorem Ipsum has been the industry\'s '
                            'standard dummy text ever since the 1500s, when an '
                            'unknown printer took a galley of type and scrambled '
                            'it to make a type specimen book.'
                        : 'A short essential message',
                  ),
                  severity: severity,
                  isLong: _isLong,
                  onClose: () => setState(() => _secondOpen = false),
                  action: _hasActionButton
                      ? Button(
                          child: const Text('Action'),
                          onPressed: () {},
                        )
                      : null,
                  isIconVisible: _isIconVisible,
                ),
              const SizedBox(height: 10.0),
              const Divider(),
              const SizedBox(height: 10.0),
              Checkbox(
                checked: _secondOpen,
                onChanged: (v) => setState(() => _secondOpen = v!),
                content: const Text('Is open'),
              ),
              Checkbox(
                checked: _isLong,
                onChanged: (v) => setState(() => _isLong = v!),
                content: const Text('Is long'),
              ),
              Checkbox(
                checked: _hasActionButton,
                onChanged: (v) => setState(() => _hasActionButton = v!),
                content: const Text('Has action button'),
              ),
              Checkbox(
                checked: _isIconVisible,
                onChanged: (v) => setState(() => _isIconVisible = v!),
                content: const Text('Is icon visible'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}