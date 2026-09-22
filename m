Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16880175A62
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Sep 2026 20:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108028; cv=pass; b=sFHXQRhcEzayO7+BzURkaKjhUk9sVk1uy6YOAxXY1fclgBDL3A4+8XpAFB9E1MssVCeBbtCMzfQvRCHXU6MRrds3DvyY3OWt9bbN4+kbUG7qIk5WNi5gYu3y9bYU2Yie5Wla3L9eOBbyTfBGHFOk65Tb0LqPY5YhHVZoMCXhirE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108028; c=relaxed/simple;
	bh=1UA9a1hfBrb0xbFFf8Sc7ugr9w51WvMuM9aXktICUvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOXhFrvtvVEz9/3p5bu3S0b8gcExZnE7fYYMKd81wSzyoe8QsrSDUrIew4V/heSwgiqn/jmoBPioRaDYActDC+ZpCl7qSlCOrziY85fGeMCNxLAfz0RgjND15GgQOOFQOVijWnIKhTHllJMyLJhn0uMUGGkGrtQCDtXlMirWZ7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa2tX70k; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa2tX70k"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadea0so20208685a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Sep 2026 13:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790108001; cv=none;
        d=google.com; s=arc-20260327;
        b=IVdZpHDdDyI/mbBugLn64qIw0YrKai6X+O49xvxbGmIKuy1y+8C7LUhnikWcZ81HfT
         q9wFYewW4Yk0wNTbj/ml4FZyS7Dj1+YCoYTfnoMgp3ydkLiq/j6XKwJm70GJWX60MNXb
         SW4eg5ZmgM20ZUttGVfHYqqLByRZV49AL7xB+vK0dfi5EdEd/h35EFOArhSzFu36XZ7Y
         YPJsqVbZaPaGiXiBL61zstmSIy8wvYRb7dtDjLx2JR4VRXKW8LrqRjnpY/SR1x1ATXMm
         TOnCQZe6bvUEHT58HYwsRoWRIXHjNbVZ15C3KCx6cWQPkY9/lZBnWBeAqyDKcbdf0wD+
         Q95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k8LLV/hFwxGdE2PSJD1a575Lox+2W1a0UsvegnWw/g0=;
        fh=jzJfU8m82OsDwzPmwznImbx67XTuUZh51NIk2s6X1nQ=;
        b=s63vWG4k/A7YlGhMD4oqA4aBW8+QYjTT5cWLgik5TPTTwhO4BxQC+P2mMHxIQsO32H
         8ZXyZn9YYeg4N+QOmBpVnfPzEakBOWUZkmTDXO/JWTvebPG0GOc6qxwzsy8eaL1UlmOw
         TKLG6S4xmvXzt6i9U9KoRBiqLFUTP0sGw0pC0WZnzkpnm07NjFeBtRRHkvyEWexSK3eR
         ppkBFyHyUg2qEJ+1ymRbik5i9nO0UiHZtavjHPTlxhz4BT+07TIhq+n095NMVPXsb7u5
         X4bKOU/nro0ClX5oOBmZopm3GUB12aqoQLBkGkh8NoXHwE/oSM83ox3CgfrfrsQDLW8S
         KMKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790108001; x=1790712801; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8LLV/hFwxGdE2PSJD1a575Lox+2W1a0UsvegnWw/g0=;
        b=Fa2tX70k5czb6r2RDJD7msNOB11EOU7wQogcPfmIsIX4ReSiytsnlSjGJEDzZdDqeN
         5PpfWBru0SOd01QioTeCsisbMUnuMAEDGaXUT50py+sqZ9mehkaA7zNpn6p0NjEQYGXM
         uvgAGrpfX0OLBavG4LErNUZXGM4VCESM21WKFyuKR1P6MEzhcN5suzurWeGX07TEF56w
         vWUayOCkbNix0F3nEtIaYdWWva3khnso9hQWmWvEeMeHeJABopWcTCcFjDsP18DM26nB
         gNwubbJu1bVF++v2owFh5D6VsfCY+5wlruMi5drs2QZgTdkqthqXXLZVjLt6zmhlmoAS
         M/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108001; x=1790712801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k8LLV/hFwxGdE2PSJD1a575Lox+2W1a0UsvegnWw/g0=;
        b=sHLkW0ScFBcHs2msOCpNOiAaD0UnFq2QctKBDZbVoaPRJ+islpuzvcxvQ1XDNNEXev
         wDJyyKGdDmQX4ykkw64CoFguhZ8+Ig97mi9BnK2mFhDC7mD1VWvguyhSsWjdOMIzNgnV
         jLjoNnWGl9vnIoSS2poJI5e28FF1mC742uFIeYSC5vuI3lyfSM1nt9SYL4iK4cFSMPav
         wUIfWBPrbohI7xrzOqwZQN17dFQiJySXPou9xxDn+dcnRIbK2tdUhH01SY7WbVkr82Ud
         j6U6Ey3SSAUtdjK7rupw2YU0ytrrwM47j0R5tPtRENm/jOwuYacF6sDG+Nfzx2B/FAe9
         7KTg==
X-Forwarded-Encrypted: i=1; AKwUvBz4GBgcjH4jlMIJzXtQP5cMOdCfD0XLxkWPzdkZKdUIaX/jKR3+fY9qASe18M0U6uUQoupQK7Wj/VvDWbpLqslUz6yQoA==@lists.linux.dev
X-Gm-Message-State: AFuF++nu7u9nTTmiUMwU9S6iFt+67A9XQ57uXLVlGfAr2H012qbWFepT
	fdp77So1Q85DVedA28cpOW5f7N3vFRcWaty1qtOjetp9YW85/79wVJlljTmuO/xlnSnWM8I1SQx
	Y5d9/50H39HFdOVEZlYZ7cZN3tTfKqCY=
