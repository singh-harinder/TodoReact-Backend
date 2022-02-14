import { relationship, text } from '@keystone-next/fields';
import { list } from '@keystone-next/keystone/schema';

export const Todo = list({
  fields: {
    title: text({ isRequired: true, isUnique: true }),
    description: text(),
    user: relationship({
      ref: 'User.todos',
      defaultValue: ({ context }) => ({
        // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
        connect: { id: context.session.itemId },
      }),
    }),
  },
});
