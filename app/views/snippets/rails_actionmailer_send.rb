ActionMailer::Base.mail(
  from: "from@example.com",
  to: "to@example.com",
  subject: "Test",
  body: "Test"
).deliver_now