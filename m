Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7656B1D7984
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896372; cv=none; b=aWXSAcSdKBPr25xvLFlK5/d+4w1jz+xmN/ETqCIT1GTg4+/Ao8JuY69ee9U+0Dh+cOIBLj+s7EG+FHpevo+6gwmHJYZCMjNa5Ly9IT4HW4XVY3vYSGQi9e2O3HEpUI4K9idO9vDYBxEY+ea9VKhK4HCGGMggI/VGKUI7iHZ7z58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896372; c=relaxed/simple;
	bh=7J0+HkTXYWDcEOw7KvlwDqgDhLnyM0IzRRcaqPCzpkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0gSGk7e0lHaroCcb4WrtZLsZAfhHaeBPITkKHzQigD7CHWOwwVo5n2mgaWvPm7lnSYZJ3Wr8R+whJBkZLw8G3iFtY1zZnIfw3stC2Oc1sfzEzf2hkx4I3kSi78Z/+ayMWK/w3v6hdyJAYKwEGcCJYCrMkqoJ3rBPgniLB05DRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHA2VZKX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHA2VZKX"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-367874aeeacso21067871fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896367; x=1759501167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fpb7zplNlEXOl8DahnPV19OFE+HVfaJi7nHJwxF/NI=;
        b=fHA2VZKXbT3LAVxrWOXXE0XbQYAqPcofnc8doe+XmykhKoGYG3PEpJedzGc396bT5t
         LSL2qhuQBii4ht410d/2dRPbhGeu6CZFowVl2ltNlINn6rH/LjgGmqqkL5KbN8Ddlegh
         poolB9F/RCt2zeddqSeLGOpLIf9Yh1sSyF+bvTG5QsZ5frPJWKc2PbZ4v4fpiU0FsJ9c
         ozpRJQsovBK5bm8re8hi1SKAjxTwYtH+eHADwZVjhxL5Y2EkLgOh/w8DMYqmY3ZFtsZn
         WcbLKjgZ4uNFki2DH7suIhRF/Bj+3ReCi+aBxKOSR9HaQG28XclSlNnXfHmxpMn55oIX
         KO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896367; x=1759501167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fpb7zplNlEXOl8DahnPV19OFE+HVfaJi7nHJwxF/NI=;
        b=skhkY7pnlmy9zRVpfAt6/Y8Q789B7VwM7l9UiNk9uE1+PMUh2KGj9I5jc/H1yPWl6s
         3ZnmXtLopfeu41epNANgU8v5mdjzimkR1lT4BGmfiItAouT4sV0hwSrcu9p8Vx83PKAC
         KjyxRXmIi83nhNuoUAPR4tqZsbFZecftTk/YpiiUpP/9MLpacv36BoijW80aqSkA8RBz
         frWAAmzxKtzNzhqlMsB8tD/NYLaN+1P9xL1Vk72gMDfda4hmn2oa4TSd1JY4XFBJvk2S
         Z9xDdnHO5+FPLBVP8HuKRxo4FA4Hjr1Q8rpFIWBUymBqBvlTXZGkWb9miGlJtzs1yRyc
         DZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzFseVnhPOLc7Z/h3WntoYfLP7vw6ymVJejpZkaD9FWuyzT8eNQ8IVddnx3pV6ENu7wYEzUPMjL3HpUEhoIlD90V/Gzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZjjS9glLFe5ugS+mKHd7efLtwhpTDWEfGgyCvxQEx6xpigvba
	on7ImJoAFeA45xLTyfEZrCgUlrGa7TYHeXJeSzWrV5ngtHy/fEJwnF762FQzJ2mvgwdO1YykQxS
	u0RfrnW1p6otIs2KwXBr+vJlBB3Hm3nY=
X-Gm-Gg: ASbGnctjkiD7tJ2VPOUTx/uy2CNA2WEfBfrDwe7n/Hq0VK6NSX3II1U9pJF63ZAyzNn
	m5KCVkAu73LPevNeFKndJ5FmaPaYYIHhxpbPJBv180pg0NwAgTxXh6g2PnOfqJyO9dhlDRUZ+U0
	3Woykd6IXqoSvHrebvUD+/Ux3M+Yo4V0+Db2HrEm+HB1b7A5P7KFcz8sSX+VqUZJS4edjwkIFOM
	eXFZx5sWE2plAobLrOlZelkxitK4z+rxhjv972mB2HSGinS6fg=
