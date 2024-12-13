//Thiết kế bởi RC Man
int Robot_stop_distance = 2;// Khoảng cách phát hiện vật cản
//Kết nối SRF 04
const int trigPin = 12; // kết nối chân trig với chân 12 arduino
const int echoPin = 13; // kết nối chân echo với chân 13 arduino

int ENA = 11; 
int IN1 = 10;
int IN2 = 9;

int ENB = 6; 
int IN3 = 7;
int IN4 = 8;

//Set tốc độ của robot
#define ENASpeed 150
#define ENBSpeed 150

int Sensor1 = 0;
int Sensor2 = 0;
int Sensor3 = 0;
int Sensor4 = 0;


long duration; //
int distance;  // biến khoảng cách


void setup() {

  pinMode(ENA, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);

  pinMode(ENB, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);

  pinMode(Sensor1, INPUT);
  pinMode(Sensor2, INPUT);
  pinMode(Sensor3, INPUT);
  pinMode(Sensor4, INPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  analogWrite(ENA, ENASpeed);
  analogWrite(ENB, ENBSpeed);
  delay(2000);
}

void loop() {
  
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2;

  Sensor1 = digitalRead(2);
  Sensor2 = digitalRead(3);
  Sensor3 = digitalRead(4);
  Sensor4 = digitalRead(5);

  

  //Khi khoảng cách từ robot nhỏ hơn giới hạn (10cm) thì: 
  if (distance < Robot_stop_distance)
  {    
    // Backward(); //robot đi lùi với thời gian là 300 ms (Các bạn điều chỉnh thông số này sao cho phù hợp với thực tế)
    // delay(500);
    // Robot_stop(); //robot dừng lại với thời gian là 100 ms 
    // delay(100);

    // Turn_left();//robot xoay phải với thời gian là 500 ms (Các bạn điều chỉnh thông số này sao cho phù hợp với thực tế)
    // delay(600);
    // Robot_stop(); //robot dừng lại với thời gian là 100 ms
    // delay(100);

    // forward(); //robot đi thẳng với thời gian là 400 ms (Các bạn điều chỉnh thông số này sao cho phù hợp với thực tế)
    // delay(200);
    // Robot_stop(); //robot dừng lại với thời gian là 100 ms
    // delay(100);

    // forward();
    Backward();
    delay(300);
    rotate();
    delay(500);

    while (Sensor2 or Sensor3 == LOW) {

      Sensor1 = digitalRead(2);
      Sensor2 = digitalRead(3);
      Sensor3 = digitalRead(4);
      Sensor4 = digitalRead(5);

    }

  }
  

  if (Sensor4 == HIGH && Sensor3 == HIGH && Sensor2 == LOW && Sensor1 == LOW) {
    Turn_left();
  }

  if (Sensor4 == HIGH && Sensor3 == HIGH && Sensor2 == HIGH && Sensor1 == LOW) {
    Turn_left();
  }

  if (Sensor4 == HIGH && Sensor3 == LOW && Sensor2 == LOW && Sensor1 == LOW) {
    Turn_left();
  }

  if (Sensor4 == LOW && Sensor3 == LOW && Sensor2 == HIGH && Sensor1 == HIGH) {
    Turn_right();
  }

  if (Sensor4 == LOW && Sensor3 == LOW && Sensor2 == LOW && Sensor1 == HIGH) {
    Turn_right();
  }

  if (Sensor4 == LOW && Sensor3 == HIGH && Sensor2 == HIGH && Sensor1 == HIGH) {
    Turn_right();
  }
  
  if (Sensor4 == HIGH && Sensor3 == HIGH && Sensor2 == HIGH && Sensor1 == HIGH) {
    Robot_stop();
  }

  if (Sensor4 == LOW && Sensor3 == HIGH && Sensor2 == HIGH && Sensor1 == LOW) {
    forward();
  }

  if (Sensor4 == HIGH && Sensor3 == LOW && Sensor2 == HIGH && Sensor1 == HIGH) {
    forward();
  }

  if (Sensor4 == HIGH && Sensor3 == HIGH && Sensor2 == LOW && Sensor1 == HIGH) {
    forward();
  }
  if (Sensor4 == HIGH && Sensor3 == LOW && Sensor2 == HIGH && Sensor1 == HIGH) {
    Turn_left();
  }



}
void rotate()
{
  analogWrite(ENA, ENASpeed);
  analogWrite(ENB, ENBSpeed);
  //motor A tiến
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  //motor B tiến
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
}

void forward()
{
  analogWrite(ENA, ENASpeed-20);
  analogWrite(ENB, ENBSpeed-20);
  //motor A tiến
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  //motor B tiến
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
}

void Backward()
{
  analogWrite(ENA, ENASpeed);
  analogWrite(ENB, ENBSpeed);
  //motor A lùi
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  //motor B lùi
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
}

void Turn_right()
{
  analogWrite(ENA, ENASpeed);
  analogWrite(ENB, ENBSpeed);
  //motor A lùi
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  //motor B tiến
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
}
void Turn_left()
{
  analogWrite(ENA, ENASpeed);
  analogWrite(ENB, ENBSpeed);
  //motor A tiến
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  //motor B lùi
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
}
void Robot_stop() 
{
  //motor A tiến
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  //motor B lùi
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
}
