class PagesController < ApplicationController
  def index
    @projects = [
      OpenStruct.new(
        title: 'Chela\'s Blog',
        description: 'A personal blogging platform that allows users to create, edit, and share blog posts. It features user authentication, comment sections, and a sleek, responsive design.',
        technologies: 'Ruby on Rails, JavaScript, HTML, CSS',
        key_features: 'User authentication, rich text editor, comment functionality, responsive design'
      ),
      OpenStruct.new(
        title: 'Portfolio Website',
        description: 'A personal portfolio website to showcase my projects and skills. It includes sections for my bio, featured projects, blog posts, and a contact form.',
        technologies: 'HTML, CSS, Bootstrap, Ruby on Rails',
        key_features: 'Dynamic project showcase, blog integration, contact form with validation'
      )
    ]

    @blog_posts = [
      OpenStruct.new(
        title: 'Understanding Ruby on Rails',
        content: 'Ruby on Rails, often simply Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages.'
      ),
      OpenStruct.new(
        title: 'Getting Started with Bootstrap',
        content: 'Bootstrap is a free and open-source CSS framework directed at responsive, mobile-first front-end web development. It contains CSS- and JavaScript-based design templates for typography, forms, buttons, navigation, and other interface components.'
      )
    ]
  end
end
