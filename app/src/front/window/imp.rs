use glib::subclass::InitializingObject;
use gtk::prelude::*;
use gtk::subclass::prelude::*;
use gtk::{Button, CompositeTemplate, glib, ListBox, Label};
mod services;
use glib::clone;

#[derive(CompositeTemplate, Default)]
#[template(resource = "/resources/window.ui")]
pub struct Window {
    #[template_child]
    pub load: TemplateChild<Button>, //name has to be same as id name in window.ui
    #[template_child]
    pub list: TemplateChild<ListBox>,
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
        let list_box = &self.list;
        
        self.load.connect_clicked(clone!(
            #[weak]
            list_box,    
            move |_| {
                let result = services::api();
                if let Ok(data) = result {
                    for elem in data {
                        if let Some(name) = elem.name {
                          //println!("{name:?}");
                          let label :Label = Label::new(Some(&name));
                          list_box.append(&label);
                        }
                    }
                } else {
                    println!("{}", result.unwrap_err());
                }
            }
        ));
    }
}

impl WidgetImpl for Window {}
impl WindowImpl for Window {}
impl ApplicationWindowImpl for Window {}
