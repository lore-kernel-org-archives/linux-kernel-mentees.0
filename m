Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DA738F91
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 24 May 2025 23:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748130716; cv=none; b=FXTzkp1LbcgB86uDk6X6z6jkFqTWXDAVvIoysFGcA2YL9UPWZ1EU9PRnCT34Bxd027VXVa8xPi0PvrtlD8CccgqgbjwCTi3S5/rpuNc+Vc7ukvVNYAelqJSexqx0r/8LA0Uukq/8y9TWvD9g6qWcQWL7K5nisnWEg9MiNPd6Hk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748130716; c=relaxed/simple;
	bh=inv8KaaFc84F6JuDmwPOSqpQLRVQndyXV1UdIu5Oix4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEXSKNE5vDFeHov/mcaPM/jtKm49i+IgL/cFKosBWjCCzc4NauU6//VVPsB5/zgDnpl9/+4ST64PGs1sVI5wj4UWcmYpvmmJm10xnHxn/5bQzm/VrzTH4ZUuKvyAim7FPYtOGt49/Cukt57erQs2I+veTXJsHHzDW2A2Mu3sbic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O00ie+VA; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O00ie+VA"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7c5d470a8bso805402276.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 24 May 2025 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748130714; x=1748735514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inv8KaaFc84F6JuDmwPOSqpQLRVQndyXV1UdIu5Oix4=;
        b=O00ie+VAaVYSFPMLiLr5q5+kmPl8sBBhKpI66bc7P4vLqMZuz0vaC9G2THQW8NtR82
         0Ni6nNwdo7d1vWFgcTUiw2gDm+MWMBKFjYEicpnGOwZJnd7WmCo71WST8nF5B/VubRgh
         R31IR4qw1ZBnZo1+HL4rKrozW6BAH6s7eI7q9riCVS1VYdSUT4KeWDgYOTML3LdWndaz
         cwQcK/tRnke22L1kPz0vhUc623w5xP5Ymhip8CwKto7LeIKEZenmmyeR+w8s8cTe5A//
         rFf3Nj/u+lnKKWXh66ZX/WjmpPJ71zJShWC4h772HTQbbnFHfjJJ+e4CCQqFlFqORWKf
         g2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748130714; x=1748735514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inv8KaaFc84F6JuDmwPOSqpQLRVQndyXV1UdIu5Oix4=;
        b=FL1c5jk8BVLnZgyvLJvWYiBZK5rG0+MQWFOrRLZTF4aXn6mBh/rpgaqD8DigVgcvYP
         v7Sg7uIOK00Gpwmyp3w/nSTTeU8X2OeVoUR7hinOIfX0MESyZ8KMyhmdSsetu6nUC5/E
         TOOHEV/XviuSIoB4YdtZ1SPY8zZ8wAkruGe/mu83ZPC86G/JI98QXMgYTxd4lp/hFpvS
         sVhDvWz/v+O2jzVrU/ptNJvo4r7QbF8URp/IdhjrlX0bWVxhKjpWgqOQ95kQDmK2CqCi
         wwMGqLVrXmOxVBemwkkgJD0/6YRSeZn+C9qVrdiEq9hkcug4Q9JvlvXKXFyc0wJ5aU9i
         vy8w==
X-Forwarded-Encrypted: i=1; AJvYcCUGngwZyYQyy6A99xE0Ji1UoHYZDOwaQIYrP9c41GxV+YHKOXx42EaLckdeBKAvgQo3LlP8oN0ALq6Atv/WW4T1c2ZBtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9L+8jvRYtjjAgKNKO/mx1pDGCYIoC6NGPl3RWdj0Ix2895awB
	fKaO2qOjmDmcDizhSAthfTLaWO8gc+SFIv+4gzDxNulPo1t772xw34WdAVUSpOhCUDD5AWvQrfD
	dLgjCU5c73kgAXAV6HTf9UluSrv6wOMk=
X-Gm-Gg: ASbGncsOqRpdekX+Q5+H0nlLsXniKpAUdBP2PoIvcfI5OQU1TxM9N1kV/VZc2xGv0o+
	agahBQyZ354gHb9aCl9FEAFF3PGig94jW65wWRcNI2RudxmdQNxFzSgKQ+njdGkxtblwdbeKiOh
	uZZIqGOH71fiyZWBvDo4O6FSqmUBr0MEGaCHfvfNOx3oRgZpNxrz2gXIuOiuYT5oPNuUw=
X-Google-Smtp-Source: AGHT+IHtT+6FtZi323BKbe02Tg28onDiUmd3DdzFaN3HimawQ+poIuje0XgcyrWxHdb/qLxjJzBW5cLB9cK+ZHFYRUE=
X-Received: by 2002:a05:690c:6a0f:b0:6fd:318b:9acf with SMTP id
 00721157ae682-70e2dabf9edmr31362287b3.38.1748130713661; Sat, 24 May 2025
 16:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aC_yu6Ll2E-3qRHj@brak3r-Ubuntu> <d86594f5-c6d0-4692-b1ec-41d76f947b7e@linuxfoundation.org>
In-Reply-To: <d86594f5-c6d0-4692-b1ec-41d76f947b7e@linuxfoundation.org>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Sun, 25 May 2025 05:21:42 +0530
X-Gm-Features: AX0GCFuCN754TTjc3XI9nZ-fSJL9rV3x8ViK6rj5OfiHnmyRtmFMbWwDC1xCGDM
Message-ID: <CAG+54DajW=1cKGaHDg84RextOvB1FQtSJU8VwrWYNfuoHBigKA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: timers: valid-adjtimex: fix coding style issues
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Respected Shuah,


On Fri, May 23, 2025 at 10:38=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.=
org> wrote:
>
> On 5/22/25 21:59, Rujra Bhatt wrote:
> >
> > This patch corrects minor coding style issues to comply with the Linux =
kernel coding style:
> >
> > - Align closing parentheses to match opening ones in printf statements.
> > - Break long lines to keep them within the 100-column limit.
> >
> > These changes address warnings reported by checkpatch.pl and do not
> > affect functionality.
> >
> > changes in v2 :
> > - Resubmitted the patch with a properly formatted commit message,
> > following patch submission guidelines, as suggested by Shuah Khan.
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
> Sorry - I didn't realize these are all coding style related
> printf - I am no longer concerned about the length of print
> statements.
>
> It is too much churn with little benefit.
>

Thank you for the feedback , also understanding your perspective.
For future contributions, I will focus on more substantive changes,
unless stylistic
fixes are explicitly requested.

thank you,
regards,
Rujra Bhatt
