/* eslint-disable no-console */

// The production console no longer installs an offline cache. Existing workers are
// removed so every load uses the newly deployed console assets.
export const register = () => {
  if (process.env.NODE_ENV !== 'production' || !('serviceWorker' in navigator)) {
    return;
  }

  window.addEventListener('load', async () => {
    try {
      const registrations = await navigator.serviceWorker.getRegistrations();
      await Promise.all(registrations.map((registration) => registration.unregister()));

      if ('caches' in window) {
        const cacheNames = await caches.keys();
        await Promise.all(cacheNames.map((cacheName) => caches.delete(cacheName)));
      }

      // A reload is required to detach a worker that controlled the current page.
      // The guard prevents a loop after unregistering.
      const reloadKey = 'console-worker-cleanup-reloaded';
      if (navigator.serviceWorker.controller && !sessionStorage.getItem(reloadKey)) {
        sessionStorage.setItem(reloadKey, '1');
        window.location.reload();
      }
    } catch (error) {
      console.warn('[小凡服务] 清理旧控制台缓存失败', error);
    }
  });
};

export const unregister = () => {
  if (!('serviceWorker' in navigator)) {
    return;
  }

  navigator.serviceWorker.getRegistrations()
    .then((registrations) => Promise.all(registrations.map((registration) => registration.unregister())))
    .catch((error) => {
      console.error('[小凡服务] 注销旧控制台缓存失败', error);
    });
};
