Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434312ECD37
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754997166; cv=none; b=klQknj0sjg+j7o54zOrO5DgHb+gLUxG19sBrc87bJbc35N6UHN9eHzyr3EEO4o06g5IoahnDKoJtx74XM0GelO5O3TKthuEFnl45uvvoXeUvU0nuysJ0K68wAXMxej7zG3IuFY69Dc5sc2L4TqI1hGZI4JMCBBat1uwRgPeUws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754997166; c=relaxed/simple;
	bh=h9grR5wNq7vSsNhyWI964PPq2sKRTwXkKnK7shMCfxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl/s365a5RxbogACb9mvvt+JQX+nm4OSFGkqbXSorcokzJUTOPpTKjPYWMavvvCBfNjiwaTNuLT9hlT0euM6n1wkVxT9/ggiBgXBUewsYVx6SP3PDfZZ4riDhYPnQ2N9S9+jo77LGrBYGeOfHI9MbPszNYZtnj+Zp7fvw6rZ4zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A3BC2934
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 04:12:36 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62ABC3F63F
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 04:12:44 -0700 (PDT)
Date: Tue, 12 Aug 2025 12:12:34 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
Message-ID: <aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com>
References: <20250812101119.2506-1-rk0006818@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812101119.2506-1-rk0006818@gmail.com>

On Tue, Aug 12, 2025 at 03:41:19PM +0530, Rahul Kumar wrote:
> Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
> calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
> 
> The new drm_*() logging functions take a struct drm_device * as the
> first argument. This allows the DRM core to prefix log messages with
> the specific DRM device name and instance, which is essential for
> distinguishing logs when multiple GPUs or display controllers are present.
> 
> This change aligns komeda with the DRM TODO item: "Convert logging to
> drm_* functions with drm_device parameter".
> 
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

For future patches, when you make changes, please generate them with

git patch -v<version>

and include a change log so that reviewers can quickly figure out what
has changed between emails without having to go back and forth.

Best regards,
Liviu

> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 27 +++++++++++--------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 2ad33559a33a..e4cc1fb34e94 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
>  static int
>  komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  {
> +	struct drm_device *drm = kcrtc->base.dev;
>  	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
>  	struct komeda_pipeline *master = kcrtc->master;
>  	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(kcrtc->base.state);
> @@ -128,7 +129,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  
>  	err = mdev->funcs->change_opmode(mdev, new_mode);
>  	if (err) {
> -		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> +		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
>  			  mdev->dpmode, new_mode);
>  		goto unlock;
>  	}
> @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  	if (new_mode != KOMEDA_MODE_DUAL_DISP) {
>  		err = clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kcrtc_st));
>  		if (err)
> -			DRM_ERROR("failed to set aclk.\n");
> +			drm_err(drm, "failed to set aclk.\n");
>  		err = clk_prepare_enable(mdev->aclk);
>  		if (err)
> -			DRM_ERROR("failed to enable aclk.\n");
> +			drm_err(drm, "failed to enable aclk.\n");
>  	}
>  
>  	err = clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
>  	if (err)
> -		DRM_ERROR("failed to set pxlclk for pipe%d\n", master->id);
> +		drm_err(drm, "failed to set pxlclk for pipe%d\n", master->id);
>  	err = clk_prepare_enable(master->pxlclk);
>  	if (err)
> -		DRM_ERROR("failed to enable pxl clk for pipe%d.\n", master->id);
> +		drm_err(drm, "failed to enable pxl clk for pipe%d.\n", master->id);
>  
>  unlock:
>  	mutex_unlock(&mdev->lock);
> @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  static int
>  komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  {
> +	struct drm_device *drm = kcrtc->base.dev;
>  	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
>  	struct komeda_pipeline *master = kcrtc->master;
>  	u32 new_mode;
> @@ -180,7 +182,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  
>  	err = mdev->funcs->change_opmode(mdev, new_mode);
>  	if (err) {
> -		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> +		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
>  			  mdev->dpmode, new_mode);
>  		goto unlock;
>  	}
> @@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>  			      struct komeda_events *evts)
>  {
> +	struct drm_device *drm = kcrtc->base.dev;
>  	struct drm_crtc *crtc = &kcrtc->base;
>  	u32 events = evts->pipes[kcrtc->master->id];
>  
> @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>  		if (wb_conn)
>  			drm_writeback_signal_completion(&wb_conn->base, 0);
>  		else
> -			DRM_WARN("CRTC[%d]: EOW happen but no wb_connector.\n",
> +			drm_warn(drm, "CRTC[%d]: EOW happen but no wb_connector.\n",
>  				 drm_crtc_index(&kcrtc->base));
>  	}
>  	/* will handle it together with the write back support */
> @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>  			crtc->state->event = NULL;
>  			drm_crtc_send_vblank_event(crtc, event);
>  		} else {
> -			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
> +			drm_warn(drm, "CRTC[%d]: FLIP happened but no pending commit.\n",
>  				 drm_crtc_index(&kcrtc->base));
>  		}
>  		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
>  
>  	/* wait the flip take affect.*/
>  	if (wait_for_completion_timeout(flip_done, HZ) == 0) {
> -		DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->master->id);
> +		drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->master->id);
>  		if (!input_flip_done) {
>  			unsigned long flags;
>  
> @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_funcs = {
>  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>  			   struct komeda_dev *mdev)
>  {
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_crtc *crtc;
>  	struct komeda_pipeline *master;
>  	char str[16];
> @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>  		else
>  			sprintf(str, "None");
>  
> -		DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
> +		drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
>  			 kms->n_crtcs, master->id, str);
>  
>  		kms->n_crtcs++;
> @@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev,
>  				struct komeda_pipeline *pipe,
>  				struct drm_encoder *encoder)
>  {
> +	struct drm_device *drm = encoder->dev;
>  	struct drm_bridge *bridge;
>  	int err;
>  
> @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
>  
>  	err = drm_bridge_attach(encoder, bridge, NULL, 0);
>  	if (err)
> -		dev_err(dev, "bridge_attach() failed for pipe: %s\n",
> +		drm_err(drm, "bridge_attach() failed for pipe: %s\n",
>  			of_node_full_name(pipe->of_node));
>  
>  	return err;
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
