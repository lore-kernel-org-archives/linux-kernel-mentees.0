Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240FE2BDC2C
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898743; cv=none; b=E2nonRYpuahzRlwn1O7mGaXUkIcsYjudwkFV+sOzCOnRjgAKkO3yZLHBot8xH6t405Zoa7NQa+/WOdZxPDQluQFO2xaoeBSoKgpYBBURuuyhZWWSuOwYdc9yFOavFlkwErh6xP7sBqWFUOIj6/m7egUnfMRo7AfwEWhsRaSA2ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898743; c=relaxed/simple;
	bh=nhc83eAPy8ZVz/rx/WT9VLQ+rUQ71HcQIgBfRRZQAgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXffsWJLnStdwpEbnUmRcxcD7hM0x+7p63JuDV6gZXGRlIn7bbypntn0R1Pttf83cRLrobuv3Dl7YojxIubcLDTtXG4sWMoXs4AcqjAp2sqXuo4DnkLwRArhWgciEceTyjhu1zKUAogpTRsUQEmW+1IJU0mJ0iEO1TymSS+gFaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSZKNc1B; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSZKNc1B"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32cd0dfbdb8so25461471fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 07:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751898739; x=1752503539; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/FMSBqJeKFryaW0a1HucMaUdkq/Nt2BLzJLFvyV1UM=;
        b=KSZKNc1B2UiSX3Sjk4MQnFUZzlnagX+dwjgjHIEGthmJHRGxpORRD9YD6jxB0WKZ46
         k5Yfs+oP3h58SDCW2H+GHP2Qd06qotYt7GbVgCevADbI8IqjbEyQ4LvU6pW84UqOnnKk
         hD5ZP/4JP1gL0BnZa5FH0KTSqUj3X1uMX8KHUvV+xkdtejYWmwBSKMZbVzXz1/SfNcMP
         buX6QroEjHJSifCbQTwgtFRQyVjf0vR7i/rM1qGhQkjpHop+OfQjGr3mgjH0Q5gCVHVo
         2dbwP47Podas+m34Mct9WcjjlLlm+1nv9n/VIcCp8cA+J0ptQL3XKFRMa4MUcIpJLHXG
         idfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751898739; x=1752503539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/FMSBqJeKFryaW0a1HucMaUdkq/Nt2BLzJLFvyV1UM=;
        b=H7SxeZ95cwvf+SX36O2/4Kle0Y28CirmGNxBTQWpLYs6fKYgPthGyGVGww4Kr4ig/n
         k7irSguW1veuqHCNYgW4yu1ZK0y6T1GKAvD/ZbdpzKmUUCnhNa48GYbjljrBnQ3cch7d
         zA8v/QObaQXZ05qzPOghAdBw57mqXUnEQOpewtmjr4HqZBMq8MvHOOR3NWnXjJYv2uT4
         LBFrxsuc6mEJh7suZhQY/bP+Y0Gfkck7RAwbEAt0f+/OYTCvTs2QkliDlUaPAOUDZPdV
         YVJlmlHNehsucMoMV3AbqGe1OWMPfgypVPva3DwWXiGWbdyLgZDQ38nZ10zQjcKinVrv
         Mx5w==
X-Forwarded-Encrypted: i=1; AJvYcCVU3unYPLy1y4ameQjbdHkNPkAPc1LI/33gg22bT6KQYZgQZX/4b8jkYrq7nzGAsONPDuMSC5Z4x0Sf3X4sHfoSSUL8jA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFVBZXXGydXdsBx5O8AJj1nKn5/qbVQIKAPNgSwl8rds3AJ1Q5
	lQEEk3Of5yb5Fai5BMEasfk4Dq9yprG5aRxshI15aOUbCu9l0ndWqxeoJEIDPsSt05hkRAjw9+F
	432xTB3Ieg5Dl2mS6k+ilHgeExCLungo=
X-Gm-Gg: ASbGncuDQlLXMIUZTz0hpHetCbCxs+ESO0+jBXAcgBpeyY8yUCXLjnRMmQzrJyMkOEk
	6j3Qpzb4NDZ+ApB8mg7uFavoYnyfcOECU30+6TeMmGBxXJq6yqwiijrq/RxQn79s8FT6RDQ/kY7
	NC4sRmaaau9mXEfNpNtln+hVIdHaydSFnsH3klrNrKVqjcsz1s+O2fxaqMw7rwThlSNKZECdxco
	J8U
