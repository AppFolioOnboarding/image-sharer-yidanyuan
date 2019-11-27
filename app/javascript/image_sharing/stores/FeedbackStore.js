import { action, observable } from 'mobx';

export class FeedbackStore {
  @observable userName;
  @observable comment;
  @observable response;

  constructor() {
    this.userName = '';
    this.comment = '';
    this.response = {
      status: '',
      message: ''
    };
  }

  @action
  setResponse(status, message) {
    this.response.status = status;
    this.response.message = message;
  }

  @action
  setUserName(userName) {
    this.userName = userName;
  }

  @action
  setComment(comments) {
    this.comment = comments;
  }
}

export default FeedbackStore;
