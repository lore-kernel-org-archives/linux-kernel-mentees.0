Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7BC2DCC17
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Jul 2025 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622768; cv=none; b=YRL9eJGLtW84+8QrgAbx7Vc6/p0nBc2P/qRYDUufqycUE0G8xVbd0E6uIMJfSOqCMYOD1TQQpKhROJP8PaApcLQCFnne6XeNfDffkV+vxPhCMc3WgPW4jmr6gJJrWMesI04IhGZL+wcrbtHqmTtiZlU81WF/u/9LVU4O9AhxFGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622768; c=relaxed/simple;
	bh=fJk3jJe2GsDsuplJHVKGRlGVC8VaPj6RPnuA5RW6v/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjBpYQ568gp/QwWY2g1HS19eOeTZAvhcRjgFiYLeVJ8Yr8Cwynaqnffiivtu+kgzSEOo/pzzUDIyBKWegVz3T+dE8QTxMzfWgVd7GUxYcXbs+kBpgDdGmwv2hO4K3+5plgFvLz9UILzcsqzXH1551FCBv9rW1na5o8k4IR1VRM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEjncjEv; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEjncjEv"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b5226e6beso7284911fa.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 04 Jul 2025 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751622765; x=1752227565; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtcggWI0EUkrnHdnx97WWYML+IOpgM/8IBDpI/ZQAlw=;
        b=MEjncjEvUUkglM3I04JJRCGd7jKowgncVr9Z0LeeImBXRH4Pgc8bP1fOeOi9GNLDHG
         xTepEBAVnLcKo/Qh8PUz1T1wBHqHrtiR9RLWoj+RXEtGtkGuKp8zPCKoW6ny7ovCp28K
         Owj6QPq5pqfUYrz02JeL7T+x1R5Wwl3erzbNyAlDzGoZn/j3mgFPNIxFOapmTfdEvYaW
         o8TtSsbtCe24k3PdTPHpDHLjNeEYvtI1cLJBrTrTqhfe/RsO8hRrNNwGzOEIUMnm2PMw
         cR/LKc5vrSTBXtYF7JXV7k8bIkCppfrjQ7WYt6vE/7L3V/O6Q9l9jLbgDDJ00tGDPdP5
         aD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751622765; x=1752227565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtcggWI0EUkrnHdnx97WWYML+IOpgM/8IBDpI/ZQAlw=;
        b=ni0FsjGbjNSaELtb9VjQyy9onPiR3xVTVg/3w5RNacRxz4FCGya5bc+O2sI8HrMA/m
         GXjvSw8u/l0mw/w0guDX+Zy+1MBOs4opGmjaMCmTcgH+KESbQtONFZ1ZgQGbbnpmhLb+
         aeQBs64/P27BhwoxznzF/gt5neS97TjZdG8AzvJQSOaIt6fx1wVZlnnuArwtKOzibtL6
         +uHZfafC9KPkkK0ltLKxO7dPRXvnWKFyckYARmQCayf4oFGtOKtceP2x7OQ4RdjvCffv
         KjfpwutXwTFtIVFAOzUvw6vudqXySKUzTWU809hife+lTvme1wiwQaTrXU2w9tHcBcxX
         uM2w==
X-Forwarded-Encrypted: i=1; AJvYcCUbgSpFxsXORtaQ3ATAGTVpYm211TiZNsVQHkuJ76pwsA8SxE/6tg2JtHbDJInAo6q5EP1CzZUSVbQoExqkoZYVv1+2TA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqPBzq5UuiwJH0VyCff/6n2L0VAHmSjFTxYenYcUviC/uDF+1x
	/9AS6xjtgZhuZ3X5v7sSsZCOiIsP0oGcmz6ne/ZFaPuk0+fXNUngHRll+YqyYfGWee2Yxgm/aae
	4p36yq20Gk/WjRUcOB8z+WCO2T1KvnaE=
X-Gm-Gg: ASbGncuLpf4w2Lw7YmdOHWpTXbZRTglK879rLFttTkvCHGAC5uLVzJ2qcMfFurN0fqM
	9uuHV5SAk9TV9I/EQKRBYECQVXmtOpHAoYVhluO5vyCwdqEjihhEz7q9uXBwMp7H9LMvJ4mJUIg
	fBtOkMuyIoNvI6AgY4XY91PUMKjGW6acopovTvyd1GDtbk/egm4mumoH/mgVBuMPvbB9G2tmgbv
	8ge
