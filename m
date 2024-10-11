Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6284419408C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658904; cv=none; b=psFlugiOPq3MVnPfi/uM+E3d+Ai12LCnQv3IsZJ/TlMPDbWcJs2a91e7OpD/oJQ/GwvrgigMu6ltJXsldRIJO9nD/Zb1m0LW66lFMX+B3FeYPiQ9L1KHLCaJbuK3z2wsRuDXGNPDiu68HkxEBZmB9Kl1WJpUQL0yO6xd71V0amE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658904; c=relaxed/simple;
	bh=nr1kTSxvBIb9LRmYw14N6GTTVefLFfgK/8kJVEww7WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMr9zPQHopfAG9lcN0EnC/PEN6UYAtfhLq0S0obddKkYmwKDOGDbYfysYWmjwtUs8+6O+B7DvMNTeheRSW2EyL9FG5jw5DxyUcHjjuYkNPENmYA5dbhNlWN4qX1IpUY0jpxafPScJLk33+1KwlN7QRGNtCzRcTPHYwFNbyPzxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltNauHAX; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltNauHAX"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF6A1409F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 15:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdK7B7mKebkB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 15:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4301840917
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4301840917
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ltNauHAX
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4301840917
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 15:01:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so4170786a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658899; x=1729263699; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzELerGxwENbVERb4Z1vrEYFWmlmJCGafD6FOzDywR8=;
        b=ltNauHAX1Ttm6gnefEpaIf7uWusUpc+ux1hHZQQWrMz8+KeSFgcCgzKt7/EA59nx/m
         KGjrPpeP83SeCruFdpLZEIBJBmAMqpt7Jmf8NvC8Fj9ZVwGuyTI0FKVQL0j08/fRm+/z
         MZ9/mG63fukudpGxXl7iXL+p3JJqwBtPP2BG0DJfIE/jEeTQctHA6sozXN8OVi31WRi9
         tC//+C8q2BZJvSAnbSKLrdtlybXJgSLonFNJrBe21ZJehy9gKVk0hugbkf/hS+sJc0Oz
         tYINW+YzZg2bm5A9QlUUAdyxPTm5OwP2Oh5l0nYD2H+AEEYk6kbb0l/NhrNqJso+oWuQ
         xdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658899; x=1729263699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzELerGxwENbVERb4Z1vrEYFWmlmJCGafD6FOzDywR8=;
        b=Rl25TX4wX5RQNXfzp9fsnfl6p2BgMvubFFhneiR/Gage9c3UFj02CiCXHwYS/vNL40
         vzmzTBUJD6gzbzWjcAO8U4oHONC9ub01iKR8td4tAA2t++J4bsxY7mkV0UiFtNNjDeJ4
         FmwFYwUHNNP5ApC+Vc++Y7cWoUIbYu8j0R9S7czM+SB0iEffyF2HptG0JWuuX6XXa0A9
         wZ8Fu/XXR7dD6SKe7W97WTLI+HXJfCNkOiMtPebfBDUXlBi2bsXuRF3IEI/GP2fUvMNx
         +OPo3G3HJCMlCZb0H1DkH0P3979UrhgawFHkanH1IveuO2zIUK9d4mC7fUqW6Z2oZB70
         4tzg==
X-Gm-Message-State: AOJu0YzGRvE2YRsSH9dVWFEGn1opRECeOamnqXTOpnI86XFRnNmmc1jL
	CFyh6+0kt6iq7YVpTt8ZADJ+ltlr2E31cK54EGz+nh9NQnDONEFt++u83z7q6amPLC13phZhQNO
	aTCyboguovmj/eHjbpwAOx0pmz+U=
X-Google-Smtp-Source: AGHT+IGW/6FiYvt3urJzRIq5N0EHLG9l8NfLeEXHKSvHcWOKXSI41CWNhWYeebqTMgP9CGTXk+lib7CwbGIi9mWuiDE=
X-Received: by 2002:a05:6402:354c:b0:5c8:a4c1:d59a with SMTP id
 4fb4d7f45d1cf-5c933544dc4mr6299265a12.8.1728658897704; Fri, 11 Oct 2024
 08:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011093752.30685-1-0xff07@gmail.com> <20241011115334.367736-1-0xff07@gmail.com>
 <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
In-Reply-To: <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
From: Yo-Jung Lin <0xff07@gmail.com>
Date: Fri, 11 Oct 2024 23:01:25 +0800
Message-ID: <CAHhBtNr6rycOKjXvAR6nK9ZKF8Ze=wvki2yetCZDNz-LHA+FvQ@mail.gmail.com>
Subject: Re: [PATCH v2] iio: Fix uninitialized variable
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net, 
	skhan@linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Vasileios Amoiridis <vassilisamir@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Angel Iglesias <ang.iglesiasg@gmail.com>, Adam Rizkalla <ajarizzo@gmail.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Fri, Oct 11, 2024 at 8:31=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> On 11/10/2024 13:52, Yo-Jung (Leo) Lin wrote:
> > clang found that the "offset" in bmp580_trigger_handler doesn't get
> > initialized before access. Add proper initialization to this variable.
> >
> > Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> > ---
> > Change in v2:
> > - Make value initialization immediate before its first use.
> > - Link to v1: https://lore.kernel.org/all/20241011093752.30685-1-0xff07=
@gmail.com/
> >
> > ---
> >  drivers/iio/pressure/bmp280-core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/=
bmp280-core.c
> > index f4df222ed0c3..682329f81886 100644
> > --- a/drivers/iio/pressure/bmp280-core.c
> > +++ b/drivers/iio/pressure/bmp280-core.c
> > @@ -2222,6 +2222,8 @@ static irqreturn_t bmp580_trigger_handler(int irq=
, void *p)
> >               goto out;
> >       }
> >
> > +     offset =3D 0;
> > +
> >       /* Pressure calculations */
> >       memcpy(&data->sensor_data[offset], &data->buf[3], 3);
> >
>
> That was a quick reply. I would recommend you to wait a little bit while
> the first version is under discussion.

It was my bad not waiting for enough feedback to finalize another
patch. I=E2=80=99ll definitely do better next time.

I feel that initializing it as sizeof(s32) in the beginning and not
using it until the second memcpy() only widens the gap between value
initialization and its first access, which doesn=E2=80=99t address
Shevchenko=E2=80=99s concern.

>
> I still see the offset thing a bit weird. data->sensor_data uses an
> offset to avoid hard-coded numbers, but for data->buf we do exactly
> that, in the very same lines.
>
> Setting offset to 0 to access the first element i.e. no offset required,
> and then adding the actual offset sizeof(s32), which could even be a
> const if the first access was to sensor_data[0], looks to verbose.

While that is also true, it=E2=80=99ll take a more general refactoring to m=
ake
it driver-wise consistent. Maybe that refactoring should be on top of
a fix, instead of being part of a fix.

>
> These things are of course not critical, and the proposed fix is
> definitely ok, but I am missing some consistency here.

Best,
Leo
