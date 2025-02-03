Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7120B207
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  3 Feb 2025 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601292; cv=none; b=XrCwpcAmV5qHCuxDaffVO+ysCAVTUjo4oodtzOx4my+kfJ8/cNyb0gSskZrrU6wtaeRdTmVjmB0qPD5+OzLANLxeAhRae+0WcY9uSYEzF9VGYpZEvP0Q4SGSz31e5bR3AJh+tw0TgwQRoPiaqAvso0Z8U6AsY1K+mKb7Bspi9HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601292; c=relaxed/simple;
	bh=RXgtS6w+Qz75NuNjTPyunzgf4Vxw5Lr+hbsncE4PdpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzgFuF9Ybr2iexmj8Y5TADFSPsvdA4HtIkmNuXdrtqvM4HL3pcxy/Dp/w/Q+0o9dtOp/skyeJmGFmAzY0MiRGQCo8VgNTQm3gVkXs+EvK3qNh4DLIxQ9vGLoHpT3tshfQ4B20VPChfqr0Ydi5VWcuiPSSQsc1muUpu8fAwsh7MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgxMDu8+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgxMDu8+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3778bffdso4625052e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 03 Feb 2025 08:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738601289; x=1739206089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hCnNu8tHQ+M6XFMVTD6NE4t308Yd2ZLDZ5yl3jZSkc=;
        b=mgxMDu8+bNItI9k+7c3uBf9fo+LEDnVA2opafzp4Dig+ZsyiDyyN9oNSdWVV4Pdm13
         6Eq0PU+OHPnx6KwFiGppBVY6kfWiEa/+X7rHtRNRMQLCMFl7z80D8ebiIWlVeqKUytha
         cWBV5o2lzjl548vOEEwdZbFGgUkl7+x8IPBd4LPD1mmD7isJk0RtVm87f+XcBGgVv1/o
         NMH9JZJAFA/GncNOSAoPHhnHt84u62pf2Gi9W03aAdl3OC5UEz7psZR7+iXIR4FiKd3P
         PnzEOjhRU/u6Z9Px7BkxBa5cJ82AZAeUMH7Ah8v2b3tUfPSh7AmfUP2tpx0krB3f3Trg
         iMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601289; x=1739206089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hCnNu8tHQ+M6XFMVTD6NE4t308Yd2ZLDZ5yl3jZSkc=;
        b=sPd/z8AVqjNfNHj00mx0hSDkPW5OnK0kjo0/7xmwkRC28SeT5udIbItCmjiAi96dtE
         Rx+/eVnb9Mnb/pLi/qzjbV1CwT7RuYk3RXnTocZ6/mWhjJL8hksC0/Jz6wxPCQP5RSmy
         3N5RdyQPPN+InsWjmnklWWC8y3e23eHu7fq5BtYxT2/1k/0OKCVwocv0m2HnABCdkWRT
         Rw4LntI8mh+LSLA3Xa/35zTcVfXiNRFRl4p49hdWcihvxrQu1S3aX601ryeCmh30z5Fm
         S2We7f+beCU77wxiQm/X423+6ev3PluGBz/eVNDba4gxvx7whKbF54P6hFrUjsUJEetg
         WRIA==
X-Forwarded-Encrypted: i=1; AJvYcCU/WSY9+iPGPKzVFIS4KbD7hKj3ROnHQeVBpWmAsyty9hzAxTf++9IiXbpPwyFiE8zBqvCTregwaKFU6OrTPhMGq2KkcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3Viqj74LEIxTSLfXSzhDR4/SQfo1PcTvTysdEfw51XyYVukpJ
	zG5nKm2o6Zxrm3qYnodF/yno0y+/kpSVh258uOJsKtRZJs3b4sKUOmV4rIWBqNmqDwZj0/x4J/y
	wK/5Tq21Xc/svTf3Hj+mPz1zrWks=
