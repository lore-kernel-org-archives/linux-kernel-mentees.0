Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22F19E998
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743883635; cv=none; b=K/auMAdVvmsp1hzRyBxHVZQxLht0OxUU6U/Wc8OL2DTx3f4YNgxRiykieEruHM9HgyXQp9uonHsuxxzZI9RfNrdRG1zd97YpFMft1ussdIgyTYKpmphzUzA8eS6X/I47oAwF3L9XXydzkfeyhO7DH91FpLkG8mEjdX6hr9Bd6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743883635; c=relaxed/simple;
	bh=s+1xl9zZIPyMcvQv6/4pFdGe03l0dIhLHCNrlLurVYg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgkNCzP7dI5o4SXbL4lFy39Si6Ee9Rf9ofTCeWZ2MNJ0bmUjz5E380kYeC0pcnkiZ3R4WkcSRKyTjz7VlbtuHlj/1NeXwuKAvHIeKXQV9ozaIDB4f05xgCm6B8Gygll+6DHQu1ITI+0jBpGlSEWiy+3HEs5OT07zVZKEi2/n7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaTmHLj+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaTmHLj+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso28443865e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743883632; x=1744488432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkhRHjIp0Jk3pbrjZYxlvTBw6U6EDhWF+U5runkFqfg=;
        b=TaTmHLj+FJms5oEX9rcNqRSJfLlCNpgY5BDskhxAHVX0A3b3dcX4bab0zn9kxzKn6F
         0i0QEqvUTyjaR9L45kD3TXd83T5p9k3rFBF6oJ9Oq3tSNoyxnEdsu8W/4qneqOwYaiGc
         1BkV7ZGvgpcjkmJAO0xjuzyU5HM8DIdNjgx31QO08ZxgeIEYzfxEMl2rul3LMAbTpcsm
         KpH6KX63vbSgek/MqYZxuRAMK6oJpOa3kFNzi7nVP77wJ0aKOtyAs1JD1KiwvYwxBhnZ
         9/i9DKBhSXg47/jJZk/y4UvizZoxPwqD+VvF7WiomispQ516kr4Pyj4uX3OcPoZX+zs9
         EZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743883632; x=1744488432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkhRHjIp0Jk3pbrjZYxlvTBw6U6EDhWF+U5runkFqfg=;
        b=dPfQxfdjw3B2nOVXWzGwN1mTuwUCheh89ZcIuK2iEyOE6LU3osVrJzd3ZcPL0kxZqq
         QHYSVitBTVTInKZ1iVqQmvjVQI7W2PDR3wqjsasV6HIjhRWlH1Xqvn+0Kx4r/ve6u/uc
         MlOwNKTu+97uYijb/IN67OQ7czmuyEUKPWiu/e2fdHAVti1PQPd/2IPZeSPrAaPtLfp2
         wbLdzgratuZv6EQt0bj4ACv73ALEE3I5H1CasayKE4hwzpMr3D8hIkHPfZi2LZ0YpFW4
         5Civw2773TdW6BqwSXehn2RgtaNyoH67SlyltTFUNEzbIo2vm5vZkbAi6hpoePVPzsz0
         NuAw==
X-Forwarded-Encrypted: i=1; AJvYcCXLvgJyB+5Nm9S4gqGNitNFKAZ5t4bIsp6sp2FoLFIAOwwIdkf2Vvs8Gz+9RQoecDJE/uHsv+LLs99+I9UAUHNzMFm38Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMsXc35y9iZLtlbnBuk78nk2Q8V4Z1o/+YcR63jlmVXczX6Wmq
	wEuoFhvfxbElNtgOOqMI0QO3wBQMxp24yNP9HlIoqDnvsblV+zzk
X-Gm-Gg: ASbGncv3upoCASaBCgjceJ/QAxnTduX9jKwVWy3k7JYgH8jQz/5qo1R8W2sl8uxrsNh
	P+K5r69XpmTN0DnCABu1eVDnbZrBLNA4d1FHKI1L1abogwCGUcX7zz6o1dvPwgpRa3CdEwI8BHX
	iOHOU7KmdiOjW9Wq3XOiMhWbm1p4h6oPDIBvZX/GGRzbvYDBWTCqaKil83wWvBD0WrGxag5e5BU
	gNczj8M5RlivLEAeWTDlhvvYcuTby1HpTxruAVKNE9Gwf6DcQEd2RewgnvAIlL4v6MQqlmqPOW2
	DqyuliS5DO8zmaEf4E4DEAHwWr3hNNAr+Whuiim5V6ptaTM6o3OWcfuHiqnEDOybZzn7hm9Au19
	dUB7mmY9r6HPNHB7s5g==