X-Google-Smtp-Source: AGHT+IEQJtvURip5Eo1r+T3XuSDUEc12iPmo7gyNNW171IOi7PFDjp+RgiXo0ZnKbXQHoCybXScYJr7aE+3jHaGkQBc=
X-Received: by 2002:a05:651c:2220:b0:32a:7332:bf7a with SMTP id
 38308e7fff4ca-32f00c93008mr4007081fa.13.1751622764562; Fri, 04 Jul 2025
 02:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <nrq9MPwFBIHZRQzC6iAdiUz7uvBdbqKNxdfM8Jus8lTDZCwtPkFMjtJ1V5mkcpX0YX34TYNOddSEOgsXngLtHQ==@protonmail.internalid>
 <20250704072604.13605-1-pranav.tyagi03@gmail.com> <y5d46toqsrrbqfxfioo5yqo532tzqh3f2arsidbe4gq4w3jdqp@rktbxszwtsbh>
In-Reply-To: <y5d46toqsrrbqfxfioo5yqo532tzqh3f2arsidbe4gq4w3jdqp@rktbxszwtsbh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Fri, 4 Jul 2025 15:22:33 +0530
X-Gm-Features: Ac12FXyB3Xh9rJNctZ8qbUMoAf9rw6VaTvRVqfUEGOT7ePXJYmEJ14PIuqSHVSM
Message-ID: <CAH4c4j+Hz8HNzxZhe0DzDAN8vUS3vGN+SL1iMJuXL29AnmQ0cg@mail.gmail.com>
Subject: Re: [PATCH] fs/xfs: replace strncpy with memtostr_pad()
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, djwong@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 2:22=E2=80=AFPM Carlos Maiolino <cem@kernel.org> wro=
te:
>
> On Fri, Jul 04, 2025 at 12:56:04PM +0530, Pranav Tyagi wrote:
> > Replace the deprecated strncpy() with memtostr_pad(). This also avoids
> > the need for separate zeroing using memset(). Mark sb_fname buffer with
> > __nonstring as its size is XFSLABEL_MAX and so no terminating NULL for
> > sb_fname.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202506300953.8b18c4e0-lkp@intel.=
com
>
> Hi Pranav.
>
> Please Read the kernel-test-robot email:
>
> "
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags...
> "
>
> Those tags shouldn't be added here as you are not fixing anything, your
> previous patch have not been committed.
>
> Cheers,
> Carlos
>
Hi Carlos,

Thanks for the clarification. I was confused and thought that "separate
patch" referred to correcting the original one and resending it separately.
I=E2=80=99ll remove the tags and send a v2 shortly.

Regards
Pranav Tyagi

> > ---
> >  fs/xfs/libxfs/xfs_format.h | 2 +-
> >  fs/xfs/xfs_ioctl.c         | 3 +--
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
> > index 9566a7623365..779dac59b1f3 100644
> > --- a/fs/xfs/libxfs/xfs_format.h
> > +++ b/fs/xfs/libxfs/xfs_format.h
> > @@ -112,7 +112,7 @@ typedef struct xfs_sb {
> >       uint16_t        sb_sectsize;    /* volume sector size, bytes */
> >       uint16_t        sb_inodesize;   /* inode size, bytes */
> >       uint16_t        sb_inopblock;   /* inodes per block */
> > -     char            sb_fname[XFSLABEL_MAX]; /* file system name */
> > +     char            sb_fname[XFSLABEL_MAX] __nonstring; /* file syste=
m name */
> >       uint8_t         sb_blocklog;    /* log2 of sb_blocksize */
> >       uint8_t         sb_sectlog;     /* log2 of sb_sectsize */
> >       uint8_t         sb_inodelog;    /* log2 of sb_inodesize */
> > diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> > index d250f7f74e3b..c3e8c5c1084f 100644
> > --- a/fs/xfs/xfs_ioctl.c
> > +++ b/fs/xfs/xfs_ioctl.c
> > @@ -990,9 +990,8 @@ xfs_ioc_getlabel(
> >       BUILD_BUG_ON(sizeof(sbp->sb_fname) > FSLABEL_MAX);
> >
> >       /* 1 larger than sb_fname, so this ensures a trailing NUL char */
> > -     memset(label, 0, sizeof(label));
> >       spin_lock(&mp->m_sb_lock);
> > -     strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
> > +     memtostr_pad(label, sbp->sb_fname);
> >       spin_unlock(&mp->m_sb_lock);
> >
> >       if (copy_to_user(user_label, label, sizeof(label)))
> > --
> > 2.49.0
> >
