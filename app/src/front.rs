use gtk::prelude::*;
use gtk::{glib, Application, gio, CssProvider, gdk};
use gdk::Display;
use window::Window;
mod window;

pub fn app() -> glib::ExitCode {

    gio::resources_register_include!("resource")
        .expect("Failed.");

    let app = Application::builder()
        .application_id("org.gtk.amigos")
        .build();
    app.connect_startup(|_| load_css());
    app.connect_activate(build_ui);
    app.run()
}

fn build_ui(app : &Application) {       
    let window = Window::new(app);
    window.present();
}

fn load_css() {
    let provider = CssProvider::new();
    provider.load_from_string(include_str!("../resources/style.css"));

    gtk::style_context_add_provider_for_display(
        &Display::default().expect("Failed"),
        &provider,
        gtk::STYLE_PROVIDER_PRIORITY_APPLICATION,
    );
}