X-Google-Smtp-Source: AGHT+IF4nfvge+ucrCiitotjfMWNu0lp42u6AmcvfVrGTbCSyC9Virf9RRKHitdcFSlJnBqkmsImbg==
X-Received: by 2002:a05:600c:4449:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43ecfa18d6amr51264995e9.28.1743883632150;
        Sat, 05 Apr 2025 13:07:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16f1a73sm85075035e9.24.2025.04.05.13.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:07:11 -0700 (PDT)
Date: Sat, 5 Apr 2025 21:07:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: baris goral <goralbaris@gmail.com>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4] scsi: target: transform strncpy into strscpy
Message-ID: <20250405210710.309ed5d6@pumpkin>
In-Reply-To: <CAJOJxizEDm_th4G=BvejM4_jGcF6+QYT=LjD_J_FTbsNFVTjCQ@mail.gmail.com>
References: <20250402204554.205560-1-goralbaris@gmail.com>
	<20250405143646.10722-1-goralbaris@gmail.com>
	<20250405162548.310dea37@pumpkin>
	<CAJOJxizEDm_th4G=BvejM4_jGcF6+QYT=LjD_J_FTbsNFVTjCQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 5 Apr 2025 19:35:01 +0300
baris goral <goralbaris@gmail.com> wrote:

> Hi,
> Trying to understand, it has if check a few lines above:
>=20
> if (count > (DB_ROOT_LEN - 1))
>=20
> Does not it met our expectations?

Don't top post on mailing lists.

The first issue is that the return value of snprintf() is the number
of characters that would be written into the buffer were it long enough.
The kernel's scnprintf() will return the number of characters written.

But why is it using snprintf() just to copy a string?
Why is truncation at all safe here?
Why is a '\n' being removed without the length being changed.
The length argument to strscpy() should be the length of the destination
(to stop overruns), not the number of characters.
In this case it is the number of characters - so will delete another
character (unless a '\n' was removed).
The return value is just garbage.

You may have opened a bag of worms, but you've also made it worse.

	David

>=20
> David Laight <david.laight.linux@gmail.com>, 5 Nis 2025 Cmt, 18:25
> tarihinde =C5=9Funu yazd=C4=B1:
>=20
> > On Sat,  5 Apr 2025 17:36:47 +0300
> > Baris Can Goral <goralbaris@gmail.com> wrote:
> > =20
> > > The strncpy() function is actively dangerous to use since it may not
> > > NULL-terminate the destination string,resulting in potential memory
> > > content exposures, unbounded reads, or crashes.
> > >
> > > Link:https://github.com/KSPP/linux/issues/90
> > > Signed-off-by: Baris Can Goral <goralbaris@gmail.com>
> > > ---
> > > Changes from v4:
> > >       -Description added
> > >       -User name corrected
> > >       -formatting issues.
> > >       -commit name changed
> > >  drivers/target/target_core_configfs.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/target/target_core_configfs.c =20
> > b/drivers/target/target_core_configfs.c =20
> > > index c40217f44b1b..5c0b74e76be2 100644
> > > --- a/drivers/target/target_core_configfs.c
> > > +++ b/drivers/target/target_core_configfs.c
> > > @@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(stru=
ct =20
> > config_item *item, =20
> > >       }
> > >       filp_close(fp, NULL);
> > >
> > > -     strncpy(db_root, db_root_stage, read_bytes);
> > > +     strscpy(db_root, db_root_stage, read_bytes);
> > >       pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);=
 =20
> >
> > That code is broken, it reads:
> >         read_bytes =3D snprintf(db_root_stage, DB_ROOT_LEN, "%s", page);
> >         if (!read_bytes)
> >                 goto unlock;
> >
> >         if (db_root_stage[read_bytes - 1] =3D=3D '\n')
> >                 db_root_stage[read_bytes - 1] =3D '\0';
> >
> >         /* validate new db root before accepting it */
> >         fp =3D filp_open(db_root_stage, O_RDONLY, 0);
> >         if (IS_ERR(fp)) {
> >                 pr_err("db_root: cannot open: %s\n", db_root_stage);
> >                 goto unlock;
> >         }
> >         if (!S_ISDIR(file_inode(fp)->i_mode)) {
> >                 filp_close(fp, NULL);
> >                 pr_err("db_root: not a directory: %s\n", db_root_stage);
> >                 goto unlock;
> >         }
> >         filp_close(fp, NULL);
> >
> >         strncpy(db_root, db_root_stage, read_bytes);
> >         pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
> >
> >         r =3D read_bytes;
> >
> > unlock:
> >         mutex_unlock(&target_devices_lock);
> >         return r;
> >
> > 'Really nasty (tm)' things happen if 'page' is too long.
> >
> >         David
> > =20
> > >
> > >       r =3D read_bytes;
> > > @@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
> > >       }
> > >       filp_close(fp, NULL);
> > >
> > > -     strncpy(db_root, db_root_stage, DB_ROOT_LEN);
> > > +     strscpy(db_root, db_root_stage, DB_ROOT_LEN);
> > >       pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
> > >  }
> > > =20
> >
> > =20

