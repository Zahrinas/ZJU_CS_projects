#include<QString>
#include<QMessageBox>

int SendMsg(QString x) {
	QMessageBox msg;
	msg.setWindowTitle("Message");
	msg.setText(x);
	msg.setIcon(QMessageBox::Information);
	msg.setStandardButtons(QMessageBox::Ok);
	if (msg.exec() == QMessageBox::Ok) {
		return 1;
	}
	return 0;
}