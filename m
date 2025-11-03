Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E8928C871
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  3 Nov 2025 05:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762149369; cv=none; b=F/srCiUjWmJ3CrqqjX8XPldAL8HueeLQz4nEaz6HaQCm+Ciu38BFfUDpNmOctac4HM8A3cwx5ePbN/h5uOFMARusY4A5/wxFDNoVNI3GStF4nrilVGRdOWOiqszm47SOkEpspXEU5LqYRYXR6ZLTDazytQny272MqDZcOrNA4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762149369; c=relaxed/simple;
	bh=UtorwXqAXSaw0nE6ogrsZcNgRw2KJ1yd8pf1qvskGWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWcJFH3TqnCifkEzknDo2+SH1Mox+LTHNL5ZfgthJM0IcC6/tnKV7N02bUlBYfS2GzaLb+QWnVDvU0A+OMkT5u8hhaqJe6mlzWm3BZ7ns2cVAwzr3V+xAxLbL2/lyTencEOVr+bd7P5JqNef982AVbChMp9rgJhI1Ds9eWJ3Eco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeaFxdzY; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeaFxdzY"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-4330fc37de7so9953305ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Nov 2025 21:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762149367; x=1762754167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySAXejUoNq76L1FW98+NXykq6E7oItJRChqh2DI4aaw=;
        b=YeaFxdzYX/+8L6woJbx2aUKoK60OQpMl3rosreWDb4JtC6icSJ3yp+bKQtx/AYaZ4W
         meniyIka2gZ6pIQvBRk9ZyKxiiLkzcu/dza7AVIjDZU0dMJOjwdLOMvyrunCx2AOATP/
         DrPPgjOHGoE1Lr1OnEdMowbJGJzTdAetok5C7YRsFx1fc01VaWiws/Wrb7zPD6Vy45hV
         NK3pToWHf8P2kZlIll1fBNrPqC0ZTSYFmqpLptXGZAyebj/s6ajGJYpzYa4ROp6HlRna
         3ZAlMLfsfYBN+WHQJqxhmMR6xgHBYVsZBU75k96u5dGm75P0fFai/iI26nDkd1mpiHsW
         UNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762149367; x=1762754167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySAXejUoNq76L1FW98+NXykq6E7oItJRChqh2DI4aaw=;
        b=Y4tEL9mw/X99Qzb3JOsOfD/WJF8n4kFnLi8Dfl7vV6KdDQbVA0qC+G+xw/m1TTdFu8
         lKoPgixX9FtV1xXHojXZQ3C7N8miaswi2d2gJXusO2h4FLvywDUD3MYfuEdOSlTGt1z8
         ZxfGXkwGJ0RaWQC6F3Vy9gNulu3Lmwg37vXsAaOWw0NKeeen7AbWusC9vTQdqEzI9xz5
         /lTK7L6HarN/3np62CunX2EfqP/hy6VgfoUMWSrtipgFq7vp8UBkZTycYqoK9zYwtBq/
         UXpw/IUHGfz/A2Y1z+hlY1x3kIzJdUmoNh5+Kive3IAsEObG4ZaHEdzGZuTPBZvv1QhO
         offA==
X-Forwarded-Encrypted: i=1; AJvYcCVsHNjDVeIOxnAeZIia6XvkjVEmSBiHEKgVctKIPVR41ctw8NpX2s9AuVtB3attJqTRrXgMDaFEOjWEl5B6S37CGo32XQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym9k6FaeGvs88N7gvmnd0oSBr6LG50zkauP3TFRh5SMtJ05ooY
	ScyolGD5vEHqI9Rd9p4Lwc93ZMEdJu65auSIMCpFvIIIXfOF+TwT8BoKHX9NIoCRGwKw2uVzZqF
	U75Z0+JN0O7HAYqW6KIi/GXxDLkB00/PcbkmO
