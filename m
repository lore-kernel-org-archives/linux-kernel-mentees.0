Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69B02C1A2
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680698; cv=none; b=XTsjx7MO1W/RWWGxZ88VOniyHHIFIVD6XyBJNZzXV41y+vDAuryMmAJebkGOFieteFN4J79JbNLN3YWPT+G3SPhGisD2rkhIbjHWietbFZfDPQ9zJtPRlEKSfERLHyswyCvm7BT31yz8yT0J67rhyGPOubmeKI7ODAcBAxCWFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680698; c=relaxed/simple;
	bh=KHuG0uBwyD85bBBOzexQzokycLa49THR+WfTgHz8N6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiwgIWpqFBys0conxBHscz3HM2TJgDWq6VdYOybsZN7mMHmTcIGBNHugc3ZC7QpPtv249QZy2Ybe1sm+3Scr1qazAAOw8p9PqF/eLt3wO/NcjJh/ndqzG846agX4Ryu7U9MM5ClLIGb3Kx/XmjQtWr6akaTBCQivxHC9whPUR0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RZruqKHn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RZruqKHn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235ea292956so64604225ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752680691; x=1753285491; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ03/tmk7tAhzukHNKvzFIC/0i1vTpRRPNMxQZoMDXk=;
        b=RZruqKHnvj8cA+5N0fUN3yWlKakCJRiMO44eWeqTz2T34Kvz1sOjhKcoWqJOPswEDD
         9ek0Tc55Cpyh21yaGSzMamFM0YhgvCRMz4cXHiEJjF3a489L6UkIIfdE8wlIp47HkXpy
         SMWg/a1eSGgadaBdwDlKgqmRLE0YMHJTCNxkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680691; x=1753285491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ03/tmk7tAhzukHNKvzFIC/0i1vTpRRPNMxQZoMDXk=;
        b=D7UpKCoK0p2gi3hUWDnE/Iro+/hELsxh574k5ur7UD21hZvAEzaWykSzOMfUcia5cB
         S5BW7UgRd7nLbr+pWe3D5g+M2YB1DmNvjd6NYE3ZdFfmVJp90MNrb15tcXJyhtV5hNBX
         4+zSLameEFCstkFmNsatA3FVmAple8oSvXXzxDy/XiM8EBxNOswlkHQdSKnq1yw3fyHC
         RC+wmGXxd3Slt6S+8Q8bXfT+89Ud+R6CSOBhty3nK+0ys46c/tsKUgezsEF4GLAoKWvn
         WBSr9KMQKzal1766AD/rGEBYp11B3M6QHMdwpElSSXEmfkdQtLwX52eYCeg9Jv1/I5a3
         qofw==
X-Forwarded-Encrypted: i=1; AJvYcCUxE+bTlpTIXoYBn3hdMBZZVgqYBBh14kaxvdVsncDkLQz3tQFz8GxLy+vAwTCeKcMnJ6tkWwgi+UyFhyVBSVT4pe7T/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNYYFF0q328o/P0tiQnk9RJRT4nd4VybEfXkyg6l1KeQeUAWn0
	nQyBVHGElmHitUcoNnzzz7ojpHMavKRz9wmqVTZiURrLgp6lYXnPHacr1H0FZCCePgzU9JHPAvE
	cCRM=
X-Gm-Gg: ASbGncuZUVQcnaVgMV++MVpWS7aTzUVqwT3pk0hqoc8bQDh+ATvFjwj7RB8ZawR7wWC
	2y6htK0PMN4AvL95COOM/B2vB9auEFP+bs4ncd5rE/YNt0MxQ3w8aKK5t1NVAnhsWHEE2z9qTpa
	T2UAGr+ii2kW12ut89UOO5xR+wtxJVdf8aBqq+SRE6VLh+myxxc+j/tnJuzAtfmL7sz1qUaQ6lJ
	B7W+8e17Z7enqTws6gRAHIGNxGjZyXYM6ZTkDoqh8scOt6/+XCDSSNeAv7nBBavJ4chqr8gymG1
	AgFdtC7GMkUG4LMeA70yYkdK1fm0Cyc2AfhaIKtnfiPWeIsoVbiwRWluDiYj62jmg3G/yIvqp4F
	z29m0akBNCU9ymnSsGrXZ66sWqtPdq9ruNSgIP+cBBsf8JJP8qeH+awLmFp0ttFLeIg==
X-Google-Smtp-Source: AGHT+IExmCxoMLUGyBbAp3Hk5eYqdYoNA7yFOO89kDCmw+//QqW34Swl+GERXhJnAtxyByvB2fF+wA==
X-Received: by 2002:a17:902:e88d:b0:234:ed31:fc96 with SMTP id d9443c01a7336-23e2572fbc3mr44696835ad.26.1752680690735;
        Wed, 16 Jul 2025 08:44:50 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e05asm127657265ad.178.2025.07.16.08.44.45
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:44:46 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31d489a76dso6205584a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 08:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4Xcm/G/25LiHRhNb2DTN7zkn4aR3bl95ThG33zKr8dyNRHqM8qreCXdBBW5fnBie1nr3k2y4o26guHO52Blx85tZ9NQ==@lists.linux.dev
X-Received: by 2002:a17:90b:2dc4:b0:311:c939:c848 with SMTP id
 98e67ed59e1d1-31c9f36e8e1mr4567738a91.0.1752680685236; Wed, 16 Jul 2025
 08:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com>
 <20250708073901.90027-2-me@brighamcampbell.com> <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
 <DBD8F7HINUHO.2487OZTDLKOWQ@brighamcampbell.com>
