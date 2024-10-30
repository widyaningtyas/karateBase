package examples.tests;

import com.intuit.karate.junit5.Karate;

class RunnerOauth {
    @Karate.Test
    public Karate runOAuthFlow() {
        return Karate.run("BearerExample","store-token", "OtherFeature")
                .relativeTo(getClass());
    }
}
