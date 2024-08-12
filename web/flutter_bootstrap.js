{{flutter_js}}
{{flutter_build_config}}

const searchParams = new URLSearchParams(window.location.search);
const forceCanvaskit = searchParams.get('force_canvaskit') === 'true';
const userConfig = forceCanvaskit ? {'renderer': 'canvaskit'} : {};
_flutter.loader.load({
  config: userConfig,
  serviceWorkerSettings: {
    serviceWorkerVersion: {{flutter_service_worker_version}},
  },
});