In-Reply-To: <DBD8F7HINUHO.2487OZTDLKOWQ@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 08:44:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFSN8rnKb4kjhKDhsHv6m+Dxak+rDzrb7VmZ=V096CQg@mail.gmail.com>
X-Gm-Features: Ac12FXzPnC4cUet5LMD_CFhCnn4SKvN-fuGdz2dppJaNkiQ_4gGl1AfqjppU-f4
Message-ID: <CAD=FV=XFSN8rnKb4kjhKDhsHv6m+Dxak+rDzrb7VmZ=V096CQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated MIPI
 function calls
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 15, 2025 at 10:32=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> On Mon Jul 14, 2025 at 3:46 PM MDT, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcam=
pbell.com> wrote:
> >>
> >> Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
> >> functions in order to facilitate improved error handling and remove th=
e
> >> panel's dependency on deprecated MIPI functions.
> >>
> >> This patch's usage of the mipi_dsi_multi_context struct is not
> >> idiomatic. Rightfully, the struct wasn't designed to cater to the need=
s
> >> of panels with multiple MIPI DSI interfaces. This panel is an oddity
> >> which requires swapping the dsi pointer between MIPI function calls in
> >> order to preserve the exact behavior implemented using the non-multi
> >> variant of the macro.
> >
> > Right. We dealt with this before with "novatek-nt36523"...
> >
> >
> >> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> >> ---
> >>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++----------=
-
> >>  1 file changed, 59 insertions(+), 101 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/g=
pu/drm/panel/panel-jdi-lpm102a188a.c
> >> index 5b5082efb282..5001bea1798f 100644
> >> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> >> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> >> @@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *pan=
el)
> >>  static int jdi_panel_unprepare(struct drm_panel *panel)
> >>  {
> >>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
> >> -       int ret;
> >> +       struct mipi_dsi_multi_context dsi_ctx;
> >>
> >> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link1);
> >> -       if (ret < 0)
> >> -               dev_err(panel->dev, "failed to set display off: %d\n",=
 ret);
> >> -
> >> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link2);
> >> -       if (ret < 0)
> >> -               dev_err(panel->dev, "failed to set display off: %d\n",=
 ret);
> >> +       dsi_ctx.dsi =3D jdi->link1;
> >> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> >> +       dsi_ctx.dsi =3D jdi->link2;
> >> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> >>
> >>         /* Specified by JDI @ 50ms, subject to change */
> >>         msleep(50);
> >
> > Needs to be mipi_dsi_msleep() to avoid the sleep in case the above
> > commands caused an error.
> >
> >
> >> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
> >> -       if (ret < 0)
> >> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n"=
, ret);
> >> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
> >> -       if (ret < 0)
> >> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n"=
, ret);
> >> +       dsi_ctx.dsi =3D jdi->link1;
> >> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> >> +       dsi_ctx.dsi =3D jdi->link2;
> >> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> >
> > I think you need this here:
> >
> > if (dsi_ctx.accum_err)
> >   return dsi_ctx.accum_err;
> >
> > ...otherwise the code will do the sleeps, GPIO calls, and regulator
> > calls even in the case of an error. You don't want that. Then at the
> > end of the function you'd just have "return 0;"
> >
> >
>
> Regarding these two suggestions, I prepared this patch with the intent
> to change the drivers actual behavior as little as possible. It looks
> like the original driver will happily msleep and try to continue
> initialization even after an error has occurred. Of course, using the
> _multi variants of mipi dbi functions kind of implies that we want to
> stop communicating with a display after an error has occurred. And
> because all _multi functions are effectively no-ops after an error has
> occurred, it doesn't make sense to perform the other half of the
> initialization sequence while anything involving mipi is dutifully
> skipped.
>
> I'll make these changes in the next patch revision.

Hmmmm. You're right that the old driver was indeed plowing forward
when it got errors. It checks them and does a printout, but then it
throws away the error code and continues executing the rest of the
functions.

Oh! ...but looking at this with fresh eyes, perhaps what the old code
was doing was more correct specifically because this is _unprepare_
and we want to power off even if there were errors. To be explicit:

1. Just because MIPI commands are failing on one link doesn't mean
that they are failing on both links.

2. Even though trying to send "enter sleep mode" after a failed
"display off" will probably fail, it doesn't seem like it would hurt
to try it.

3. You definitely still want all the GPIO / regulator calls even if
the MIP commands failed.

4. Given all the above, I guess one could argue that the sleeps should
all be executed in this case even if the MIPI commands fail.

