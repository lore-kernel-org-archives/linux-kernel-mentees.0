Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645E2E62DD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 05:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752643938; cv=none; b=jF30AS1R2EXNSZQ7B1Fw+gGJHD66Pqnma5wIU/U2NfPdgqCdleGzpqUjc/2aOmnIEBOGgxH11roFa0U0+Zvzm+D9pWgBKrGNk5TPmHSdQqrVCn0/lBIwI5+vn4e8WLVhsEuco8EB/YUnp1kTv8SV1Boy2zEHOOuGKT2RAVZZqJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752643938; c=relaxed/simple;
	bh=87KcNmcNCfKzd5C+FHrTqadt2gHiOHzdg+/afSRwOF0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dYb6s8PI0Si1XPAB0Kjuu4B9CRMvbrVi936H8BhMw5FVu37NtmVDVG9j2q79xepZmID93ia3KKczhSdZs9ip/Q+S6BVKbeM/pXZZPQKqEWlEJXdeEgY5iwfvkeEJtxBMokfMo68qj+q17JxKmP4+WAqw+Vy4EZ+g+RFeNQPGfzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=mfPDwXvS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="mfPDwXvS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7490cb9a892so3774031b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Jul 2025 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752643935; x=1753248735; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCMRUZQFGpcymBqkIe3rm+bYJxEBRs5oUHZ2hwPslEg=;
        b=mfPDwXvS2+oIeABoir0mWyxVVI8mKZPiBidSXLVzAyd/+jgjewbBbPkSwOfOKcaHcG
         pu5lY7XY7lCKQlQopNCxjQlCTS2DA9v9MUK7ANh3Td+EKqb2/jgwv66NHXP6/vT0cL+4
         Alhav27hmkpcH5XzC2nNzwSqTxdfc2CRBaS9nkQdfWitAH7roiXaEaBBDeff87EVSu+U
         UNcZovpAgPwULubZsaxB6YQBfTK1/Uqqa7c9d/WfVbUWEmFFOBsmd27WxVqcaqg+uERs
         0Ml0da6PCOMlgmC6Ftm/JMOCbWL6RsQF97kN178YcwK3QbKqA/LbTipqzOV/q3J1jtcy
         RaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752643935; x=1753248735;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCMRUZQFGpcymBqkIe3rm+bYJxEBRs5oUHZ2hwPslEg=;
        b=iwf3D50T8aP3NQQLNYJLgIyj4EYwd2swyO3+ZJ0+EENBH0R0usICgZDNsVsLM9qYYH
         mI5XH5wUQChG2LkUwFzQkHKTrgFAsMINV6keDmGGJU0YL7i2Gcy2yWkkvH6DocYk37SI
         boYBaSsSngYLz10NIMb/yLFyJj1LrO8J8oo+U56bOUcVWTmERgoby4nMbYRtD9wqitYs
         VGelpJbDb5jkdMMtgAhKhTcKlSE2JNdevkCUA2A48FhowsfTP4yqJtCRNkV6C9q3MrVn
         HF+J4n1t5hljuTQMV+Jz1cpbKMhvSQAnDy5Ss95NLtFrHWd5/ZslRoqFlKb5isFzVdEN
         /xMA==
X-Forwarded-Encrypted: i=1; AJvYcCUbGZ0mWAu8bmyqfwR7aaQ21LBZxsSCZpUixyvghda7y2n9PXWQ5+AoCB5ByLDpcFyYkSvyrVIJb6c5e6DR4aVpoRxdBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVXagxr6kvqyIScXb3XJh9SKLxTs6kGFWQJpg0DDXxg4qd5gT3
	VKRVmMInHFndShU54ytGM0qTg1WUi/ZtWk7Q4y+gOhVZ0TGV245h/9zzcxLWJ17V49s=
