import { list } from '@keystone-next/keystone/schema';
import { password, relationship, text } from '@keystone-next/fields';

export const User = list({
  fields: {
    name: text({ isRequired: true }),
    email: text({ isRequired: true, isUnique: true }),
    password: password({ isRequired: true }),
    todos: relationship({
      ref: 'Todo.user',
      many: true,
    }),
  },
});