X-Gm-Gg: ASbGncvxjBoEet6qpPALU2VB7T8rqtZYGEw9Uk1EuWBCIDOiLBi60VHSPrnNxHiFpIV
	xsXFiqq81jJOyfkbBBzElF7nZSkvzTT1U2FWlYJORKb+OXh/Eardy1mvXovaU5RCxVW/3qjbSF5
	DuVFAb8X0ErmDjQuQeRlTmF6nXS1BmdRA6V02gXuDv6nE9hBjJd+ADEOPzbl060XTTjc8qGl4GC
	Xkly1HT9m4ZlxqaCAeW1kes7Rco4QWgPmQFWXOrNS2MQX2xPGhZ4MM7jWh/Za8e1TW2y+FM
X-Google-Smtp-Source: AGHT+IHz1WqkJLOQpAsugUSR9cfTeJQ8hKAkloJI+TOdjd0I04a3WY4GgJThMDp9IKVL0MBacyB/e/dDtgeh3QWSt4c=
X-Received: by 2002:a05:6e02:1566:b0:433:3487:ea29 with SMTP id
 e9e14a558f8ab-4333487eb72mr651165ab.6.1762149367038; Sun, 02 Nov 2025
 21:56:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015094117.535157-1-rk0006818@gmail.com>
In-Reply-To: <20251015094117.535157-1-rk0006818@gmail.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Mon, 3 Nov 2025 11:25:56 +0530
X-Gm-Features: AWmQ_bmsn8XGUapnm_MiE-Vh-5KxCGmgAdRjXmPAKJIrnxfKalBNNin0FQp-UH8
Message-ID: <CAKY2RybBidcyMtUY8mwyT=F2e5f=HT9HR6JXmgz+UyU6_S3kUQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: stratix10-rsu: replace scnprintf() with
 sysfs_emit() in *_show() functions
To: dinguyen@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 3:11=E2=80=AFPM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Replace scnprintf() with sysfs_emit() in sysfs *_show() functions
> in stratix10-rsu.c to follow the kernel's guidelines from
> Documentation/filesystems/sysfs.rst.
>
> This improves consistency, safety, and makes the code easier to
> maintain and update in the future.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
>  drivers/firmware/stratix10-rsu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/stratix10-rsu.c b/drivers/firmware/stratix1=
0-rsu.c
> index 1ea39a0a76c7..53c896ceca9a 100644
> --- a/drivers/firmware/stratix10-rsu.c
> +++ b/drivers/firmware/stratix10-rsu.c
> @@ -454,8 +454,7 @@ static ssize_t max_retry_show(struct device *dev,
>         if (!priv)
>                 return -ENODEV;
>
> -       return scnprintf(buf, sizeof(priv->max_retry),
> -                        "0x%08x\n", priv->max_retry);
> +       return sysfs_emit(buf, "0x%08x\n", priv->max_retry);
>  }
>
>  static ssize_t dcmf0_show(struct device *dev,
> @@ -632,7 +631,7 @@ static ssize_t spt0_address_show(struct device *dev,
>         if (priv->spt0_address =3D=3D INVALID_SPT_ADDRESS)
>                 return -EIO;
>
> -       return scnprintf(buf, PAGE_SIZE, "0x%08lx\n", priv->spt0_address)=
;
> +       return sysfs_emit(buf, "0x%08lx\n", priv->spt0_address);
>  }
>
>  static ssize_t spt1_address_show(struct device *dev,
> @@ -646,7 +645,7 @@ static ssize_t spt1_address_show(struct device *dev,
>         if (priv->spt1_address =3D=3D INVALID_SPT_ADDRESS)
>                 return -EIO;
>
> -       return scnprintf(buf, PAGE_SIZE, "0x%08lx\n", priv->spt1_address)=
;
> +       return sysfs_emit(buf, "0x%08lx\n", priv->spt1_address);
>  }
>
>  static DEVICE_ATTR_RO(current_image);
> --
> 2.43.0
>

Hi Dinguyen,

Just following up to see if you=E2=80=99ve had a chance to review this patc=
h,
or if there=E2=80=99s anything more needed from my side.

Link to v1:
https://lore.kernel.org/all/20251015094117.535157-1-rk0006818@gmail.com/

Thanks,
Rahul
