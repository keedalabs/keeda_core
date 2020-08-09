import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ActivityReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    static targets = ['content', 'heading', 'verb', 'topic','field', 'latitude', 'longitude', 'starttime', 'endtime', 'map'];
    connect() {
        console.log('connnected to new event controller')
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
        if(this.hasStarttimeTarget) {
            this.starttimeTarget.classList.add("new_activity--current");
            // window.location = '/topics/'+this.topicTarget.value
        }
        if(this.hasEndtimeTarget) {
            this.endtimeTarget.classList.add("new_activity--current");
            // window.location = '/topics/'+this.topicTarget.value
        }
        if(this.hasFieldTarget) {
            this.fieldTarget.classList.add("new_activity--current");
            // window.location = '/topics/'+this.topicTarget.value
        }
        if(this.hasLatitudeTarget) {
            this.latitudeTarget.classList.add("new_activity--current");
            // window.location = '/topics/'+this.topicTarget.value
        }
        if(this.hasLongitudeTarget) {
            this.longitudeTarget.classList.add("new_activity--current");
            // window.location = '/topics/'+this.topicTarget.value
        }
        if(this.hasMapTarget) {
            this.mapTarget.classList.add("new_activity--current");
            // window.location = '/topics/'+this.topicTarget.value
        }

    }
}
