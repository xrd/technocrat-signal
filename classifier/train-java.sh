curl --data 'code=class MyClass{ public static void main( String[] args ){ System.out.println( "Hello from Java" ); } }' "http://192.168.99.100:4567/train/java"

curl --data 'code=puts "Hi,from+Ruby"' "http://192.168.99.100:4567/train/ruby"
