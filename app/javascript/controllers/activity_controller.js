import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ActivityReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    static targets = ['content', 'verb', 'topic'];
    clearInput() {
        this.contentTarget.value = '';
        if(this.hasVerbTarget) {
            this.verbTarget.value = '';
        }
        if(this.hasTopicTarget) {
            // window.location = '/topics/'+this.topicTarget.value
        }

    }
  /* Reflex specific lifecycle methods.
   * Use methods similar to this example to handle lifecycle concerns for a specific Reflex method.
   * Using the lifecycle is optional, so feel free to delete these stubs if you don't need them.
   *
   * Example:
   *
   *   <a href="#" data-reflex="ActivityReflex#example">Example</a>
   *
   * Arguments:
   *
   *   element - the element that triggered the reflex
   *             may be different than the Stimulus controller's this.element
   *
   *   reflex - the name of the reflex e.g. "ActivityReflex#example"
   *
   *   error - error message from the server
   */

  // beforeUpdate(element, reflex) {
  //  element.innerText = 'Updating...'
  // }

  // updateSuccess(element, reflex) {
  //   element.innerText = 'Updated Successfully.'
  // }

  // updateError(element, reflex, error) {
  //   console.error('updateError', error);
  //   element.innerText = 'Update Failed!'
  // }
}
