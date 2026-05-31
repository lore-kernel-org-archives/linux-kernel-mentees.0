Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD5829ACDD
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234880; cv=pass; b=r1vWQZjzOJNur7ATqHNxO71fClv5XzGEFHu5tFG2LFBLb+B4FG0vTfYtqK7wJgv4YgBRWuogk3IedbdJNR65/eosi5UorBQV5etKKpUM8fBVkRx3ntdZUj6vDeDvXASk1aiyA6vEZnev1gokTK4gvhsgSavvnGMzZ+yVvimGMRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234880; c=relaxed/simple;
	bh=sRKrVpOBYWRz1+LYXhppMZyOZPgVxDKjQ5CHY9lps6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYMfz0IeD7yZnMQ4bz9tmQjm08lLzVkGy1Nv3cxY3xYvsMtRw5f+zeZqH+O07laXag6vYxdjWhMyV+CN7+ztPs5/P1MReN1ZTadlStp6UFq0WGknhs9StQ3RnBKLzPbCITJwoR1qj4Iwx14gnNvpDtfyM3qS9CexT9qYuPR/77Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsMJobSB; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsMJobSB"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7dc93d02916so31342227b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 06:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780234877; cv=none;
        d=google.com; s=arc-20240605;
        b=NPJ3muykJxR6ommlIUqD08qRMjI85kyltOdx7+9rdbBLtCh3U5yloAkJhEdPHGadIH
         EBQvuHVbqoDCPY+13eAraH7ybSyEyJDwFieXKXiGbiBrX7KvMm7Xv+Edyd1JjU1q0ivw
         veKPF0U9x0Ko7epOc1+TLw6nJpCl3ThzWNSq/U+laWlrnGiIOs2jQn/erPfWiVfK0fqo
         ZTelIOUPOZgjBnoV9c8sCQobNWSToBDHlqmx+TMoBn8iKCW4sddoc/jScJEtxiMtB2RB
         PCLz4UKf7Vo+qPUf3lkql5FdwTmSXEPYMHP4iNty+zyDBglIfDoOxDfX1ynFnlNssUCU
         isig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        fh=z/hh5l9SmEbWn8ObJVxaTMUu+mxe3VfhJyCzv+o7AtU=;
        b=c8mzRP9UsLQI1uq9pK3pJ1xpWgferh9G0G1hiR+1K9GmLOdf7zQSucvVdfmSJp4+4W
         z2sNKx90in/CIH+exfGTVhX7h5YO7V+wawoV0otHLNqcSJThznbSOVl48goIbu7Mr14Q
         huHlWsECOE01EfAHB9225yHHsFY4q8SOrnLq2jSKsKAS6/y89EWSciZuk44HRK2fHiDa
         doTqjDOiRevxn0eEzvRR1rHrEFbBIYSRnT9/CF85DicEdiBkKSHImVwGJ1/5DEssrT8K
         wRts3himgUTdUatyzZRrHNBB51Lvw5n5KWTOeDrEBg67p/3qHg3RFs5RcPp+7EVoHdhr
         wNVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780234877; x=1780839677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        b=CsMJobSBvOFFqQzjIkEn2XTV0tMe7iLJnvHpB7y4m1Vqs+cNbOPPf35GV8cg4D1DVH
         AJ/nj3sF/4vkhshupAmyKOh84/syQvl9gxDuZ6w9kyGjmGmtsuNtomeuC/gucA1BoR7U
         +7mTUzq3JhEiOdtqecV3uDY2qeMzyx3fQuQRPKmajoq/BYEPVwsfIydXo9H6/MEDD16I
         WyA7TkeTpDGG2YiR+QSI4f91hyxSujyl1058eYeD1NY6evkPYedmGh+0FfHQgYleGFNn
         Ez7YBXtvFh8uASxSQQ0S2e8w3++0MDZRSvUMLNCaQNNK6r2L3Vvh6Owt7PGnbicpmcW1
         C0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234877; x=1780839677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        b=D7OC/k9zGNMKYT6JzRsihANy0HeRePHJ4Tcf2qT6nGolsjVW71XUQrlpsX95xE4XrM
         YSHLuPfy+9ZhfkAe1K7iXSFuhIl207tjOQB5uPgjIF0dvUJ9wTDICEZN4xhu4xPwZD6q
         7VFGvxrQYRAlxj+9vtqyyVcFSkn7D1DgfmOKnRB7BmWnDZO9cSrM3NBWZvTzL7luo4Nn
         NqHpiknZqiXCNhoKeesqjkj/ERMPST5/46s+y0czQ8VbWQnbtXEFP7gXuWUo3/xhRu+9
         dgoX49oVu0VDyweBuBYQKH+iTu32ZZ2aBhmZd8dn8DfmpsUZcbxX/zz9K0g9jeW7UoET
         2pww==
