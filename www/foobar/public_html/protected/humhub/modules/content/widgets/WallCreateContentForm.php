<?php

/**
 * @link https://www.humhub.org/
 * @copyright Copyright (c) 2015 HumHub GmbH & Co. KG
 * @license https://www.humhub.com/licences
 */

namespace humhub\modules\content\widgets;

use humhub\modules\content\permissions\CreatePublicContent;
use humhub\modules\stream\actions\StreamEntryResponse;
use humhub\modules\topic\models\Topic;
use humhub\modules\ui\form\widgets\ActiveForm;
use Yii;
use yii\web\HttpException;
use humhub\components\Widget;
use humhub\modules\user\models\User;
use humhub\modules\space\models\Space;
use humhub\modules\content\models\Content;
use humhub\modules\content\components\ContentContainerActiveRecord;
use humhub\modules\content\components\ContentActiveRecord;
use humhub\modules\file\handler\FileHandlerCollection;

/**
 * WallCreateContentForm is the base widget to create  "quick" create content forms above Stream/Wall.
 *
 * @author luke
 */
class WallCreateContentForm extends Widget
{

    /**
     * @var string form submit route/url (required)
     */
    public $submitUrl;

    /**
     * @var string submit button text
     */
    public $submitButtonText;

    /**
     * @var ContentContainerActiveRecord this content will belong to
     */
    public $contentContainer;

    /**
     * @var string form implementation
     */
    protected $form = "";

    /**
     * @inheritdoc
     */
    public function init()
    {
        if ($this->submitButtonText == "")
            $this->submitButtonText = Yii::t('ContentModule.base', 'Submit');

        if ($this->contentContainer == null || !$this->contentContainer instanceof ContentContainerActiveRecord) {
            throw new HttpException(500, "No Content Container given!");
        }

        return parent::init();
    }

    /**
     * Returns the custom form implementation.
     *
     * @return string
     */
    public function renderForm()
    {
        return '';
    }

    /**
     * Returns the custom form implementation.
     *
     * @param ActiveForm $form
     * @return string
     */
    public function renderActiveForm(ActiveForm $form): string
    {
        return $this->renderForm();
    }

    /**
     * @inheritdoc
     */
    public function run()
    {
        if ($this->contentContainer->visibility !== Space::VISIBILITY_NONE && $this->contentContainer->can(CreatePublicContent::class)) {
            $defaultVisibility = $this->contentContainer->getDefaultContentVisibility();
            $canSwitchVisibility = true;
        } else {
            $defaultVisibility = Content::VISIBILITY_PRIVATE;
            $canSwitchVisibility = false;
        }

        return $this->render('@humhub/modules/content/widgets/views/wallCreateContentForm', [
                    'wallCreateContentForm' => $this,
                    'contentContainer' => $this->contentContainer,
                    'submitUrl' => $this->contentContainer->createUrl($this->submitUrl),
                    'submitButtonText' => $this->submitButtonText,
                    'defaultVisibility' => $defaultVisibility,
                    'canSwitchVisibility' => $canSwitchVisibility,
                    'fileHandlers' => FileHandlerCollection::getByType([FileHandlerCollection::TYPE_IMPORT, FileHandlerCollection::TYPE_CREATE]),
        ]);
    }

    /**
     * Creates the given ContentActiveRecord based on given submitted form information.
     *
     * - Automatically assigns ContentContainer
     * - Access Check
     * - User Notification / File Uploads
     * - Reloads Wall after successfull creation or returns error json
     *
     * [See guide section](guide:dev-module-stream.md#CreateContentForm)
     *
     * @param ContentActiveRecord $record
     * @return array json
     */
    public static function create(ContentActiveRecord $record, ContentContainerActiveRecord $contentContainer = null)
    {
        Yii::$app->response->format = 'json';

        $visibility = Yii::$app->request->post('visibility', Content::VISIBILITY_PRIVATE);
        if ($visibility == Content::VISIBILITY_PUBLIC && !$contentContainer->can(CreatePublicContent::class)) {
            $visibility = Content::VISIBILITY_PRIVATE;
        }

        $record->content->visibility = $visibility;
        $record->content->container = $contentContainer;

        // Handle Notify User Features of ContentFormWidget
        // ToDo: Check permissions of user guids
        $userGuids = Yii::$app->request->post('notifyUserInput');
        if (!empty($userGuids)) {
            foreach ($userGuids as $guid) {
                $user = User::findOne(['guid' => trim($guid)]);
                if ($user) {
                    $record->content->notifyUsersOfNewContent[] = $user;
                }
            }
        }

        if ($record->save()) {
            $topics = Yii::$app->request->post('postTopicInput');
            if(!empty($topics)) {
                Topic::attach($record->content, $topics);
            }

            $record->fileManager->attach(Yii::$app->request->post('fileList'));
            return StreamEntryResponse::getAsArray($record->content);
        }

        return ['errors' => $record->getErrors()];
    }

}
