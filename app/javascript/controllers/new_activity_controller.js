import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ActivityReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    static targets = ['content', 'heading', 'verb', 'topic'];
    connect() {
        console.log('connnected to new activity controller')
    }
    showWholeForm() {
        console.log("event fired")
        if (this.hasContentTarget) {
            this.contentTarget.classList.add("new_activity--current");
        }

        if (this.hasVerbTarget) {
            this.verbTarget.classList.add("new_activity--current");
        }

        if(this.hasTopicTarget) {
            this.topicTarget.classList.add("new_activity--current");
        }

    }
}
