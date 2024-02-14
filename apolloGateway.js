const { ApolloServer } = require('apollo-server');
const { ApolloGateway, RemoteGraphQLDataSource } = require('@apollo/gateway');

class AuthenticatedDataSource extends RemoteGraphQLDataSource {
  willSendRequest({ request, context }) {
    if (context['token'] !== undefined) {
      request.http.headers.set('Authorization', context['token']);
    }
  }
}

// Create an Apollo Gateway with a service list
const gateway = new ApolloGateway({
  serviceList: [
    { name: "user", url: "http://localhost:3000/graphql" }, // Replace with the URL of your second GraphQL service
    // Add more services as needed
  ],
  buildService({ url }) {
    return new AuthenticatedDataSource({ url });
  },
});

// Create an Apollo Server with the gateway
const server = new ApolloServer({
  gateway,
  context: ({ req, res }) => {
    return { token: req.headers.authorization || '', res }
  },
  subscriptions: false, // Disable subscriptions for simplicity, enable if needed
});

// Start the Apollo Server on a specific port (e.g., 4000)
server.listen().then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
