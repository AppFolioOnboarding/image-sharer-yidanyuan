import { post } from '../utils/helper';

export class PostFeedbackService {
  constructor(store, params) {
    this.store = store;
    this.params = params;
  }

  postFeedback = () => post('/api/feedbacks', this.params)
    .then((d) => {
      this.setFlashMessage('success', 'comment successfully saved!');
    })

    .catch((e) => {
      const errorField = Object.keys(e.data.error);
      const errorMsg = `${errorField.join(' and ')} ${e.data.error[errorField[0]]}`;
      this.setFlashMessage('danger', errorMsg);
    });

  setFlashMessage(status, msg) {
    this.store.setResponse(status, msg);
  }
}

export default PostFeedbackService;