X-Gm-Gg: ASbGnct6OcVzIanq4VyxB2DV8PfDHzcOfVIx+JQIJbIEiWXZ4AEc4F4hlWoDh6oh8Gq
	ShVYho8yy7SQ2jW90kiztjXAKriGVqibA4IkwW9eAp0kvwpgyPRvzNK3URNOKvCkucY5wGyj4J4
	wAwta1LM1c8x6YxlFPrkVuVdLU6GPveBjxGP7w6Nf2eoEQj8G9dHJQl+KrnA56SoeGn9BmQautp
	b/Eg+4SkZmpYy5CNt+0akJxKdTrsfHaVvRHg5NV82YwC9WkLHZwO4JmEki+HDIwSQdWDDzkQw3f
	QuagNtWA0Lv4Nj3UOutTYT3fKcLfg5/mRGMKh3V590CCUV0R30Wg8v3Yz+cK7ssZ8hGIlCX7Zwv
	QgVLdceOidJHjIgicgk8=
X-Google-Smtp-Source: AGHT+IGzq1EuT7l9xYvVOR/aL8LMKVAB7h0jn6W/ldNNUwCMMtMkTDWuR5Zq3zFKgnv8U+oOw6+/dA==
X-Received: by 2002:a05:6a00:887:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-756ea8b5c61mr2671787b3a.21.1752643935242;
        Tue, 15 Jul 2025 22:32:15 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5a9fsm13908822b3a.11.2025.07.15.22.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 22:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 23:32:12 -0600
Message-Id: <DBD8F7HINUHO.2487OZTDLKOWQ@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated
 MIPI function calls
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250708073901.90027-1-me@brighamcampbell.com>
 <20250708073901.90027-2-me@brighamcampbell.com>
 <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
In-Reply-To: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>

On Mon Jul 14, 2025 at 3:46 PM MDT, Doug Anderson wrote:
> Hi,
>
> On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampb=
ell.com> wrote:
>>
>> Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
>> functions in order to facilitate improved error handling and remove the
>> panel's dependency on deprecated MIPI functions.
>>
>> This patch's usage of the mipi_dsi_multi_context struct is not
>> idiomatic. Rightfully, the struct wasn't designed to cater to the needs
>> of panels with multiple MIPI DSI interfaces. This panel is an oddity
>> which requires swapping the dsi pointer between MIPI function calls in
>> order to preserve the exact behavior implemented using the non-multi
>> variant of the macro.
>
> Right. We dealt with this before with "novatek-nt36523"...
>
>
>> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
>> ---
>>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++-----------
>>  1 file changed, 59 insertions(+), 101 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu=
/drm/panel/panel-jdi-lpm102a188a.c
>> index 5b5082efb282..5001bea1798f 100644
>> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
>> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
>> @@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *panel=
)
>>  static int jdi_panel_unprepare(struct drm_panel *panel)
>>  {
>>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
>> -       int ret;
>> +       struct mipi_dsi_multi_context dsi_ctx;
>>
>> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link1);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to set display off: %d\n", r=
et);
>> -
>> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link2);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to set display off: %d\n", r=
et);
>> +       dsi_ctx.dsi =3D jdi->link1;
>> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>> +       dsi_ctx.dsi =3D jdi->link2;
>> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>>
>>         /* Specified by JDI @ 50ms, subject to change */
>>         msleep(50);
>
> Needs to be mipi_dsi_msleep() to avoid the sleep in case the above
> commands caused an error.
>
>
>> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", =
ret);
>> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", =
ret);
>> +       dsi_ctx.dsi =3D jdi->link1;
>> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>> +       dsi_ctx.dsi =3D jdi->link2;
>> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>
> I think you need this here:
>
> if (dsi_ctx.accum_err)
>   return dsi_ctx.accum_err;
>
> ...otherwise the code will do the sleeps, GPIO calls, and regulator
> calls even in the case of an error. You don't want that. Then at the
> end of the function you'd just have "return 0;"
>
>

