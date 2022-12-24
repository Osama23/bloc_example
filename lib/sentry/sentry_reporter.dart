import 'package:flutter/cupertino.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryReporter {
  late Sentry sentry;
  static Future<void> setup(Widget child) async {
    await SentryFlutter.init(
          (options) {
            // https://e9f05a71b792469888af9661b54aa0db@o4504372053409792.ingest.sentry.io/4504383580733440
        options.dsn = ''; // put your api key
        options.tracesSampleRate = 1.0;
        options.reportPackages = false;
        options.considerInAppFramesByDefault = false;
        options.release = 'github@v1.0.1';
        options.environment = 'production';
        // options.environmentAttributes = {
        //   'app_version': '1.0.0',
        //   'device_name': 'My device',
        //   'device_id': '12345',
        // };
      },
      appRunner: () => runApp(
        DefaultAssetBundle(
          bundle: SentryAssetBundle(
            enableStructuredDataTracing: true,
          ),
          child: child,
        ),
      ),
    );
  }

  static genericThrow(String message, Exception exc, {stackTrace}) async {
    if (stackTrace != null) {
      Sentry.captureException(exc, stackTrace: stackTrace);
    } else {
      Sentry.captureException(exc);
    }
  }

  static setupPerformance() async {
    final transaction = Sentry.startTransaction('processOrderBatch', 'task');
    try {
      await processOrderBatch(transaction);
    } catch (exc) {
      transaction.throwable = exc;
      transaction.status = const SpanStatus.internalError();
    } finally {
      await transaction.finish();
    }
  }

  static Future<void> processOrderBatch(ISentrySpan span) async {
    final innerSpan = span.startChild('task', description: 'operation');
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (exc) {
      innerSpan.throwable = exc;
      innerSpan.status = const SpanStatus.notFound();
    } finally {
      await innerSpan.finish();
    }
  }
}