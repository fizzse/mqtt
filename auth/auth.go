package auth

type IAuth interface {
	Connect(username, password, clientId string) error
	Supper(username, password, clientId string) error
	Publish(username, password, clientId, topic string) error
	Subscribe(username, password, clientId, topic string) error
}

func New() (api IAuth, err error) {
	return
}
