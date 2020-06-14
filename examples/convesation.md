# Conversation

## Create conversation

```ruby
Gist::Conversation.create_conversation(
  id: 1234,
  user_id: 1234,
  email: "test@test.com",
  body: "Hello there!"
)
```

### Optional arguments

`user_id`, `email`


## List conversations
```ruby
Gist::Conversation.list_conversations
```

### Optional arguments

`sort`, `status`, `order`

`order` - asc or desc

`status` - all, open, closed or snoozed

`sort` - created_at, updated_at or waiting_since


Default values: order = `desc`, status = `all` sort = `updated_at`


## Get conversation

Specify the id of the conversation you wish to retrieve, where {id} is the id field of the conversation.

```ruby
Gist::Conversation.get_conversation(id: 1234)
```

## Delete conversation

```ruby
Gist::Conversation.delete_conversation(id: 1234)
```


## Assign conversation

You can assign a conversation to another teammate by passing `teammate_id` 
```ruby
Gist::Conversation.assign_conversation(id: 1234, assignee_id: 1234, teammate_id: 1234)
```

or you can assign a conversation to be unassigned when you reply to a conversation. You should do this if you do not want the conversation to remain in your own inbox. This will allow other teammates to pick up the conversation when the contact replies to it

```ruby
Gist::Conversation.assign_conversation(id: 1234, assignee_id: nil, teammate_id: 1234)
```

## Snooze a conversation

```ruby
Gist::Conversation.snooze_conversation(id: 1234, snooze_until: 1567899, teammate_id: 1234)
```

`snooze_until` is the time in Unix time (i.e. seconds) you want the conversation to reopen

Only teammates can snooze a conversation so you need to provide the `teammate_id`


## Re-open a conversation

```ruby
Gist::Conversation.reopen_conversation(id: 1234, teammate_id: 1234)
```

Only teammates can re-open a conversation so you need to provide the `teammate_id`

## Close a conversation

```ruby
Gist::Conversation.close_conversation(id: 1234, teammate_id: 1234)
```

Only teammates can close a conversation so you need to provide the `teammate_id`


## Prioritize a conversation

```ruby
Gist::Conversation.prioritize_conversation(id: 1234, teammate_id: 1234)
```

Only teammates can prioritize a conversation so you need to provide the `teammate_id`

## De-prioritize a conversation

```ruby
Gist::Conversation.prioritize_conversation(id: 1234, teammate_id: 1234, priority: "not_priority")
```

Only teammates can de-prioritize a conversation so you need to provide the `teammate_id`


## Retrieve conversation count

```ruby
Gist::Conversation.retrieve_conversation_count
```

## Retrieve conversation messages

```ruby
Gist::Conversation.retrieve_conversation_messages
```

## Reply to contact

```ruby
Gist::Conversation.reply_to_contact(
  id: 1234,
  user_id: 1234,
  email: "test@test.com",
  body: "Hello there!",
  conversation_id: 1234
)
```

### Optional arguments

`user_id`, `email`, `message_type`

