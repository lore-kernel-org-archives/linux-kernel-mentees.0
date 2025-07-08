Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18185269885
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Jul 2025 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751970012; cv=none; b=hSI5QnduWQ7ZmOC6n8hPzfvlT24CTkmtcqBVG+bTgWvYYRQb2jIViayoemMCSOwhE8pRJj4Bk+fhQKUCe6QGgFCOZbtUj5ZVSKepYSg9L9r/Eyt7t7K7iyQyvfPlYThplSNRzcoi5CmFS362jrZGMeMFxmehPCGZwaihIyv5S3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751970012; c=relaxed/simple;
	bh=D/rugq62NqRvUoEsmLUFEoWjO27aaV0wos1Jt2fg5/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gn7kZDWSMuPK/l9MI7qEJoseAaH9NRvbTk5I9ZaDwmJuhmcQHNTY1ftY2kX0C9vDEnJGz2XyaUAAlIT+gmH+IbcIMQHjqMzgLURl/b9Hk94CVOgfdIfFb73yFe/oJMgTwF9tuBGbL8AXEAqkbez+7+vTSpXMjUQ7f0KqcLSC3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngAyebQ2; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngAyebQ2"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b5226e6beso37813631fa.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Jul 2025 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751970009; x=1752574809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awb6tXNQDJ0dFL9aG2IwmxWJj9BT8w+at9VdX9y3gZ8=;
        b=ngAyebQ2sVqD0EEPUflcMNFMIJOIwMw413SEHLajHr8LShXPOAGiaTQfETkDJ/jMY+
         YhOX7v9nX98wnI6Zx+Qpv9fMhoRLb1AQvM1wgQ9geOuoXO6zuw1Lvwps7ENuwowc2cBW
         2U5k4GqthpR4bdCF93IvT1kM6XDZTX7hPFKF1kw/bx1SOGNEnVHexir5t+L873K8p/8E
         JFLQyCHgrj9FdWs1mLglxhpRa2Fs6o9gwPtssIlV35wHVPeaaWutsgASoXjpwtjVG+Eu
         7qC5vzwEIszZ4EnJnDXLY9Bm1X/kVG6gkKdFoYIvGCky+xyd6OwCKcEbc8SWKQ+NcmTl
         KS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751970009; x=1752574809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Awb6tXNQDJ0dFL9aG2IwmxWJj9BT8w+at9VdX9y3gZ8=;
        b=QzUA3YSFPgpGIPyzNcmV1oMkS/yye7v/WuaaSmSi4R+bb1v30ZaX5l9y+lyNHU5HN3
         emda1qzZjmufbYf4I3R5Rh+uuiC4rcAeGLGTVC1xJH9aDLdIqoBYm3W/YFVDnuzfA7dM
         zdx1IYeF1O94RRazlcKUdffGl3rtxaOdUlAig9iPBj29ypDnEW1Eg369cyhS2X1Rd/Qr
         aKXcNaiiclqUEvjxJ763hXVqJMz+jTXBSAwa5c6tF8Coo1s96SNovEYinbtXZ5o0i48k
         ybRonZE7MQP1aDgGBA3UsiPAJc6Ei8IFvSOCCfciZIKvrucMWo0rMztNFBUBs4Y6cggA
         g7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCULBIpHV+BXKfNvrNP3fqDANEOGnzFcdbEuMC2/kcwd4RAKYHVyf3p4zEv1VITxNdyekvfhMexQf1RBgyDlBvBMfYwojQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyR939GZIruoR/aV1RpSssNlWR5SDcnuRbieW6iXWYPxCZkKC00
	4zU8fgykpV100Qph/7+YTNGsZc0wqwScv3Hz7ogs2I8QhpT4E5POEtTNHX/eHqZTHSE3lQmYVnP
	o8oj+LbFtBqs4xKB+zQasDfC7qbXkYok=
X-Gm-Gg: ASbGnctwKTX3gPYwRvQR+/oDFdheEMpE35rm2SQYFWR54x8u9MhMp4NJAuSUDkq69XJ
	FOiGePquj0GrS4T8l9E0/u2ftRCCafhw8faYRCR7xiD8jhNIgmvKpVf9kC2E845fx0qvNAtrLXY
	eg7PtC3seO/TeaFHEi3hhAjLGuESxRVJ1WP3+IlRphKU3RkGQd8rYpbDtrpaT0WHhHOWzSpztlg
	tlYXA==
