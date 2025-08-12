Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B125C706
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755004191; cv=none; b=t7nicfz2KXWsWO6Zc/ZnOz4x0PZejo54nORCSqWuYaN1HBPeM7jWHRTOBAyMWWjzfhf8Ye8L1sgPVy+AQehlg1s3Oa5CLzQa6N9AY+tdXVNl/2/cNpZBMra79d0f1fV54+py1cGc8qd1XsE91Hmh8arYvJU/r3Sde1NKyMI/vCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755004191; c=relaxed/simple;
	bh=H2kUbyZmueOz45xzGfE8A8+RM7sa09kDey8Eu1tb0tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EveHK7rx6rs19n7bRNLKNoQ/kEyY/3rsED/PifdZnQx7GBFXYIBfJ2pLBGqNQI/qtX8e7hZruRhoGiSOplNzaz6rHSI7ynHcTPzK+XxUIlr2vbfnRmN7kMgcZuTCiocMZdECBJvMlUU5kfHS3zFpRHv4elzF0b+oSCiZCu97hh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/ZsXW52; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/ZsXW52"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3e54f38a595so9075695ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755004188; x=1755608988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCTldDZR7k6dRE1AzEZefc9AHLCcWRZn215S8tzP9HE=;
        b=T/ZsXW523qZ7Ug8SNIhtO5TZMrm9WphFcNuXYLIwz9IxeDW1InUo1OXd1xcQZAhKCX
         Dqf1qlAzxRN+dP8/0HjKdSoT92FNfIzuBBvmg0up/YGdsRU9jirMxBDEDVNLUALL/jD2
         lpaQd/UFDNfVxxsTMbpKU2SvoMUZvoDNyAt6c9zzd+ZkNIkkhCF0EPnn3hFQO/gBxPL4
         csFBCwmR8q/nK65VFl2M+29rj34r2azeogK/+vFyTmjH2I3oC3uXLW47Zgi9f4jP8is4
         kQ2if+iOvZ5QTOUGQagvX72f0JrMHlLkSaGF5Rq618Y/qBroQIEGpF7uJRcRjSYY3Xsx
         KUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755004188; x=1755608988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCTldDZR7k6dRE1AzEZefc9AHLCcWRZn215S8tzP9HE=;
        b=PJ1KQvnVZqGs1w2XwDFn6XS1z1+sL08maTmO42erwNnUAfkQFPJMnZiJFynhLjypqp
         cPQvRzNNEhIzowLZstB6moxGbDaoUfstFteLVjWDHUDM2BzTz55FTKMaOAJ7JRH8s1yb
         VeevN1Dc90Z2ojuOuJZKNNqwdWVXxI4XufJvIGi+QSdcsAu2z1l8yS7JBvG1SQGHnRj+
         Y28QOkoB78Ic+ZovA+CMMMx1I9uc+IQnCKZt/WQWJPuVrvbqWI3m1EOL5IvX8d6lYGjF
         XDn38tA55pzBgbLR1faUdFv9oJsCbmDJwuqyoDRCMjaZ+AVUSq3oM3qu6PLMAsceQaot
         un/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0XFWRtGrbNjT04tk3DLMB4NmZKfsmbVMj6coH4jbTFEmx3/4sSX2nf1CPDyg6wP15j8bhWGe0BoDrx46Tg14pV4ii3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRQ5PDbS2BVE3sxrZnJfdS1tUuSRsU4Akpe/c8BG5HqtxlA/Vo
	DYH6uba/DGAPOAZlMr5laKvk2ZqUf4Qi/b4ggrLQACXrSyqyrfyH+n03h7X7B3fov8cY5tcR5v3
	rnmJ+wAGWNn9oYY95aRHupGf4TEBAkxI=
X-Gm-Gg: ASbGncsCscDpH1VNRT162h3uJnqmT20aKjF5IHTH4JxcLDl64PBHL5WSjynWimO8UX0
	Ye3ITBVMLLXJA+fJDm0b5HpgybWVbjl9TYnozN4cLevdazBWWPCSAo+DPUAsOy0aKyV/2KfI105
	aOEwJLzR0wLadgHSUYyeZAgVWRy8eRXvYx4E5EQceESuF6CWj2hcRAlyzjpInvhZ6xiS+XUh3kj
	tbJoA==
