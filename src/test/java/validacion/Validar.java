package validacion;

import com.intuit.karate.junit5.Karate;

public class Validar {
    @Karate.Test
    Karate testAll(){
        return Karate.run().relativeTo(getClass());
    }
}