X-Google-Smtp-Source: AGHT+IEg0+1QXoqdETbA8SDUMeNvDmPKly4QwcMuj46HgcIsQ+bdLFCRP4n9mvzwGVi+rGsRhftydsEC9n815inQwuc=
X-Received: by 2002:a05:651c:549:b0:337:e0e1:d11e with SMTP id
 38308e7fff4ca-36f7d9b746cmr22623801fa.18.1758896366780; Fri, 26 Sep 2025
 07:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250926140729.267766-1-deepak.sharma.472935@gmail.com>
In-Reply-To: <20250926140729.267766-1-deepak.sharma.472935@gmail.com>
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
Date: Fri, 26 Sep 2025 19:47:17 +0530
X-Gm-Features: AS18NWD-8e8l1x8r5L3ZN8abjE-3HFmgFfenVF2L-34K18DJt4SNcxgE42HfByQ
Message-ID: <CABbzaOUQ04seRWn3ik2fnoMddc5uNfzNVfOuNcC+i+dT43isYg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] HID: cp2112: Add parameter validation to data length
To: jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, 
	syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. I did this patch quite a while ago and put
the change log mistakenly into the commit message. Will send a v3
fixing it. Sorry for being clumsy with that

Thanks,
Deepak Sharma

On Fri, Sep 26, 2025 at 7:39=E2=80=AFPM Deepak Sharma
<deepak.sharma.472935@gmail.com> wrote:
>
> This is v2 for the earlier patch, where a few bounds check were
> unnecessarily strict. This patch also removes the use of magic numbers
>
> Syzkaller reported a stack OOB access in cp2112_write_req caused by lack
> of parameter validation for the user input in I2C SMBUS ioctl codeflow
> in the report
>
> I2C device drivers are "responsible for checking all the parameters that
> come from user-space for validity" as specified at Documentation/i2c/dev-=
interface
>
> Add the parameter validation for the data->block[0] to be bounded by
> I2C_SMBUS_BLOCK_MAX + the additional compatibility padding
>
> Reported-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D7617e19c8a59edfbd879
> Tested-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
> Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
> ---
>  drivers/hid/hid-cp2112.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
> index 482f62a78c41..13dcd2470d92 100644
> --- a/drivers/hid/hid-cp2112.c
> +++ b/drivers/hid/hid-cp2112.c
> @@ -689,7 +689,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16=
 addr,
>                         count =3D cp2112_write_read_req(buf, addr, read_l=
ength,
>                                                       command, NULL, 0);
>                 } else {
> -                       count =3D cp2112_write_req(buf, addr, command,
> +                       /* Copy starts from data->block[1] so the length =
can
> +                        * be at max I2C_SMBUS_CLOCK_MAX + 1
> +                        */
> +
> +                       if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
> +                               count =3D -EINVAL;
> +                       else
> +                               count =3D cp2112_write_req(buf, addr, com=
mand,
>                                                  data->block + 1,
>                                                  data->block[0]);
>                 }
> @@ -700,7 +707,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16=
 addr,
>                                                       I2C_SMBUS_BLOCK_MAX=
,
>                                                       command, NULL, 0);
>                 } else {
> -                       count =3D cp2112_write_req(buf, addr, command,
> +                       /* data_length here is data->block[0] + 1
> +                        * so make sure that the data->block[0] is
> +                        * less than or equals I2C_SMBUS_BLOCK_MAX + 1
> +                       */
> +                       if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
> +                               count =3D -EINVAL;
> +                       else
> +                               count =3D cp2112_write_req(buf, addr, com=
mand,
>                                                  data->block,
>                                                  data->block[0] + 1);
>                 }
> @@ -709,7 +723,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16=
 addr,
>                 size =3D I2C_SMBUS_BLOCK_DATA;
>                 read_write =3D I2C_SMBUS_READ;
>
> -               count =3D cp2112_write_read_req(buf, addr, I2C_SMBUS_BLOC=
K_MAX,
> +               /* data_length is data->block[0] + 1, so
> +                * so data->block[0] should be less than or
> +                * equal to the I2C_SMBUS_BLOCK_MAX + 1
> +               */
> +               if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
> +                       count =3D -EINVAL;
> +               else
> +                       count =3D cp2112_write_read_req(buf, addr, I2C_SM=
BUS_BLOCK_MAX,
>                                               command, data->block,
>                                               data->block[0] + 1);
>                 break;
> --
> 2.51.0
>