X-Google-Smtp-Source: AGHT+IFULVURJBOVYtWcIZw+X3lh3wL59Axl2kzkDpO3LIcnEioQra3fSYTDbUsjwm8D9OHJl/nvyiF7r3K15zHyCak=
X-Received: by 2002:a05:651c:221d:b0:32b:4773:7aaf with SMTP id
 38308e7fff4ca-32f09328c9emr30825051fa.35.1751898738869; Mon, 07 Jul 2025
 07:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <oxpeGQP7AC5GXfnifSYyeW7X_URDJhOvCxTG09iGmuvIXd330ZdXanoBmbUB3wpOcIORP1CakEzevsjtJKynhw==@protonmail.internalid>
 <20250617131446.25551-1-pranav.tyagi03@gmail.com> <huml6d5naz4kf6a3kh5g74dyrtivlaqyzajzwwmyvnpsqhuj3d@7zazaxb3225t>
 <rkCSJQOnZAt9nfcVUrC8gHDWqHhzMThp3xx38GD2BgJZM4iXJfvVgXZwa21-3xikSHHLO-scI4_47aO-O1d5FQ==@protonmail.internalid>
 <CAH4c4j+dhh9uW=GOoxaaefBTWQtbLeWQs1SqrWwpka9R8mwBTg@mail.gmail.com> <aaywkct2isosqxd37njlua4xxxll2vlvv7huhh34ko3ths7iw4@cdgrtvlp3cwh>
In-Reply-To: <aaywkct2isosqxd37njlua4xxxll2vlvv7huhh34ko3ths7iw4@cdgrtvlp3cwh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Mon, 7 Jul 2025 20:02:06 +0530
X-Gm-Features: Ac12FXzf6bQbW208adFb3L3sqINPLXWf5JxB8WTi60gS2v2uT9WkHERIFtfHvtI
Message-ID: <CAH4c4jKisoACHNOQH5Cusduu-_51_PcevxYJT3k_o6MjBWsVJw@mail.gmail.com>
Subject: Re: [PATCH] xfs: replace strncpy with memcpy in xattr listing
To: Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
Cc: skhan@linuxfoundation.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 12:04=E2=80=AFAM Carlos Maiolino <cem@kernel.org> wr=
ote:
>
> On Mon, Jun 30, 2025 at 06:18:06PM +0530, Pranav Tyagi wrote:
> > On Mon, Jun 30, 2025 at 5:49=E2=80=AFPM Carlos Maiolino <cem@kernel.org=
> wrote:
> > >
> > > On Tue, Jun 17, 2025 at 06:44:46PM +0530, Pranav Tyagi wrote:
> > > > Use memcpy() in place of strncpy() in __xfs_xattr_put_listent().
> > > > The length is known and a null byte is added manually.
> > > >
> > > > No functional change intended.
> > > >
> > > > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > > > ---
> > > >  fs/xfs/xfs_xattr.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
> > > > index 0f641a9091ec..ac5cecec9aa1 100644
> > > > --- a/fs/xfs/xfs_xattr.c
> > > > +++ b/fs/xfs/xfs_xattr.c
> > > > @@ -243,7 +243,7 @@ __xfs_xattr_put_listent(
> > > >       offset =3D context->buffer + context->count;
> > > >       memcpy(offset, prefix, prefix_len);
> > > >       offset +=3D prefix_len;
> > > > -     strncpy(offset, (char *)name, namelen);                 /* re=
al name */
> > > > +     memcpy(offset, (char *)name, namelen);                  /* re=
al name */
> > > >       offset +=3D namelen;
> > > >       *offset =3D '\0';
> > >
> > > What difference does it make?
> >
> > I intended this to be a cleanup patch as strncpy()
> > is deprecated and its use discouraged.
>
> Fair enough. This is the kind of information that's worth
> to add to the patch description on your future patches.
>
> No need to re-send this again.
>
> Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>

Thanks Darrick and Carlos for the Reviewed-by tag.

I also wanted to ask if this patch has been queued for merging.

Regards
Pranav Tyagi
>
> >
> > Regards
> > Pranav Tyagi
> > >
> > >
> > > >
> > > > --
> > > > 2.49.0
> > > >