Regarding these two suggestions, I prepared this patch with the intent
to change the drivers actual behavior as little as possible. It looks
like the original driver will happily msleep and try to continue
initialization even after an error has occurred. Of course, using the
_multi variants of mipi dbi functions kind of implies that we want to
stop communicating with a display after an error has occurred. And
because all _multi functions are effectively no-ops after an error has
occurred, it doesn't make sense to perform the other half of the
initialization sequence while anything involving mipi is dutifully
skipped.

I'll make these changes in the next patch revision.

>>  static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>>                                        struct mipi_dsi_device *right,
>>                                        const struct drm_display_mode *mo=
de)
>>  {
>> -       int err;
>> +       struct mipi_dsi_multi_context dsi_ctx;
>
> I think you should actually pass in the "dsi_ctx" to this function
> since the caller already has one. Then you can change it to a "void"
> function...
>
>
>>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>>  {
>
> I think you want to pass the context into this function too and make
> it "void". Then the caller doesn't need to check for the error before
> calling it...
>
> Then the "msleep(150)" after calling this function can change to a
> `mipi_dsi_msleep()` and you don't need to check the error until right
> before the LPM flag is cleared...
>
>

About the suggestion, "you don't need to check the error until right
before the LPM flag is cleared...", if I change
jdi_setup_symmetrical_split to accept a mipi_dsi_multi_context pointer,
the driver will output "failed to set up symmetrical split" even if the
error was encountered well before setting up the symmetrical split
(meaning the driver doesn't even try to set up symmetrical split at all).

The appropriate solution will be to either maintain the error checks in
the driver, or remove the print statements. For the next revision, I'll
simply go ahead and remove the error print statements because:
  - the mipi _multi functions should handle error printing well enough
    to facilitate tracking down the particular mipi sequence which
    caused an error during probe/unprepare.
  - less logic in this driver makes it easier to maintain

>> +       struct mipi_dsi_multi_context dsi_ctx;
>> +
>>         /* Clear the manufacturer command access protection */
>> -       mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
>> +       dsi_ctx.dsi =3D jdi->link1;
>> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>>                                    MCS_CMD_ACS_PROT_OFF);
>> -       mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
>> +       dsi_ctx.dsi =3D jdi->link2;
>> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>>                                    MCS_CMD_ACS_PROT_OFF);
>
> All the duplication is annoying. In "novatek-nt36523" I guess we only
> needed to send _some_ of the commands to both panels and so we ended
> up with a macro in just that C file just for
> mipi_dsi_dual_dcs_write_seq_multi(). ...but here you seem to be
> needing it for lots of functions.
>
> Maybe the solution is to add something like this to "drm_mipi_dsi.h":
>
> #define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, _args...) \
>   do { \
>     (_ctx)->dsi =3D (_dsi1); \
>     (_func)((_ctx), _args); \
>     (_ctx)->dsi =3D (_dsi2); \
>     (_func)((_ctx), _args); \
>   } while (0)
>
> Then you could have statements like:
>
> mipi_dsi_dual(mipi_dsi_generic_write_seq_multi, jdi->link1,
> jdi->link2, &dsi_ctx, ...);
>
> I _think_ that will work? I at least prototyped it up with some simple
> test code and it seemed to work... What do others think of that?

In my opinion, this change is absolutely worth making, but the creation
of a new macro like mipi_dsi_dual in drm_mipi_dsi.h is beyond the scope
of this patch series because it has implications for panels like
novatek-nt36523 and others. It looks like you've already effectively
completed the work of implementing the macro, but I'm happy to address
the adoption of the macro in lpm102a188a and other drivers as a part of
a later patch series. Besides, there is no more duplication in this
driver after applying my patch than there was before.

Of course, maybe that's just me being pedantic. I'm happy to include
mipi_dsi_dual in this series if you insist.


Thanks for the thorough review,
Brigham
