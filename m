Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22B1A7AF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726003380; cv=none; b=B+JOqfp+oSVPpFjticwD5zCKmlRNiIwR+mpx1a5sNCc5vx9rXR5HZSwn7+m3braSCoBBKmXswUEv7bn/vWjXCM4zKtbtYLqD1BBAOkoWyXXTIMk7q8nsJF7Y4TfJwk59H7ovdTgLS1R/oUduKVgZp96ZKDogE7YmOXcPRgVTbyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726003380; c=relaxed/simple;
	bh=J9E4Pbp83r9l9JyhG1IiSk1/8H53dwAA+eo6UPCOQyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQVgXUPPMw1HYtdkdfSBfrQzBoz45HRutzk3nIEUFw8Gn2Jsry2YX6+ikDTO89qIBbfMrlzMRHQE9oZbgpsnBcn8nKOb/H7wqZXtNF4m6jIrW0EdDYSHM7lyC1EZ1PHt1IQOguol/AlzCDq4KYpxPvQEbs90KrpErbSBBB350Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HQ1jpWiY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HQ1jpWiY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE06840247
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 21:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_Yg0Rj5Lwzb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Sep 2024 21:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B52D40231
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B52D40231
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HQ1jpWiY
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6B52D40231
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 21:22:57 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6c353f2f954so43323556d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726003375; x=1726608175; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzSu/kXOj+AyNMyap+JZaf4+i0lOR352iz38kAetQog=;
        b=HQ1jpWiY7L0MOGBgo7ajfT2yIxoP5Xu6y1esXpuXu3I9CNZxMRzDv8w+sznk9K0gH+
         ftGbpfvbzDHF64Tm1/f5KHjL7K/4Bgs74cXF6e5e/7w6FxOV9MB9oRlPfm3KcH30PVKf
         cooX4gtC5+hemv/w2HoYfz+LIB48pGv4MX6EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726003375; x=1726608175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzSu/kXOj+AyNMyap+JZaf4+i0lOR352iz38kAetQog=;
        b=Xnn4bc32lcZu+N5eZwmMThG6kZv1A+G9YtMm4ei7U508RHvnJGRi+DpvgJGoeRzH7d
         pEErjcyeNZb2JAqVxm108n5Vw28Y1iMOvTLYk+RZQ4i6jjbpIXqTDfKUBBldriLVT+I7
         R7FExYghoHKbCkAZcm+23nRFKRTbHL9A/pqKLgEU8CWg/Zbzt6aIvczZ308zTT599OYH
         6aKFIy7E4Lk+RafYWaOS18g+L57j+fi8U7WMlS/IaSvn833yw55n1BZVKmKgsLl1aggN
         oRabOXPI+k4yAK1HS2Y6Gz4XiLQKddWYLj4rjNrZZxQz0wv0jD4XY47ctz7/eWQt2Omp
         cXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUucCR8W2yIO5Ceud8X83h5pCVv7L+c6IZjndPAdAyCrRGsh3jZ2yhZJ+jdANa3SaGxTlbd8h9AvtMMMxBu3I1YYHLYKQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxvUXIWJxxu+ctzyuisV3urajQDyVpQutLOJnyE4JcbP3l1jFAb
	RcE1+eRHF1A/hfOizCzJl+rmO2aV8YHSZPwaeDQsrRRihfRVcghMNAhwU1UyWvdjI2tOjFZHFyM
	=
X-Google-Smtp-Source: AGHT+IHMWQ5VIz26BWb8vZcxqCYPGJoDZuffNp7mZkskf3CZmYUh8ryeyibsJZQe2g8n0mTQi1LX7w==
X-Received: by 2002:a0c:c692:0:b0:6c5:52cc:6070 with SMTP id 6a1803df08f44-6c552cc61a5mr68892106d6.39.1726003375204;
        Tue, 10 Sep 2024 14:22:55 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5343471b8sm33738786d6.66.2024.09.10.14.22.54
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 14:22:54 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6c35357cdacso37590576d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 14:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUsSO1mbsIX+y2FYBn5WFUggtn7epk/zk9BzRWcTfdBa6AelKQngo4/jHItEV1/6Z7JVfMTmGsYRdURRPfFkZrcdgFpQ==@lists.linuxfoundation.org
X-Received: by 2002:a05:6214:390e:b0:6c5:1f05:dcec with SMTP id
 6a1803df08f44-6c52851dadamr250755766d6.49.1726003373788; Tue, 10 Sep 2024
 14:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903173130.41784-1-abhishektamboli9@gmail.com>
In-Reply-To: <20240903173130.41784-1-abhishektamboli9@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 14:22:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>
Message-ID: <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi functions
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 3, 2024 at 10:32=E2=80=AFAM Abhishek Tamboli
<abhishektamboli9@gmail.com> wrote:
>
> Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
> sequences. The previous mipi_dsi_dcs_write_seq() macros were
> non-intuitive and use other wrapped MIPI DSI functions in the
> driver code to simplify the code pattern.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@i=
ntel.com/

You'd only include the above two tags if the original problematic
commit had actually landed. Since it didn't you leave them off and the
Robot gets no credit (even though it is awesome).


> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Update the commit message to explain the reason for the change.
> - Correct the code by changing 'dsi->mode_flags' to 'dsi_ctx.dsi->mode_fl=
ags'
> This change addresses a build error in v1 reported by kernel test robot
> caused by using an undeclared variable 'dsi'.
> [v1] : https://lore.kernel.org/all/20240902170153.34512-1-abhishektamboli=
9@gmail.com/
>
>  drivers/gpu/drm/panel/panel-himax-hx83112a.c | 140 ++++++++-----------
>  1 file changed, 60 insertions(+), 80 deletions(-)

Just adding a note that there's nearly the same patch in
https://lore.kernel.org/r/20240904141521.554451-1-tejasvipin76@gmail.com
and we're discussing what to do about it there.

-Doug