Maybe something like this would make sense?

/*
* One context per panel since we'll continue trying to shut down
* the other panel even if one isn't responding.
*/
struct mipi_dsi_multi_context dsi_ctx1 =3D { .dsi =3D jdi->link1 };
struct mipi_dsi_multi_context dsi_ctx2 =3D { .dsi =3D jdi->link2 };

mipi_dsi_dcs_set_display_off_multi(&dsi_ctx1);
mipi_dsi_dcs_set_display_off_multi(&dsi_ctx2);

msleep(50);

/* Doesn't hurt to try sleep mode even if display off fails */
dsi_ctx1.accum_err =3D dsi_ctx2.accum_err =3D 0;
mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx1);
mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx2);

msleep(150);

...
...

/* We powered off; return no error even if MIPI cmds failed */
return 0;

What do you think? This is still a small functionality change since
the old code would have returned an error if the second
mipi_dsi_dcs_enter_sleep_mode() returned an error code, but that feels
like it was a bug. That should probably be mentioned in the commit
message.


> >>  static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
> >>                                        struct mipi_dsi_device *right,
> >>                                        const struct drm_display_mode *=
mode)
> >>  {
> >> -       int err;
> >> +       struct mipi_dsi_multi_context dsi_ctx;
> >
> > I think you should actually pass in the "dsi_ctx" to this function
> > since the caller already has one. Then you can change it to a "void"
> > function...
> >
> >
> >>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
> >>  {
> >
> > I think you want to pass the context into this function too and make
> > it "void". Then the caller doesn't need to check for the error before
> > calling it...
> >
> > Then the "msleep(150)" after calling this function can change to a
> > `mipi_dsi_msleep()` and you don't need to check the error until right
> > before the LPM flag is cleared...
> >
> >
>
> About the suggestion, "you don't need to check the error until right
> before the LPM flag is cleared...", if I change
> jdi_setup_symmetrical_split to accept a mipi_dsi_multi_context pointer,
> the driver will output "failed to set up symmetrical split" even if the
> error was encountered well before setting up the symmetrical split
> (meaning the driver doesn't even try to set up symmetrical split at all).
>
> The appropriate solution will be to either maintain the error checks in
> the driver, or remove the print statements. For the next revision, I'll
> simply go ahead and remove the error print statements because:
>   - the mipi _multi functions should handle error printing well enough
>     to facilitate tracking down the particular mipi sequence which
>     caused an error during probe/unprepare.
>   - less logic in this driver makes it easier to maintain

Right. You'd remove the "failed to set up symmetrical split" error
since all sources of the error would already be reported.


> >> +       struct mipi_dsi_multi_context dsi_ctx;
> >> +
> >>         /* Clear the manufacturer command access protection */
> >> -       mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> >> +       dsi_ctx.dsi =3D jdi->link1;
> >> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
> >>                                    MCS_CMD_ACS_PROT_OFF);
> >> -       mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> >> +       dsi_ctx.dsi =3D jdi->link2;
> >> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
> >>                                    MCS_CMD_ACS_PROT_OFF);
> >
> > All the duplication is annoying. In "novatek-nt36523" I guess we only
> > needed to send _some_ of the commands to both panels and so we ended
> > up with a macro in just that C file just for
> > mipi_dsi_dual_dcs_write_seq_multi(). ...but here you seem to be
> > needing it for lots of functions.
> >
> > Maybe the solution is to add something like this to "drm_mipi_dsi.h":
> >
> > #define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, _args...) \
> >   do { \
> >     (_ctx)->dsi =3D (_dsi1); \
> >     (_func)((_ctx), _args); \
> >     (_ctx)->dsi =3D (_dsi2); \
> >     (_func)((_ctx), _args); \
> >   } while (0)
> >
> > Then you could have statements like:
> >
> > mipi_dsi_dual(mipi_dsi_generic_write_seq_multi, jdi->link1,
> > jdi->link2, &dsi_ctx, ...);
> >
> > I _think_ that will work? I at least prototyped it up with some simple
> > test code and it seemed to work... What do others think of that?
>
> In my opinion, this change is absolutely worth making, but the creation
> of a new macro like mipi_dsi_dual in drm_mipi_dsi.h is beyond the scope
> of this patch series because it has implications for panels like
> novatek-nt36523 and others. It looks like you've already effectively
> completed the work of implementing the macro, but I'm happy to address
> the adoption of the macro in lpm102a188a and other drivers as a part of
> a later patch series. Besides, there is no more duplication in this
> driver after applying my patch than there was before.
>
> Of course, maybe that's just me being pedantic. I'm happy to include
> mipi_dsi_dual in this series if you insist.

I would prefer if you had a patch #1 introducing mipi_dsi_dual() and
then used it in patch #2. IMO there's no need for you to go back and
re-cleanup "novatek-nt36523". I think the panel you're dealing with is
the second one to have run into this issue during the "multi"
conversion and it's better to get the cleaner solution landed before
others copy.

That being said, I won't insist. You're right that the duplication
isn't any worse with your patch.

-Doug
