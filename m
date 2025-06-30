Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253328A1DE
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287702; cv=none; b=PQd8qzHm0hJ+Nth+o/LaR63YJaBxVEE1YbgCUMR6fTWqFYZ774eiKDr7WI3royPl8jTNx9U0W1+YBB8VmxYvHG94Ia6sH3wAsva6myR/+U+urSXvrJIyvXF2tGfiJES52wSP5Wbs1zFtiaLcjYpHVGbYySR2crh5C8Rg4m1KXWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287702; c=relaxed/simple;
	bh=MIZWGT2T7Tlm6PSUwjsJxR8tlB50tfC/tPCtXTT3SHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdlBUbxfbMiOPdtXjDOT6UgLu1nChgA3FYCt3QXr0+j3e/09UXgruosKBxvrywCxwBpcBL4tzZFjTQ5WUgg/xH5eF6rk85RPGW5gNsri6IvfZIPiXCoJT1CmDEWjZ84T3KFpzxGcd9GSHQExQeWCGB1K2PfCGGeXxzAz/5my3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uk7PZc8n; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk7PZc8n"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so17726021fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751287699; x=1751892499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc9GOsuKWZQ30zdGq//5svH3uKcqx16A1j5YGKqNoSw=;
        b=Uk7PZc8nIMC7kXBxhUnHQfpDANLdC31fBMt2KGS12KHUxesvT6mjSwkRKXit27Va1V
         4uidessYjaJcsocWFG4lAVcKp05/kjbHOXwnMmy39r4FUbxM9HoQWeo02xK7IASziEqZ
         SxlGDXjeqLNqNwTcDoDWk27dMB+v4tZNjipAIIy23hmahROrSOAoXUyw7j/3mOZLcvgp
         u3zQOjhz3wIqjLR6aoK56LRZCuBISKxCL1wFdP6A/qjf4jglhQWutkLWDHliV5IZ+wk3
         PTa5K2i5r9/4zycDQnTnvyKolH2qq7slF/8v1mbXLtAB774IJdEY/aMmA6FGcMNJuciK
         GgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287699; x=1751892499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc9GOsuKWZQ30zdGq//5svH3uKcqx16A1j5YGKqNoSw=;
        b=IyMuZjTyaNSqZosFjLV7JEW/YdB89D9772JoMFMVC7/QDuEjHx2w1wve9PxVQJNPQC
         w5/837M9ZuyrFnYgoU4wu3UQ8+HgExLP5avJuYu23MH+0bKvqTfBP9dOCermePuCNrIO
         KzDUB4iN4diQJnXRxfmhq1XUbtJICRpcCq3WBGC8Y5rK3d1D1cmjSrxKVg+oGIYXLF2L
         GqGTdlK2VzZQMklWbg2P9KTsfpqIEOMovhWG8CIFQFG24UhLvmw3XOMT/2uJjWeSfhe+
         /wRmTyyKhpLg31v+2ye6bANytldUzonGcwgM0J7xPhMfkQOrPJZAmNa2WfNLbquO/lFt
         Du1A==
X-Forwarded-Encrypted: i=1; AJvYcCX48mLIAKaUXGXc6YSQ8FrooV279GXgZobikJ0bS1EOpBugn1Dx4EuX77g3jDvrnwFf+g84c45hTn0Fmjwe5qAOalKN4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKsCree1YB0zm/ufia1Src4qYPUlkzoClOafe51u6NNKoir6ZR
	zjucrbbxKW2xL/qfdOSvK9LsMkttxbGgoEC7I3MXssucGnM3Ut0dLj/NlH3eU1ZUIEYRz7Xz/J2
	sD2aBhz5YEUHqVg/+D5XI3yyshHzdoxeWjXcDakfz0dwN
X-Gm-Gg: ASbGncsdM/wc9BzSfueZRI33mpHwsUbvp91VmVyzWe4lcRYbl/jNl7NwmFgq48ikGYg
	Y8OSOWFJCh8A+/zPHtKBEtbeKN1DF2Dl390erHbHnZ1wqU8I1jrS0jFNnGjhV3/F0yX+0+eyWal
	xZ1nDrZmkh0w3dcsdVP8wkyKVrmIORmABj6u/7A4Lx8csNOYJWEiKp9bH/5ge4TUmCa+uL3Opib
	5n7
X-Google-Smtp-Source: AGHT+IFZ/PwzE3gErBSpWi0Zkh9xrC5ZLYgbi/qGccvzQTySne2UpxDe9iNCPiJTyZ8bkqlsOfb+KmXM3QtlG93FFAk=
X-Received: by 2002:a2e:9189:0:b0:32a:61cd:81f6 with SMTP id
 38308e7fff4ca-32cdc4c1204mr29656731fa.19.1751287698497; Mon, 30 Jun 2025
 05:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <oxpeGQP7AC5GXfnifSYyeW7X_URDJhOvCxTG09iGmuvIXd330ZdXanoBmbUB3wpOcIORP1CakEzevsjtJKynhw==@protonmail.internalid>
 <20250617131446.25551-1-pranav.tyagi03@gmail.com> <huml6d5naz4kf6a3kh5g74dyrtivlaqyzajzwwmyvnpsqhuj3d@7zazaxb3225t>
In-Reply-To: <huml6d5naz4kf6a3kh5g74dyrtivlaqyzajzwwmyvnpsqhuj3d@7zazaxb3225t>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Mon, 30 Jun 2025 18:18:06 +0530
X-Gm-Features: Ac12FXy4ugl-kesbBpcuHZe6MsZHfUKRgMJ1GachXE79Ciews1udZ0uKWbxXa7Q
Message-ID: <CAH4c4j+dhh9uW=GOoxaaefBTWQtbLeWQs1SqrWwpka9R8mwBTg@mail.gmail.com>
Subject: Re: [PATCH] xfs: replace strncpy with memcpy in xattr listing
To: Carlos Maiolino <cem@kernel.org>
Cc: skhan@linuxfoundation.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 5:49=E2=80=AFPM Carlos Maiolino <cem@kernel.org> wr=
ote:
>
> On Tue, Jun 17, 2025 at 06:44:46PM +0530, Pranav Tyagi wrote:
> > Use memcpy() in place of strncpy() in __xfs_xattr_put_listent().
> > The length is known and a null byte is added manually.
> >
> > No functional change intended.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  fs/xfs/xfs_xattr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
> > index 0f641a9091ec..ac5cecec9aa1 100644
> > --- a/fs/xfs/xfs_xattr.c
> > +++ b/fs/xfs/xfs_xattr.c
> > @@ -243,7 +243,7 @@ __xfs_xattr_put_listent(
> >       offset =3D context->buffer + context->count;
> >       memcpy(offset, prefix, prefix_len);
> >       offset +=3D prefix_len;
> > -     strncpy(offset, (char *)name, namelen);                 /* real n=
ame */
> > +     memcpy(offset, (char *)name, namelen);                  /* real n=
ame */
> >       offset +=3D namelen;
> >       *offset =3D '\0';
>
> What difference does it make?

I intended this to be a cleanup patch as strncpy()
is deprecated and its use discouraged.

Regards
Pranav Tyagi
>
>
> >
> > --
> > 2.49.0
> >
