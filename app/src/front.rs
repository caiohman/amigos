use gtk::prelude::*;
use gtk::{glib, Application, gio};
use window::Window;
mod window;

pub fn app() -> glib::ExitCode {

    gio::resources_register_include!("resource")
        .expect("Failed.");

    let app = Application::builder()
        .application_id("org.gtk.amigos")
        .build();
    app.connect_activate(build_ui);
    app.run()
}

fn build_ui(app : &Application) {       
    let window = Window::new(app);
    window.present();
}