X-Google-Smtp-Source: AGHT+IEyiNUXbvVqwYVbrRdb/7n8DO7e27n4xYqX8r0AVGzm55ZY/0DlFUByK5lcwmnjkEh0lGGKbzjd+RO/Kf2vkXY=
X-Received: by 2002:a05:6e02:1565:b0:3e5:42ec:137a with SMTP id
 e9e14a558f8ab-3e55af2b456mr54984915ab.4.1755004188435; Tue, 12 Aug 2025
 06:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812101119.2506-1-rk0006818@gmail.com> <aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com>
 <CAKY2RyZX9D6J08S78zT97cHS3dJ7Cf0xURX7EougPmh-rMSMGQ@mail.gmail.com>
In-Reply-To: <CAKY2RyZX9D6J08S78zT97cHS3dJ7Cf0xURX7EougPmh-rMSMGQ@mail.gmail.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 12 Aug 2025 18:39:35 +0530
X-Gm-Features: Ac12FXyHXw4dWp3GJOGwX8qm21Fcd3McvMhOactXfaVPp-awu1HoiIo1XP-izQ4
Message-ID: <CAKY2Ryac_jwvHVXNmPKrNEdQa9CcjM=1aLEDWyRbspgp0bZK-g@mail.gmail.com>
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review and feedback, Liviu.
I will follow this for my future patches.

Regards,
Rahul


On Tue, Aug 12, 2025 at 5:50=E2=80=AFPM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Thanks for the review and feedback, Liviu.
> I will follow this for my future patches.
>
> Regards,
> Rahul
>
> On Tue, Aug 12, 2025 at 4:42=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com>=
 wrote:
>>
>> On Tue, Aug 12, 2025 at 03:41:19PM +0530, Rahul Kumar wrote:
>> > Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO(=
)
>> > calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
>> > corresponding drm_err(), drm_warn(), and drm_info() helpers.
>> >
>> > The new drm_*() logging functions take a struct drm_device * as the
>> > first argument. This allows the DRM core to prefix log messages with
>> > the specific DRM device name and instance, which is essential for
>> > distinguishing logs when multiple GPUs or display controllers are pres=
ent.
>> >
>> > This change aligns komeda with the DRM TODO item: "Convert logging to
>> > drm_* functions with drm_device parameter".
>> >
>> > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
>>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>>
>> For future patches, when you make changes, please generate them with
>>
>> git patch -v<version>
>>
>> and include a change log so that reviewers can quickly figure out what
>> has changed between emails without having to go back and forth.
>>
>> Best regards,
>> Liviu
>>
>> > ---
>> >  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 27 +++++++++++-------=
-
>> >  1 file changed, 16 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/driver=
s/gpu/drm/arm/display/komeda/komeda_crtc.c
>> > index 2ad33559a33a..e4cc1fb34e94 100644
>> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> > @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
>> >  static int
>> >  komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >  {
>> > +     struct drm_device *drm =3D kcrtc->base.dev;
>> >       struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
>> >       struct komeda_pipeline *master =3D kcrtc->master;
>> >       struct komeda_crtc_state *kcrtc_st =3D to_kcrtc_st(kcrtc->base.s=
tate);
>> > @@ -128,7 +129,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >
>> >       err =3D mdev->funcs->change_opmode(mdev, new_mode);
>> >       if (err) {
>> > -             DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
>> > +             drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,"=
,
>> >                         mdev->dpmode, new_mode);
>> >               goto unlock;
>> >       }
>> > @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >       if (new_mode !=3D KOMEDA_MODE_DUAL_DISP) {
>> >               err =3D clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kc=
rtc_st));
>> >               if (err)
>> > -                     DRM_ERROR("failed to set aclk.\n");
>> > +                     drm_err(drm, "failed to set aclk.\n");
>> >               err =3D clk_prepare_enable(mdev->aclk);
>> >               if (err)
>> > -                     DRM_ERROR("failed to enable aclk.\n");
>> > +                     drm_err(drm, "failed to enable aclk.\n");
>> >       }
>> >
>> >       err =3D clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
>> >       if (err)
>> > -             DRM_ERROR("failed to set pxlclk for pipe%d\n", master->i=
d);
>> > +             drm_err(drm, "failed to set pxlclk for pipe%d\n", master=
->id);
>> >       err =3D clk_prepare_enable(master->pxlclk);
>> >       if (err)
>> > -             DRM_ERROR("failed to enable pxl clk for pipe%d.\n", mast=
er->id);
>> > +             drm_err(drm, "failed to enable pxl clk for pipe%d.\n", m=
aster->id);
>> >
>> >  unlock:
>> >       mutex_unlock(&mdev->lock);
>> > @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >  static int
>> >  komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>> >  {
>> > +     struct drm_device *drm =3D kcrtc->base.dev;
>> >       struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
>> >       struct komeda_pipeline *master =3D kcrtc->master;
>> >       u32 new_mode;
>> > @@ -180,7 +182,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>> >
>> >       err =3D mdev->funcs->change_opmode(mdev, new_mode);
>> >       if (err) {
>> > -             DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
>> > +             drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,"=
,
>> >                         mdev->dpmode, new_mode);
>> >               goto unlock;
>> >       }
>> > @@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>> >  void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>> >                             struct komeda_events *evts)
>> >  {
>> > +     struct drm_device *drm =3D kcrtc->base.dev;
>> >       struct drm_crtc *crtc =3D &kcrtc->base;
>> >       u32 events =3D evts->pipes[kcrtc->master->id];
>> >
>> > @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc  =
 *kcrtc,
>> >               if (wb_conn)
>> >                       drm_writeback_signal_completion(&wb_conn->base, =
0);
>> >               else
>> > -                     DRM_WARN("CRTC[%d]: EOW happen but no wb_connect=
or.\n",
>> > +                     drm_warn(drm, "CRTC[%d]: EOW happen but no wb_co=
nnector.\n",
>> >                                drm_crtc_index(&kcrtc->base));
>> >       }
>> >       /* will handle it together with the write back support */
>> > @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc  =
 *kcrtc,
>> >                       crtc->state->event =3D NULL;
>> >                       drm_crtc_send_vblank_event(crtc, event);
>> >               } else {
>> > -                     DRM_WARN("CRTC[%d]: FLIP happened but no pending=
 commit.\n",
>> > +                     drm_warn(drm, "CRTC[%d]: FLIP happened but no pe=
nding commit.\n",
>> >                                drm_crtc_index(&kcrtc->base));
>> >               }
>> >               spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>> > @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct ko=
meda_crtc *kcrtc,
>> >
>> >       /* wait the flip take affect.*/
>> >       if (wait_for_completion_timeout(flip_done, HZ) =3D=3D 0) {
>> > -             DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->mast=
er->id);
>> > +             drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->m=
aster->id);
>> >               if (!input_flip_done) {
>> >                       unsigned long flags;
>> >
>> > @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_fun=
cs =3D {
>> >  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>> >                          struct komeda_dev *mdev)
>> >  {
>> > +     struct drm_device *drm =3D &kms->base;
>> >       struct komeda_crtc *crtc;
>> >       struct komeda_pipeline *master;
>> >       char str[16];
>> > @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *=
kms,
>> >               else
>> >                       sprintf(str, "None");
>> >
>> > -             DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
>> > +             drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
>> >                        kms->n_crtcs, master->id, str);
>> >
>> >               kms->n_crtcs++;
>> > @@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev=
,
>> >                               struct komeda_pipeline *pipe,
>> >                               struct drm_encoder *encoder)
>> >  {
>> > +     struct drm_device *drm =3D encoder->dev;
>> >       struct drm_bridge *bridge;
>> >       int err;
>> >
>> > @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev=
,
>> >
>> >       err =3D drm_bridge_attach(encoder, bridge, NULL, 0);
>> >       if (err)
>> > -             dev_err(dev, "bridge_attach() failed for pipe: %s\n",
>> > +             drm_err(drm, "bridge_attach() failed for pipe: %s\n",
>> >                       of_node_full_name(pipe->of_node));
>> >
>> >       return err;
>> > --
>> > 2.43.0
>> >
>>
>> --
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> | I would like to |
>> | fix the world,  |
>> | but they're not |
>> | giving me the   |
>>  \ source code!  /
>>   ---------------
>>     =C2=AF\_(=E3=83=84)_/=C2=AF
