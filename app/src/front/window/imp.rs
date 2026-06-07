use glib::subclass::InitializingObject;
use gtk::prelude::*;
use gtk::subclass::prelude::*;
use gtk::{Button, CompositeTemplate, glib};
mod backend;

#[derive(CompositeTemplate, Default)]
#[template(resource = "/resources/window.ui")]
pub struct Window {
    #[template_child]
    pub server: TemplateChild<Button>, //name has to be id name in window.ui
}   

#[glib::object_subclass]
impl ObjectSubclass for Window {
    const NAME: &'static str = "MainAppWindow";
    type Type = super::Window;
    type ParentType = gtk::ApplicationWindow;

    fn class_init(klass: &mut Self::Class) {
        klass.bind_template();
    }

    fn instance_init(obj: &InitializingObject<Self>) {
        obj.init_template();
    }
}

impl ObjectImpl for Window {
    fn constructed(&self) {
        self.parent_constructed();
        self.server.connect_clicked(|_| {
            let data : Vec<backend::Friend> = backend::backend().unwrap();
            println!("{data:?}");
        });
    }
}

impl WidgetImpl for Window {}
impl WindowImpl for Window {}
impl ApplicationWindowImpl for Window {}
