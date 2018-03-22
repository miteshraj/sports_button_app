/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to the Sports Button App!"
    };
  },
  created: function() {
    axios.get("/teams.json").then(function(response) {
      this.teams = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};


var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "", 
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        favorite_team: this.favoriteTeam
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};


var GamesPage = {
  template: "#games-page",
  data: function() {
    return {
      games: []
    };
  },
  created: function() {
    axios.get("/teams").then(function(response) {
      this.games = response.data;
    }.bind(this));
  },
  methods: {
    showGames: function(date) {
      axios.get("/teams").then(function(response) {
        var team = this.team[0]
        return team.name
      })

    }
  },
  computed: {}
};



var UserPage = {
  template: "#user-page",
  data: function() {
    return {
      user_info: []
    };
  },
  created: function() {
    axios.get("/users").then(function(response) {
      this.user_info = response.data;
    }.bind(this));
  },
  methods: {
    showGames: function(date) {
 
      }
  },
  computed: {}
};


var UserTeam = {
  template: "#user-team",
  data: function() {
    return {
      games: []
    };
  },
  created: function() {
    axios.get("/teams").then(function(response) {
      this.games = response.data;
    }.bind(this));
  },
  methods: {
    showGames: function() {
      for (var i = 0; i < this.games.length; i++) {
        if (this.games[i].AwayTeam === "DEN" || this.games[i].HomeTeam === "DEN") {
          return this.games[i].AwayTeam;
        }
      }
    },
    otherTeam: function() {
      for (var i = 0; i < this.games.length; i++) {
        if (this.games[i].AwayTeam === "DEN" || this.games[i].HomeTeam === "DEN") {
          return this.games[i].HomeTeam + " on channel: " + this.games[i].Channel + " at " +
          this.games[i].DateTime + "  score: " + this.games[i].AwayTeamScore + " - " + this.games[i].HomeTeamScore 
          + " in quarter: " + this.games[i].quarter
        }
      }
    }
  },
  computed: {}
};





var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/signup", component: SignupPage },
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage },
  { path: "/gamespage", component: GamesPage },
  { path: "/userpage", component: UserPage },
  { path: "/userteam", component: UserTeam }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

