Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AD17A2F8
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780662; cv=none; b=o5b9TcZpXQjs0NUR0UkXFrvMl25ErSVfRZZtGoOFvlwb093746u46dnGqcbqr/JLNwsifuqJ2UOn2SWSjTpFrnI/37sCYr0em9oYg48Z00E0cFnvkXanKeHLCPzuxnTE6PaCcaeAWf9B8hv9b5pklqXfNyTBIKt9TqknLSyPjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780662; c=relaxed/simple;
	bh=WeLGtTB9ar+BFGQpy4yU7poIY2hEMrxYQX6hMxIuhwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIzNnApQ0KLy6tQMQQDNY7vyZpLNjhVDOmen8C1OOf3ojjp+3ptySfWJWGTRxhBql5MujvHnzDuS3oeyNGyWWN/mpoQwK9uBQ9h1q3nh+F5sX1uHlMhKeOMzpSUbSDGOYdA/dVUhq24DDZLZdlQZWHh9k+mZf6nwY7EP+QPVWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJtjjC9q; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJtjjC9q"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so7688301fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753780659; x=1754385459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MNtzty7rFJgUySAkQlJV2O9frQXPFb7bbFYFWr20zY=;
        b=OJtjjC9qNvYQogf+3qbK/oBgQgndX0T3r2bknbMYxJgtbJNPsygXvdBHquCQxxtRKC
         tI/px921B5V3lopw5oNaklLwsj8h//cTmHmp2hpKnPg7GqTalbjTZHa1V2tgPC88kem1
         AEYB4mbZoGFlBC9tOVrg/Drye0YcxxcEslhDyLkDeImmXqGwR3a5TGL23JOrpFGYuexg
         6Vdu/fuQS2gG32G1bmCEJIf4PPpDOsGg5fQ06o5SyKs6SRTSzyghHoAlHhh0EO6iVAJP
         Lej6hjYkk4gfOu9HngEnx9B+zOjnP9JxPMN3SYwJl24yvEsRySU2t+F1wJX/paAbsAqi
         GGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780659; x=1754385459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MNtzty7rFJgUySAkQlJV2O9frQXPFb7bbFYFWr20zY=;
        b=D7JPu1jObayuZC8AewbY1Osbai2iY4QMFseliGm+e+k03zMJf3t4HAWWDdzpmtSiZO
         CLgohtNU8A8JcVAY8YMrz60JQ1qbdgyyIEtGGQUgZi8pKDkSUukFuwTNvoT+/jXArzRK
         LR1oGKT5X4hQ8J0CE3tMbsDibtaj9n2RShFxC0EKJKxw8C3VRdSRTdF53mEI7ww3J+7r
         xDymFiddfVjsPgXv4UUcmafvEQbiJIcldEvwEO3GisY4pt1O10S4QQf1DI9SBSSjxGeq
         c8XN6Hrye6vYp4G2kz6x6EVRYAMp6HKNZeZT31Zrrep/EBNoCZeQ5qG6Ztdo4I85hbSf
         LjHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGOUNchZ6ik7KTXdpNW7Kssx02lA6Qs/cfPyu9DHIoB1eSseWfk1F5n17TVV7N3gtaoag4gJ+u/dZ7PQiI1Oqr6X/nng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8ydEo3FEVwL2qpp5r7NA76hzzZIO16nmSs8YdZuXoS0UiShA3
	RafHXs5p6dzdblHz3VCK2mow+kpaNhJ2Cl6oO8z4eaCDFHD/0cRG905FIXSxhG/PUwXGOMH7nEx
	9HTPBP5I4jE57FWg1/V84Of6m+o7IRzM=
X-Gm-Gg: ASbGncsfpb+DjKU2QWfATMDNqFACqIqxA8MMA5l/V5z+ZQfA4AQHSVmo5G1vQz0TSIP
	hBdE3WezWz+fDW2ylJhchSjZfcdlPRh1i+/6d94prTpEuuwusNibszzZFJpEvhWmrKCYYstGsKp
	CCdTZN7n18X2s9KfUx+l+EfgQoMAlYBpu1A4w9/y49tcenGgUgEsVKGLI3aulxOVDuf78+fFqGU
	Sw+7hvshY4fs9GYlu1yI2SC35lK/3JvqjcCHRBsAw==
X-Google-Smtp-Source: AGHT+IGvbJZAYxRsjQOkwEVXEYQywo57A1btn+K9lLr1jxhzGNtgg07v1w1L3IEbQ5Apyb52E4PdbuNWX7sIR3uM1sE=
X-Received: by 2002:a05:651c:1108:10b0:32b:4932:d5ad with SMTP id
 38308e7fff4ca-33215441211mr4929531fa.10.1753780658895; Tue, 29 Jul 2025
 02:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250706092522.9298-1-pranav.tyagi03@gmail.com>
 <yq1bjp9rqh5.fsf@ca-mkp.ca.oracle.com> <CAH4c4jKgPv-Mb1=WvOW+jvGMABXcEgaDMxV0Wit32LPgJitekQ@mail.gmail.com>
 <yq1ms8nn2g8.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1ms8nn2g8.fsf@ca-mkp.ca.oracle.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 29 Jul 2025 14:47:27 +0530
X-Gm-Features: Ac12FXyXbTfsF4-xJHUYe8uTZLOfsxIie85dgr712UYsyAkEnOXJkJFEnqYZ7zs
Message-ID: <CAH4c4jJ+BjGyhapXbHqM5HBmSm1ZNzgsYWS-mNQjbc0XpMns4w@mail.gmail.com>
Subject: Re: [PATCH] target/core: replace strncpy with strscpy
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 8:39=E2=80=AFAM Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> Hi Pranav!
>
> > As far as I looked, I could only find the following 4 instances of
> > strncpy() for the file target_core_transport.c:
> >
> > target_core_transport.c:1115:           strncpy(p_buf, buf, p_buf_len);
> > target_core_transport.c:1165:           strncpy(p_buf, buf, p_buf_len);
> > target_core_transport.c:1225:           strncpy(p_buf, buf, p_buf_len);
> > target_core_transport.c:1279:           strncpy(p_buf, buf, p_buf_len);
> >
> > And I have changed all of them in my patch. Kindly point me out to
> > other instances, if I am missing any.
>
> Sorry, I guess I didn't read far enough. I was focused on the VPD
> identifier dump function and whether it could overrun the static buffer.
>
> > Also, I intended this to be a cleanup patch for the deprecated
> > strncpy() function and wanted to replace it with strscpy() which is
> > encouraged. No functional changes were intended.
>
> In our experience cleanup patches come with a very high risk of
> introducing regressions. Regressions in the I/O stack could potentially
> lead to issues such as systems failing to boot or people losing their
> data. So we generally only merge patches if it can be demonstrated that
> they fix an actual problem.
>
> --
> Martin K. Petersen

Hi Martin,

I did not know about the risks involved with cleanup patches for the
I/O stack. I understand that this could lead to regressions and it is best
to drop this patch. Thank you for reviewing it.

Regards
Pranav Tyagi
