package examples.tests;

import com.intuit.karate.junit5.Karate;

public class Runner2 {

    @Karate.Test
    public Karate runUserConnect() {
        return Karate.run("connectUser").relativeTo(getClass());
    }
}
