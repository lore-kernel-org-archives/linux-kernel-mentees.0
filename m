Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CB6189F43
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Mar 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258614; cv=none; b=L1dCEnf9oKDVVPZw3MinRxkbDKCdc92fvCoscpx6RJTuEvxUbIqAUxMY9LEEzwRfmVuMRglAwBq9F08epyKZxkj3vkz26RYsUCRKD1X7K/n0sbE43uiZ0AoYhh4SsS5YR0MpuFlWlZBrvSsDaZu21JJcfZKKcb/qiAOxXX0peg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258614; c=relaxed/simple;
	bh=w0oCwzhaxAnRCzRQ9/YRYIOxKZmZRzvgSTK++PeHVpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbM3XYj6K+Ti6bJY0PdaQeN1Rjhst36wBY95ujmczwyDxV4mWKj5aOwR7nd0uyyZ+Vkmpx57LL11RWdM2Znzya5szCphPN57OdqKuoPVKP2Pwwu8f9FPV3OA7U6V7J2fmW4Er/zZ4sNoy6KaS0NR/L3MenEZQYFumjvlo42y1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjO/GUJm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjO/GUJm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so4140255a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Mar 2025 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743258613; x=1743863413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xQzPizb+4q7++3drew8nzj42HkGLzBNjvrLjUAd15k=;
        b=LjO/GUJmDbBqH6UqBlh9OQv3Uu+EZux4JRe3J0CLbz/Q/FfmdAsfbwHHMX12ndpHhd
         CxvOzEv57FevSmZSsezJAnxGsKFOmdCd2NePH447FkTNgZgI8Wh0gNHEHP+23h66iPXl
         LwwJYdzacHDrpjuqi1jH57iTpuX6EbMM6BGm1C3xLTjQsn5fdehc/K3gtr1emXE5Keu+
         Znr0dMzuipxye1QbbXDrCHsXr17+whqNs2RmuvN+YY+rs51iA6rrcqsiKxO09GFOi6BN
         cqatRGXQqldHHcO/9ZsakQlyjq01S6W8h5/3qXTRUDeSQgRTey8vwU9LOz3Yws4Y012l
         U8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743258613; x=1743863413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xQzPizb+4q7++3drew8nzj42HkGLzBNjvrLjUAd15k=;
        b=ARuC/2jUIqxiQR4QwNJi65kksYswtPzJHoNsf3RTGfIXoKllWGBIX5FEEWM5ChdG/G
         XLxScBombtr5uEDwEDtNAXhuMujNr/KcaTwnjf0cmTd+fQ9kl5QWv9nx2ZOMP8v8/nVy
         3mNuyXn9e7rpeak9N5zL4GkBKOaJK8ZhejTinfgva7tIc40p1AYJRw1TUTdkm99OEH+e
         fyHigiqAcsE7biVS3d3oB5dLMLqGv0ig8eQgnM+anxCGLPxa+z2FF8Om1AUqeoFbtdF6
         /fdppHl6U/hgcOsPvZ6E/qR3OL/CjLud8vmOeDIID5b8MEcxap11PnRB6CfiDzmAkO1a
         lhPg==
X-Forwarded-Encrypted: i=1; AJvYcCUIlojq1UDzxx1IqEDSbHqZjvRiM7z1ypkOTnuWOrHlvgA8dusKYO3GF60achoPf+tmSELbBkXe6qd46mJj/+R6JjW2YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIixngzJjWWtI7IAry6tF5MWr6L86DZ51DQBc7fKKSl4yp6+oa
	Wxe8YJh2Q7Eyy8fxEtCjbQ6sibOcd945cQjyLZkArYc5ZMIv/z3K7uyt5QD0b0jTy50na1yWIq8
	y6ZNYxd9/xjbUN5+oGzqo2NUrAEs=
X-Gm-Gg: ASbGncsAxvrep3jg3ZkjMvFynVQP/7vb4G100t+yhum5T9Ys8Y4VI3rTcxDJKQZTgdY
	pYG+1XBCIHwvJBx088UwYQJhqh9aUwY3gwiqgrhiPqqIHolzchh6EUS4kCpWGlOf/H2TTa+w25a
	Wrnm1MhKU2VZzMbzsNTR3LS2C2gfm/o3f9ChUUCw==
X-Google-Smtp-Source: AGHT+IEZeGNvIgGgECDw9rUtEaQ1M5ojjZ6MTiTNno3W2R5+/BaqqCGv4o8c/FIay7eczCuG3dQAzb8XomY0bhRqn6A=
X-Received: by 2002:a17:90b:2801:b0:305:2d27:7ba5 with SMTP id
 98e67ed59e1d1-30531f7bf94mr4126927a91.6.1743258612675; Sat, 29 Mar 2025
 07:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317183349.346399-1-bharadwaj.raju777@gmail.com> <2025031721511050987ca2@mail.local>
In-Reply-To: <2025031721511050987ca2@mail.local>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Sat, 29 Mar 2025 19:59:46 +0530
X-Gm-Features: AQ5f1Jrz_QSXKF34LaUrfOrHihalyXOcyYry5aS2gclqre26Jed_H26IChjSkAk
Message-ID: <CAPZ5DTHKSzg6UV0bT5U9Xet7jL1c__n+GgfYz-38GybGzerYNQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: fix use of uninit struct in rtc_read_alarm_internal
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 3:21=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 18/03/2025 00:03:43+0530, Bharadwaj Raju wrote:
> > The trace call invokes rtc_tm_to_time64 on a
> > potentially uninitialized alarm->time. Move the
> > trace call to the path where we do successfully
> > initialize and read that struct.
> >
> > This fixes a KMSAN warning.
> >
> > Fixes: 29a1f599c0cc ("rtc: Add tracepoints for RTC system")
> >
> > Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
> > ---
> >  drivers/rtc/interface.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> > index aaf76406cd7d..82ba33bf478b 100644
> > --- a/drivers/rtc/interface.c
> > +++ b/drivers/rtc/interface.c
> > @@ -201,11 +201,12 @@ static int rtc_read_alarm_internal(struct rtc_dev=
ice *rtc,
> >               alarm->time.tm_yday =3D -1;
> >               alarm->time.tm_isdst =3D -1;
> >               err =3D rtc->ops->read_alarm(rtc->dev.parent, alarm);
> > +             if (!err)
> > +                     trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->tim=
e), err);
> >       }
> >
> >       mutex_unlock(&rtc->ops_lock);
> >
> > -     trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
>
> This removes the tracepoint when there is an error, rendering it les
> useful.
>
> Also, as discussed about a year ago, alarm-time being uninitialized is
> not actually an issue as mktime64 can handle whatever is the input so
> this will never cause any problem so this isn't really a fix.
>
> I suggest the following:

Thanks for reviewing. Would you like me to make a second version of
the patch with this suggestion?
