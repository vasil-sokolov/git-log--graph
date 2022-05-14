import store from './store.coffee'
import { createApp } from 'vue'
import App from './App.vue'

app = createApp(App)

console_error = console.error
handle_error = (###* @type {any} ### e) =>
    console_error e
    store.error.value = e.message or e.msg or e.data or e.body or e.stack or e.status or e.name or e.toString?() or try JSON.stringify(e)
app.config.errorHandler = handle_error
app.config.warnHandler = handle_error
window.onerror = handle_error
console.error = handle_error
window.addEventListener 'unhandledrejection', (e) =>
    handle_error e.reason

app.mount('#app')