X-Gm-Gg: ASbGncsedEHJ8rOgv7C62vjZVFV+sAmjYojo2MiHMemDD9MHRn2Gn7Bjyxt03lY8BCY
	vjydzS7ukervnJqqaXv8bwHCS05CfeVWc78AxF9l7KP0UKi741pxoXYoEkj8X5e2Gh0sCwpvEWp
	s=
X-Google-Smtp-Source: AGHT+IFkeE09Kp6GM0DqxhVy/w8o5bONXUclTckt0s9gvR1rsgbS+XkGLDaqdqzb0c6WVJ3nJtS6+e4VAec8Uu0gZi4=
X-Received: by 2002:a05:6512:114d:b0:542:6f70:b484 with SMTP id
 2adb3069b0e04-543e4be9947mr6392689e87.12.1738601288578; Mon, 03 Feb 2025
 08:48:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203161920.14028-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250203161920.14028-1-pranav.tyagi03@gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Mon, 3 Feb 2025 22:47:56 +0600
X-Gm-Features: AWEUYZkmnSNI4XBSXdHacSsYEYF2vLXj2PPctbECGWY50HzxMqmtGwdhZHFicKw
Message-ID: <CAABMjtF1fWz5wiRbxUkUcuw1cOVH47NT7B-7KKR5kDN7WHt1YQ@mail.gmail.com>
Subject: Re: [PATCH] documentation grammer correction
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 10:19=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail.=
com> wrote:
Hi Pranav,

Good catch on those grammatical errors!
>
> I am submitting this patch as a part of lfx mentorship application tasks.
> This patch contains grammatical and spelling corrections in the linux
> documentation. Please let me know if any further clarification is
> required.
>
> Regards

This part will end up in the commit log. Basically whatever "email body" yo=
u
put with your patch will end up in the commit log after acceptance. And you
want the commit log to explain what your change does.

To  be more clear:
The subject line of the email becomes the commit title
The email body upto --- will turn into the commit log
Rest is the actual code change.

Now, in case of your subject line you want it to be something like this:
subsystem: your subject text

So, in your case, you want it to be something like:
vgaarbiter: documentation grammar correction

Afterwards, you can proceed with explaining what you did. For example:

"Fix grammar issues in ...."

>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Good job here!

For more information,  you can look into this:
https://www.kernel.org/doc/html/v6.10/process/submitting-patches.html#the-c=
anonical-patch-format

Best Regards,
  -- Khalid Masum
> ---
>  Documentation/gpu/vgaarbiter.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbi=
ter.rst
> index bde3c0afb059..d1e953712cc2 100644
> --- a/Documentation/gpu/vgaarbiter.rst
> +++ b/Documentation/gpu/vgaarbiter.rst
> @@ -11,9 +11,9 @@ Section 7, Legacy Devices.
>
>  The Resource Access Control (RAC) module inside the X server [0] existed=
 for
>  the legacy VGA arbitration task (besides other bus management tasks) whe=
n more
> -than one legacy device co-exists on the same machine. But the problem ha=
ppens
> +than one legacy device co-exist on the same machine. But the problem hap=
pens
>  when these devices are trying to be accessed by different userspace clie=
nts
> -(e.g. two server in parallel). Their address assignments conflict. Moreo=
ver,
> +(e.g. two servers in parallel). Their address assignments conflict. More=
over,
>  ideally, being a userspace application, it is not the role of the X serv=
er to
>  control bus resources. Therefore an arbitration scheme outside of the X =
server
>  is needed to control the sharing of these resources. This document intro=
duces
> @@ -106,7 +106,7 @@ In-kernel interface
>  libpciaccess
>  ------------
>
> -To use the vga arbiter char device it was implemented an API inside the
> +To use the vga arbiter char device, an API was implemented inside the
>  libpciaccess library. One field was added to struct pci_device (each dev=
ice
>  on the system)::
>
> --
> 2.47.1
>
>
