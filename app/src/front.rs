use gtk::prelude::*;
use gtk::{glib, Application, ApplicationWindow, Button};
mod backend;

pub fn app() -> glib::ExitCode {
    let app = Application::builder()
        .application_id("org.example.HelloWorld")
        .build();
    app.connect_activate(build_ui);

    app.run()
}

fn build_ui(app : &Application) {
    let window = ApplicationWindow::builder()
        .application(app)
        .default_width(320)
        .default_height(200)
        .title("Amigos")
        .child(&button_set())
        .build();
    
    window.present();
}

fn button_set() -> Button{
    let button = Button::builder()
        .label("server")
        .margin_top(12)
        .margin_bottom(12)
        .margin_start(12)
        .margin_end(12)
        .build();

    button.connect_clicked(|_|{
        let _ = backend::backend();
    });

    button
}
