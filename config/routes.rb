Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  patch 'posts/:id', to: 'posts#update'
end


# Use form_for when your form is directly connected to a model. Extending our example from the introduction, this would be our Hamster's profile edit form that connects to the profile database table. This is the most common case when form_for is used

# Use form_tag when you simply need an HTML form generated. Examples of this would be: a search form field or a contact form

# Let's take this refactor one element at a time. Since we already have access to the @post instance variable we know that we can pass that to the form_for method. We also can remove the path argument and the method call since form_for will automatically set these for us. How does form_for know that we want to use PUT for the form method? It's smart enough to know that because it's dealing with a pre-existing record you want to utilize PUT over POST

#What's the difference between PUT and PATCH? It's pretty subtle. On a high level, PUT has the ability to update the entire object, whereas PATCH simply updates the elements that were changed. Many developers choose to utilize PATCH as much as possible because it requires less overhead; however, it is pretty rare when you will need to distinguish between the two verbs, and they are used interchangeably quite often.

# Notice how the title and description attributes are now nested within the post hash? That's why we needed to add the require method. But Rails wants us to be conscious of which attributes we allow to be updated in our database, so we must also permit the title and description in the nested hash. Using strong parameters like this will allow ActiveRecord to use mass assignment without trouble.