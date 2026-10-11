Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25734468C17
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 11 Oct 2026 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760372; cv=none; b=NiBAGfdziC7VUByt1AqKTsF703fRHfMybGPsx0oQmg0Z2hW7Hb/RjPNLtVz5J68pRxkoUtm7JuVGETDFB7HxtI2vPMl1IRawIicZ1vQ8IJdWPF/Y9Gog1ZjcEnaNn7lQnzVmKcmAWkORjvXxLroiERXbzkdau8a4MPj1yjXciHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760372; c=relaxed/simple;
	bh=oiqejljpC0r+WZwUgtEHk+QEL0SEdtKyU3/JxT4QOkI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iz9TuqKtKT9OIx3wojiK5PQS4RAMNpCqtl9QkCzklWQOBJzZ8mBmqeSFCfAw9H+RWZeYQqJtgxdObSWLZV5ab/UbKW9bN1o9thqrk6TOewMyJlv9yCw6ANBwKpwnPEfstCiQsYewt2wWCdjMCf7WUVk21LkPxkBalU+wAT+DeIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR/5on2i; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR/5on2i"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c315869241fso191292366b.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 11 Oct 2026 16:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791760369; x=1792365169; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RgqrNqMtaQsL974qKMls+lDoPZ135EhOvjmIHmRaXDw=;
        b=CR/5on2iTaoBpfh5Z9cbMukd7US1PoglBbD+ywDC58Yed7SwUQsSNj7qlenP6i9g1A
         fWjDINLLX6wrNWuLebD5S8lQ0z3ByUzxQZXXuH0VD8rcEbLcJqfaxpnafzFvTVNfHMap
         bx4EROZ3GG+K4fGItJUuRS30AslI+bOzfzq0MkhQ1vEdeDbgGWsKAPsad4yJCaqJvx1p
         4eD1GU5DFechxfOM8TIGcxtFbphUOSPr2ujxcHVotZd4GWvtNEX9kNeX8aJlECJrMlek
         ANOY47qPGE0iw8U9tWPogkvwrv8Ji7dqO1MsSnBuKYQfqqoXlHQ32Q8oGYCFRYhH8+6V
         Hcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760369; x=1792365169;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgqrNqMtaQsL974qKMls+lDoPZ135EhOvjmIHmRaXDw=;
        b=AWzrRS1ARtfgZqUqJ7hLrqoMHWY+xxv5yepQcEWqRBPp8pMIdCj4gDeq4jqYWCGOQk
         cTuwgtbPthCt+Vtg7dyygLzJiMlmGXgGHrZ6XglFMWoe69gRC2481+g7t7UlJvSSj+//
         LKCcPo40sTi9OA2/abZJ7idkehh8bxMRnar6i8l/ycGCD3+khGnsOm9GfDvHqFjp3Fig
         nJCC+QDRMUuA78DwLobzGIL5g0855xgvYRvZiJRQaabvAx8+ZtiOJtRoNfdisj40afbT
         3d74GWgyBqcvoHPlU50ctcuHyceqYpE0QigAPn4Vxe0dTrAXA1UTxMS6EptZpsax4sXv
         4HTg==
X-Forwarded-Encrypted: i=1; AKwUvBxcFis7fcWjfDYSrjcBhIhI7eqkcxLJfc/aNGVwCaDWOtnsrzQ20zSr2HwHqVdbsaGnZmdGw/MoC52R81S8y/GnRm/Kkw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJcWrY2Q8LiFKyf5CpfdEi31lU5aMVSioI2/GBKjYumg3ysm3dG
	I5Cehfriboi5tusZ7jocTFb8lTZvvXrOUi8WdEkDH3duYmrSJ5q+G4Sr
X-Gm-Gg: AYBFou1I0Slz4NDJ4w+tRO3IgGn96jMKLK2Yp1LKFqZsvZMH1ACCCa3aTTnRO9Tj59g
	G+WozW240DCGsE8WoYGXiWzmLwbRNvutEPB9paFtNEsOgATGj12yuAt/xFYtPAGuqEA1jUGUFn8
	zSVRGF0hFH42jah0xfkivc/spBUAv8lmMTHutCnZHyW3O0DBqsf4vZQC8wN8eRecMR2Aeko9nKo
	ti7ygB4ShIPureAsfBEG1y1f/qEXcJJe8A5eKej4zSDypywAVLMvC3kzfpY6YVISJLgNk5RjEvI
	AypsQCEtYG/CENyBZFWrg7LMj4FLlZwaXlTmWYwzcfJvxmmiSWXe/fTQnq9D9AS2M3uuFJg7Oge
	sIHpXmXMkJGe000hVigkMag/x+L98ATfdBcWB7QWkZD1RtR3qqZdozq5YdWmG8xYuU9gPHBRFFo
	/72ICUwaZpwlgVQvW9mQHaOjVpd6yPOBnfPmf+A115NWSYCSCOVrCvm3tsniYKHQ5F19GSGpqjR
	oqLwmA7OSX2xNMaCjgI4lf/