X-Gm-Gg: AYBFou0aAVFYLbMZ9Rb8rB9seUqvlOFnOiRYrRLtITOe4+JK7ZpJkQVmC2L3utf+B9H
	qdz3JJnSMsRTx1Ryb51JvdFce6oKvzm05sG74YSZWTi7d9Jux7JGtuqNRiYQo/jd7vZQQuTYfC+
	bBSvimkVVJUCZiiXGz9ZpulQ4tUJAmkIK6Cyp2QQChRfFtrOcDUZbB93plu2E41p0paF5PbQAY+
	9GBO/RrQaCnAj4G9p+GQHtwoA7P4DmV+qqrssCQcpnOG5AAmHq/p4opg6q4Np3fnnRfu6uYcA9I
	gcF5QFZeChTFuxm4FkGRDPDM9QuegBtOAt0/p5aCcYtq+P7wXbcG
X-Received: by 2002:a05:620a:808e:b0:93b:d7a2:dd2c with SMTP id
 af79cd13be357-93c251f05f6mr87457685a.60.1790108001557; Tue, 22 Sep 2026
 13:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918234339.54105-1-raghunathpalla.0209@gmail.com> <956ce83b-ef24-56f1-d70a-f7378f55cdf8@redhat.com>
In-Reply-To: <956ce83b-ef24-56f1-d70a-f7378f55cdf8@redhat.com>
From: Raghunath Palla <raghunathpalla.0209@gmail.com>
Date: Tue, 22 Sep 2026 21:13:07 +0100
X-Gm-Features: AcwNN1VD5iYZ19XInMPbyYu2owj3fTmlHfD_4JMZ-WTtNT8yf3_9qcVRQyoqqYM
Message-ID: <CABNt8qNjztQ-TmKPtS7iY5csniFasfYGSfiJ=O+qxe7DySFWuw@mail.gmail.com>
Subject: Re: [PATCH] dm ioctl: don't let data_start run past the buffer
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Milan Broz <mbroz@redhat.com>, dm-devel@lists.linux.dev, 
	Shuah Khan <shuah@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Mikulas,

Thanks for applying the patch and for the cleanup. The change looks good
to me.

Thanks,
Palla Raghunath


On Mon, 21 Sept 2026 at 15:29, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Sat, 19 Sep 2026, Palla Raghunath wrote:
>
> > struct dm_ioctl has seven bytes of trailing padding, so the smallest
> > buffer userspace is allowed to ask for, offsetof(struct dm_ioctl, data),
> > is seven bytes shorter than sizeof(struct dm_ioctl).
> >
> > get_result_buffer() sets data_start to sizeof(struct dm_ioctl) without
> > looking at how big the buffer actually is. Ask for the minimum and
> > data_start ends up seven bytes past the end. Callers add it to
> > data_size, and ctl_ioctl() copies that much back to userspace:
> >
> >   BUG: KASAN: slab-out-of-bounds in _copy_to_user+0xad/0xd0
> >   Read of size 312 at addr ffff8880169e4c00 by task repro-dm/140
> >    ctl_ioctl+0x5e3/0xcb0
> >    dm_ctl_ioctl+0x25/0x40
> >   allocated 305-byte region [ffff8880169e4c00, ffff8880169e4d31)
> >
> > A DM_LIST_DEVICES with data_size set to 305 is enough to hit it, and the
> > seven bytes that leak are whatever sat next to the allocation.
> >
> > Clamp data_start to the buffer size.
> >
> > Reported-by: syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=48d935cf48a4a76be346
> > Fixes: 76c072b48e39 ("dm ioctl: move compat code")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
> > ---
> >  drivers/md/dm-ioctl.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> > index a6b8e97755cd..211569dd3c54 100644
> > --- a/drivers/md/dm-ioctl.c
> > +++ b/drivers/md/dm-ioctl.c
> > @@ -656,6 +656,13 @@ static void *get_result_buffer(struct dm_ioctl *param, size_t param_size,
> >  {
> >       param->data_start = align_ptr(param + 1) - (void *) param;
> >
> > +     /*
> > +      * The buffer can be as small as offsetof(*param, data), which is
> > +      * less than sizeof(*param), so don't run off the end of it.
> > +      */
> > +     if (param->data_start > param_size)
> > +             param->data_start = param_size;
> > +
> >       if (param->data_start < param_size)
> >               *len = param_size - param->data_start;
> >       else
> > --
> > 2.34.1
>
> Hi
>
> I accepted the patch, but I changed it slightly, so that there is just one
> condition in get_result_buffer. The resulting function is:
>
> static void *get_result_buffer(struct dm_ioctl *param, size_t param_size,
>                                size_t *len)
> {
>         param->data_start = align_ptr(param + 1) - (void *) param;
>
>         if (param->data_start < param_size) {
>                 *len = param_size - param->data_start;
>         } else {
>                 /*
>                  * The buffer can be as small as offsetof(*param, data), which
>                  * is less than sizeof(*param), so don't run off the end of it.
>                  */
>                 *len = 0;
>                 param->data_start = param_size;
>         }
>
>         return ((void *) param) + param->data_start;
> }
>
> Mikulas
>
