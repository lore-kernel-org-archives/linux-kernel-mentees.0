Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F329A2
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  4 Aug 2025 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754290892; cv=none; b=bWtIQctU0rhV28jZ3nLcCscBQqLYJj+p7H6p75WhBYNlYOsJdAcNXxzWZUVp/i8sFCdaQlTVn30Ad8n30dQjwlsdf1F8v1v7tXlNqqE4Q8Y3uKvU7z3OCTfX+R+q+7ikacv3FUOOveDbca7S3OiekcWW7Vf+7MBjk+DjAyoKhgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754290892; c=relaxed/simple;
	bh=pYYfbgtGKtJmMe3qV97+fPjpGWjo1ETtd5dCoPaov5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6mMLLl3Vli9AnRmq3/w84x1rdc2BF/7KRpqqWsZ8K9LTI0d1B1Oi9sPBBX3/MbkaMafRIKXPskwWXLEoAY93+nQLdb+HFTbRb7nKfwRIH+RA5QQrgzRUeSQKY9kQzgsI3JUr68y4q4E0HVzUk//XvdLWAbg+25QXWebOdtBiLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShfI/2mD; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShfI/2mD"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-332559ace6eso17956441fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 04 Aug 2025 00:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754290889; x=1754895689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOeLQP+AJ+SiRI8RVG4vwpZ6jRWlqeSJrVM4bgwJ2FY=;
        b=ShfI/2mDEn2JQr/CzoWQj4A8/BGZa0cKV+Zo0XcdSwCWto3Hzh99GLX7OCTVlLyxCF
         Lp7SAIlzKQrgXCN01bxkYAhb3u6RpEx8tGbihqmAxqaFbcG6/dhT8mX2VF/RmOLOUXL1
         bR263kKuh6aC0GCePyDqHpT2HvDrQgvrPoWX9I91hR2hVaTGmiJ1trjhVqIUkji1cveY
         HSHg0phABsziVLlb/Xldx3VbcNwr4oVsmZwDTwjsSg95qncj3ZUj946p1G3GbHTZpD5Q
         GSzwn/GKColimE4AMNOj7kTbvknMomDEzvY75ScgZoo59QuSmER2arg4hAq0CArKJC3f
         z0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754290889; x=1754895689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOeLQP+AJ+SiRI8RVG4vwpZ6jRWlqeSJrVM4bgwJ2FY=;
        b=ddIPx4NeZF3Z97k57KvMjoO7eFpwhoy3JUYfJUecQ3nTwqnR5QelkDeGxd0pGvUCt5
         az6U/ykVht1SaOWyssFxOrF4LE6d8IhhMNi+/sXbPNE/LJugqmuc++uob+eZR9iWYaZO
         UujWuc6B77c4jWxkga2LzhdzCw1ybr9CAsnr5PD5eJYBxokOB5lMkdsLwGmAsAkp81se
         lzBnZ7mkDpwXwQwieKjsplQ0a641NGkH8kk3N1oyJQE2mTc+tswQWedcShQ91cpkHUiy
         Z8IbDxBRJfoqiII1xiMjJoXlxUvZSdoUaEMzZ20GOfJm0yoSY33A279vetY11zmUiltz
         9ZMA==
X-Forwarded-Encrypted: i=1; AJvYcCW3GFam7b1PTGOeaKMi4AGMOvz+f9c9mZHTyB/LkV+4bmTb30Fg1Oy4QnGA5JHDlTT3JuDwuT2wnAZAqt0R52WzRd/Xjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4cIcMn88WpCB9CFbIDC1CHD76w2+4gdSeO7sngtcbpc+UzaF/
	Yj4nxMN1QzYGbWNi61DNoNcxfZ6GGZLzMzJ5fl5xQpwM3lU6ZotyvqtTgIEOPdMHcQC7sRa3Rwj
	MJtnNeH0k+iBF9B5mxXJOju0ljxSCVYk=
X-Gm-Gg: ASbGncuoebquLakA+Cgj7oGPuyQDZjHGNUYFd3gTwD35q6JsvnASggwML/uusK82YzG
	n0yk9A+BSUI539YYQ/1Mm3W27tAs9F+mjm36Oy7l14rmdIGAqKmVW///ku83JT7wlR0uhH5aNqR
	6+Qbue1ZZyz1HfmoPmClPfDT5dQVKwKezJTxcnMBNuz3H94QI9cyZ0EdyF3DMaph4Yt321pehvs
	Q8R+uAJiC+qUPvGISiaBFWIGTKxVoxmYImmB9A9Y645gHsrFyTg
X-Google-Smtp-Source: AGHT+IExYrDYlOhD8PYRKprLU9YY3QN8ioiYkkgYmkU4MRe6GPcKn/K68YK+q8Ter9ncHammKU/9pdBLWTG2jk7Defg=
X-Received: by 2002:a2e:a375:0:b0:32b:4773:7aaf with SMTP id
 38308e7fff4ca-33256810b45mr14702521fa.35.1754290888567; Mon, 04 Aug 2025
 00:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
 <87cybdp7to.ffs@tglx> <CAH4c4jLjSBxbd3bqkdgcCSWqXURratANgnbq9negrSU283xHpg@mail.gmail.com>
 <87frg3ss9s.ffs@tglx> <CAH4c4jKmj2gwmW2LS8CuGyw6phtiN+=_Bef8_pSEzjnbsqPOeg@mail.gmail.com>
 <87pldhioov.ffs@tglx>
In-Reply-To: <87pldhioov.ffs@tglx>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Mon, 4 Aug 2025 12:31:17 +0530
X-Gm-Features: Ac12FXx2e9gO-8pYyZoWXyN8mb9SRh0jyrBetN4eiD7KtRPHp3RGszi8f_aBmoE
Message-ID: <CAH4c4jJhB=P_bSwiqDb3d+AdT5QNv_qSgtKLZLNMDLJwVK-6hQ@mail.gmail.com>
Subject: Re: [PATCH] futex: don't leak robust_list pointer on exec race
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-kernel@vger.kernel.org, jann@thejh.net, keescook@chromium.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 10:46=E2=80=AFPM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> On Wed, Jul 30 2025 at 20:21, Pranav Tyagi wrote:
> > On Fri, Jun 13, 2025 at 6:38=E2=80=AFPM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> > I face a small issue while refactoring the common code in a helper.
> >
> > The main obstacle to a full refactor is that the native and compat
> > syscalls use different user-visible types (size_t vs compat_size_t,
> > struct robust_list_head * vs compat_uptr_t). Because put_user() is
> > type-checked at compile-time, I can=E2=80=99t unify both into one funct=
ion
> > without either unsafe casting or weakening type safety (this is as far
> > as I understand).
> >
> > The best I can do is refactor the common task lookup/permission
> > logic into a helper, and leave ABI-specific put_user() calls in thin wr=
appers.
>
> These are two different SYSCALL() implementations, so they
> can deal with the difference sizes of put_user() there.
>
> Thanks,
>
>         tglx

Thanks for the suggestion, that clears things up.

Regards
Pranav Tyagi