X-Received: by 2002:a17:907:9620:b0:c29:5172:6151 with SMTP id a640c23a62f3a-c31aa02998amr786006666b.45.1791760369272;
        Sun, 11 Oct 2026 16:12:49 -0700 (PDT)
Received: from erwin (109241130011.warszawa.vectranet.pl. [109.241.130.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3596566d8bsm4873366b.16.2026.10.11.16.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:12:48 -0700 (PDT)
Sender: =?UTF-8?Q?Micha=C5=82_Nazarewicz?= <mnazarewicz@gmail.com>
From: =?utf-8?Q?Micha=C5=82?= Nazarewicz <mina86@mina86.com>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Neill Kapron <nkapron@google.com>, Shuah Khan
 <shuah@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 raghunathpalla.0209@gmail.com, stable@vger.kernel.org,
 syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free of ffs_dev in
 ffs_free_inst()
In-Reply-To: <20261006204202.59604-1-raghunathpalla.0209@gmail.com>
References: <20261006204202.59604-1-raghunathpalla.0209@gmail.com>
Date: Mon, 12 Oct 2026 01:12:48 +0200
Message-ID: <ebgvv59g1ly3pyekh2c8vg5v@mina86.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06 2026, Palla Raghunath wrote:
> When a function instance is removed through configfs, ffs_free_inst()
> first calls ffs_release_dev(), which takes ffs_dev_lock, detaches the
> dev from its mount and drops the lock again. Only then does it retake
> the lock and free the dev with _ffs_free_dev().

> Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver=
 data cross-references")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
> Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>

Acked-by: Micha=C5=82 Nazarewicz <mina86@mina86.com>

> ---
>  drivers/usb/gadget/function/f_fs.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index c64a268e98a4..f8ea9a980605 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -288,6 +288,7 @@ static struct ffs_dev *_ffs_find_dev(const char *name=
);
>  static struct ffs_dev *_ffs_alloc_dev(void);
>  static void _ffs_free_dev(struct ffs_dev *dev);
>  static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_da=
ta);
> +static void _ffs_release_dev(struct ffs_dev *ffs_dev);
>  static void ffs_release_dev(struct ffs_dev *ffs_dev);
>  static int ffs_ready(struct ffs_data *ffs);
>  static void ffs_closed(struct ffs_data *ffs);
> @@ -4147,8 +4148,8 @@ static void ffs_free_inst(struct usb_function_insta=
nce *f)
>  	struct f_fs_opts *opts;
>=20=20
>  	opts =3D to_f_fs_opts(f);
> -	ffs_release_dev(opts->dev);
>  	ffs_dev_lock();
> +	_ffs_release_dev(opts->dev);
>  	_ffs_free_dev(opts->dev);
>  	ffs_dev_unlock();
>  	kfree(opts);
> @@ -4363,10 +4364,11 @@ static int ffs_acquire_dev(const char *dev_name, =
struct ffs_data *ffs_data)
>  	return ret;
>  }
>=20=20
> -static void ffs_release_dev(struct ffs_dev *ffs_dev)
> +/*
> + * Same as ffs_release_dev(), for callers that already hold ffs_dev_lock.
> + */
> +static void _ffs_release_dev(struct ffs_dev *ffs_dev)
>  {
> -	ffs_dev_lock();
> -
>  	if (ffs_dev && ffs_dev->mounted) {
>  		ffs_dev->mounted =3D false;
>  		if (ffs_dev->ffs_data) {
> @@ -4377,7 +4379,12 @@ static void ffs_release_dev(struct ffs_dev *ffs_de=
v)
>  		if (ffs_dev->ffs_release_dev_callback)
>  			ffs_dev->ffs_release_dev_callback(ffs_dev);
>  	}
> +}
>=20=20
> +static void ffs_release_dev(struct ffs_dev *ffs_dev)
> +{
> +	ffs_dev_lock();
> +	_ffs_release_dev(ffs_dev);
>  	ffs_dev_unlock();
>  }

--=20
Best regards
=E3=83=9F=E3=83=8F=E3=82=A6 =E2=80=9C=F0=9D=93=B6=F0=9D=93=B2=F0=9D=93=B7=
=F0=9D=93=AA86=E2=80=9D =E3=83=8A=E3=82=B6=E3=83=AC=E3=83=B4=E3=82=A3=E3=83=
=84
=C2=ABIf at first you don=E2=80=99t succeed, give up skydiving=C2=BB