X-Forwarded-Encrypted: i=1; AFNElJ/kkyhHGfuVtl8X+W/aKcfc2SQKyVDSyj3cZTDbOMePeAl3ub4vSO8wATdngB16MTYCcj418ZmmVH/XvyNS4mr4KeSJxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcYqxcuKgLm3vpm1miFzYsm+p0G0PD+4ySa20v8YUzn+e5kUY/
	EmNKDpHd3Vx4dl/4Mh39U4oMCjKITC/Dh2NhK9H1tc0cPKAf/TVMA2dNNvbI/SLVKIe+MEJUWP1
	nALbsK05dd6Iw8UAZ2wVBsF1y2aG2v8M=
X-Gm-Gg: Acq92OF0exD1mHC+ImIUsYwdXjdchZ++uk+szcIH+N9TdY6pJIoSs5tVqQwrCjbCj7s
	+TPy0lDt4MiMTcam6NjZAa6i8Z+Tnxdh1spR0ecHX77sjh1CktM6HZJoc51Ghv5Y/4h03ciolFj
	R0y+o82aaJ2dYIjsyenG5hZYfcqrU4aZnSFWISg5RDOVthGmizD75egGgHN3wHxc3oFBMQChSBv
	IcvoGuH/BodDRBosVeyc3VuaXX5Np52IhniTSsyT1weEqfBLoM5GPasBTyLUUHBmF2VFHdJZXdL
	KjQ+IcIc5szLZ5TrhJ8fNSdNJpHstu5Wo9rsNHRIp7Br/EHCEe6ew4zGuGxe1gqMBfI1MhOZcki
	VDA==
X-Received: by 2002:a05:690c:c4d1:b0:7bd:5af9:f0a1 with SMTP id
 00721157ae682-7e05d3f3c57mr59371557b3.25.1780234877079; Sun, 31 May 2026
 06:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525033258.144291-1-ninadnaik07@gmail.com>
In-Reply-To: <20260525033258.144291-1-ninadnaik07@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 31 May 2026 15:41:05 +0200
X-Gm-Features: AVHnY4KJfn3MZPFX_KGyjh71dDrddHBfvkTmSAHTLi-XV7OebVew5E4SYYsjU94
Message-ID: <CAOiHx=kdH5TFUxTZdyphy9Xd+i8Gh7nU1Ab9wxLvK1och=JAhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, me@brighamcampbell.com, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

for some reason my email filter didn't catch this ...

On Mon, May 25, 2026 at 5:33=E2=80=AFAM Ninad Naik <ninadnaik07@gmail.com> =
wrote:
>
> Convert the brcm,bcm6358 to DT schema.
>
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>
> Referred to this thread:
> https://lore.kernel.org/all/20250930-brcm6358-to-dt-v1-1-ba833ceb1575@the=
goodpenguin.co.uk/
> and added the fixes suggested.
>
>  .../bindings/leds/brcm,bcm6358-leds.yaml      |  98 ++++++++++++
>  .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
>  2 files changed, 98 insertions(+), 143 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-l=
eds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.t=
xt
>
> diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yam=
l b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> new file mode 100644
> index 000000000000..a61417e5690b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to Broadcom BCM6358 controller
> +
> +description: |
> +  This controller is present on BCM6358 and BCM6368.
> +  In these SoCs there are Serial LEDs (LEDs connected to a 74x164 contro=
ller),
> +  which can either be controlled by software (exporting the 74x164 as sp=
i-gpio.
> +  See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
> +  by hardware using this driver.
> +
> +maintainers:
> +  - Jonas Gorski <jonas.gorski@gmail.com>

The driver and .txt schema were originally submitted by =C3=81lvaro (added
to cc), so I would have expected him to be the (suggested) maintainer.

Best regards,
Jonas