X-Google-Smtp-Source: AGHT+IGDNA/hdoUmcRyc8lUIdC6VR0yRoUpGjkizdwlk7FkpbVDTvL8sttZNsL8lYZejDPkViSX9aVc5pKcKshAplco=
X-Received: by 2002:a05:651c:4209:b0:32b:881e:9723 with SMTP id
 38308e7fff4ca-32f092f309emr43000991fa.30.1751970008852; Tue, 08 Jul 2025
 03:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <oxpeGQP7AC5GXfnifSYyeW7X_URDJhOvCxTG09iGmuvIXd330ZdXanoBmbUB3wpOcIORP1CakEzevsjtJKynhw==@protonmail.internalid>
 <20250617131446.25551-1-pranav.tyagi03@gmail.com> <huml6d5naz4kf6a3kh5g74dyrtivlaqyzajzwwmyvnpsqhuj3d@7zazaxb3225t>
 <rkCSJQOnZAt9nfcVUrC8gHDWqHhzMThp3xx38GD2BgJZM4iXJfvVgXZwa21-3xikSHHLO-scI4_47aO-O1d5FQ==@protonmail.internalid>
 <CAH4c4j+dhh9uW=GOoxaaefBTWQtbLeWQs1SqrWwpka9R8mwBTg@mail.gmail.com>
 <aaywkct2isosqxd37njlua4xxxll2vlvv7huhh34ko3ths7iw4@cdgrtvlp3cwh>
 <pygwb44kAWjcvW1e9Rveg6qGlQmY2r81JtgZ1dM1qhWT6DxalgoXub31RDJH0Mcx2S3cNbWTiFXM9o74gelVnA==@protonmail.internalid>
 <CAH4c4jKisoACHNOQH5Cusduu-_51_PcevxYJT3k_o6MjBWsVJw@mail.gmail.com> <l6sjutxf7g3gafcmwtzaadm7ngoqoss5lh6sc4f6naugb3vo2b@e4mdbr43xwge>
In-Reply-To: <l6sjutxf7g3gafcmwtzaadm7ngoqoss5lh6sc4f6naugb3vo2b@e4mdbr43xwge>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 8 Jul 2025 15:49:57 +0530
X-Gm-Features: Ac12FXzcUqWzQrXUdy5z9S1JxAuoOKEZAS97LEvaHWnhsnetkFCia41LgEAWzYE
Message-ID: <CAH4c4j+ocaGrTYUz8t_P02itOZkVPcRRAZPe3iHrgsHjxjN9LQ@mail.gmail.com>
Subject: Re: [PATCH] xfs: replace strncpy with memcpy in xattr listing
To: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, skhan@linuxfoundation.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 3:29=E2=80=AFPM Carlos Maiolino <cem@kernel.org> wro=
te:
>
> On Mon, Jul 07, 2025 at 08:02:06PM +0530, Pranav Tyagi wrote:
> > On Tue, Jul 1, 2025 at 12:04=E2=80=AFAM Carlos Maiolino <cem@kernel.org=
> wrote:
> > >
> > > On Mon, Jun 30, 2025 at 06:18:06PM +0530, Pranav Tyagi wrote:
> > > > On Mon, Jun 30, 2025 at 5:49=E2=80=AFPM Carlos Maiolino <cem@kernel=
.org> wrote:
> > > > >
> > > > > On Tue, Jun 17, 2025 at 06:44:46PM +0530, Pranav Tyagi wrote:
> > > > > > Use memcpy() in place of strncpy() in __xfs_xattr_put_listent()=
.
> > > > > > The length is known and a null byte is added manually.
> > > > > >
> > > > > > No functional change intended.
> > > > > >
> > > > > > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > > > > > ---
> > > > > >  fs/xfs/xfs_xattr.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
> > > > > > index 0f641a9091ec..ac5cecec9aa1 100644
> > > > > > --- a/fs/xfs/xfs_xattr.c
> > > > > > +++ b/fs/xfs/xfs_xattr.c
> > > > > > @@ -243,7 +243,7 @@ __xfs_xattr_put_listent(
> > > > > >       offset =3D context->buffer + context->count;
> > > > > >       memcpy(offset, prefix, prefix_len);
> > > > > >       offset +=3D prefix_len;
> > > > > > -     strncpy(offset, (char *)name, namelen);                 /=
* real name */
> > > > > > +     memcpy(offset, (char *)name, namelen);                  /=
* real name */
> > > > > >       offset +=3D namelen;
> > > > > >       *offset =3D '\0';
> > > > >
> > > > > What difference does it make?
> > > >
> > > > I intended this to be a cleanup patch as strncpy()
> > > > is deprecated and its use discouraged.
> > >
> > > Fair enough. This is the kind of information that's worth
> > > to add to the patch description on your future patches.
> > >
> > > No need to re-send this again.
> > >
> > > Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>
> >
> > Thanks Darrick and Carlos for the Reviewed-by tag.
> >
> > I also wanted to ask if this patch has been queued for merging.
>
> xfs teams sends an ANNOUNCE email every merge done to the for-next
> branch, you can check if your patches are mentioned there, if not
> they are not queued up yet.
>
> Also, you'll likely receive a message saying your patch has been pushed
> into for-next.
>
> Note though that just because your patch has been added to for-next,
> doesn't automatically mean it will be merged. Several tests still
> happens on patches pushed to for-next branch (which are merged into
> linux-next) and linux-next 'after' your patch has been merged into.
>
> So your patch(es) being merged are conditional to that.
>
> Carlos
>

Hi,

Thanks for the clarification. I'll keep an eye on the announce emails
and wait to see if my patch gets mentioned or pushed to the for-next
branch.

Appreciate the insight into the review and testing process. That
helps a lot.

Regards
Pranav Tyagi
> >
> > Regards
> > Pranav Tyagi
> > >
> > > >
> > > > Regards
> > > > Pranav Tyagi
> > > > >
> > > > >
> > > > > >
> > > > > > --
> > > > > > 2.49.0
> > > > > >
> >
