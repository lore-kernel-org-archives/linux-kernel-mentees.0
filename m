Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B60C7EE25
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 May 2023 10:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A7261304;
	Fri, 12 May 2023 10:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04A7261304
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JCRV1/NQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CrKHbkqg-EJD; Fri, 12 May 2023 10:46:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9D66F60E7B;
	Fri, 12 May 2023 10:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D66F60E7B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBBF7C008E;
	Fri, 12 May 2023 10:46:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAB59C0036
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 10:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0BF042BD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 10:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0BF042BD9
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JCRV1/NQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wr6eMYptPG35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 10:46:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6496142BCF
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6496142BCF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 10:46:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3075e802738so8875905f8f.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683888384; x=1686480384;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oo67O9FRX0GyvAWrdRm6agPjzPmEBmkG90/e6PxM5KQ=;
 b=JCRV1/NQyGX6dw30BOLJmllahdmyGUPU53QIi9FLiR5Vfnxd/uxH57HFPSk2aiYmXs
 Lwb7Qy3ApHZfdD8luXPgw+oPKlxgc2wRL1wd92LiLKvvrCJe9INCIriCfJXnWkAO19l/
 kasDE6ZhNNTv8R8qVQhXsVjD+0Pf0CBGWWOyhOeIW7RLZnfeBxOiGNtz0pqqUFgqfY0l
 J0JW80xxDmkPygm6LCo7LzDgPQOnKoFh35Rj3+iSTA9CtTrnMcqwV9YNV9RmRfVcP86H
 /nCUaDxSjynHnQx/rk7tXbMkQMzkDE3L0xn8uZCFZH9ojCzgZQdUT8WX4RksSCGlQtKp
 DCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683888384; x=1686480384;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oo67O9FRX0GyvAWrdRm6agPjzPmEBmkG90/e6PxM5KQ=;
 b=HnDu24xlv0zcuOGHwQX3jCEPw0R5pL96qg8v4RjiITdVXuqZRolQWr9FrpHaC7L7pi
 Nki1fUyyOPmXIZ07v/Dqi7BcQ8E59+b5yJM8fjpsEjslGqGgzSUuC2c6VvnnwAa+diCV
 +osU29Cxrn9z6Fg3Zw5JkPl5ka7zfZCrEhoOHcIuV8VpUdTJbobKFqDApwzwH5LlsI+2
 U5tF9Mx7coWw12E7cTYJB7UrNrJSykmu8i4v+Bw5yAnap09Aa8iz4KUIr6FUHqwH4/xm
 2NukZr7IW38moGS73JuL0zhn6M6IZS/LF6Gr0T8Z87YPWXXgu4Ib+C0Jm7rwpDAGmFz2
 Xx2Q==
X-Gm-Message-State: AC+VfDy127QyENyRjbzDao+dQoW3UIqDye2wya6eVP0WtlPvcc3aSxX/
 uscIIPTOM7ox23a7kL4ER5s=
X-Google-Smtp-Source: ACHHUZ7cQ6lAGWPK6qsZqTOzReZDoPCdV311+gW5FWzcfuzQiOK30bhW8w9cTIRqHdDCML34gprPCg==
X-Received: by 2002:a5d:5011:0:b0:307:8a39:5568 with SMTP id
 e17-20020a5d5011000000b003078a395568mr17093589wrt.7.1683888384189; 
 Fri, 12 May 2023 03:46:24 -0700 (PDT)
Received: from localhost ([146.70.133.78]) by smtp.gmail.com with ESMTPSA id
 f12-20020a7bc8cc000000b003f4e4b5713esm5650587wml.37.2023.05.12.03.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 03:46:23 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 12 May 2023 12:46:21 +0200
Message-Id: <CSK8M39MQL2C.3S7JO031H0BA2@vincent-arch>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Peter Geis" <pgwipeout@gmail.com>, "Bjorn Helgaas" <helgaas@kernel.org>
X-Mailer: aerc 0.15.1
References: <CAMdYzYp6=mYSoUHN3TEXVSMbRt1HpRm0X_4RMez09V0XzQewaw@mail.gmail.com>
 <ZFwC/seTfSoaLn0v@bhelgaas>
 <CAMdYzYoa8dhmBx5MUG0yBPwVVXPXHrYNnR0QvKHXvV=JaKuMfw@mail.gmail.com>
In-Reply-To: <CAMdYzYoa8dhmBx5MUG0yBPwVVXPXHrYNnR0QvKHXvV=JaKuMfw@mail.gmail.com>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

> > > Many years ago we ran that issue to ground and with Robin Murphy's
> > > help we found that while it's possible to gracefully handle that
> > > condition it required hijacking the entire arm64 error handling
> > > routine. Not exactly scalable for just one SoC.
> >
> > Do you have a pointer to that discussion?  The URL might save
> > repeating the whole exercise and could be useful for the commit log
> > when we try to resolve this.
>
> The link to the patch email is here, the full discussion is pretty
> easy to follow:
> https://lore.kernel.org/linux-pci/2a381384-9d47-a7e2-679c-780950cd862d@rock-chips.com/
> Also:
> https://lore.kernel.org/linux-rockchip/1f180d4b-9e5d-c829-555b-c9750940361e@web.de/T/#m9c9d4a28a0d3aa064864f188b8ee3b16ce107aff


I have some concerns about the patch proposed in the email that you share. It seems like 
it is quite extensive (code that is it not just related to the HW) just to fix a hardware 
issue. I would have expected the code to fix the bug to be integrated into the driver itself, 
so that if the hardware will died at some point in the future, I would expect that also the 
buddy code will died with it.

However, it is possible that I may have missed something in the patch, 
and my thoughts could be wrong.

> >
> > > The configurable waits allow us to program reasonable times for
> > > 90% of the endpoints that come up in the normal amount of time, while
> > > being able to adjust it for the other 10% that do not. Some require
> > > multiple seconds before they return without error. Part of the reason
> > > we don't want to hardcode the wait time is because the probe isn't
> > > handled asynchronously, so the kernel appears to hang while waiting
> > > for the timeout.
> >
> > Is there some way for users to figure out that they would need this
> > property?  Or is it just "if your kernel panics on boot, try
> > adding or increasing "bus-scan-delay-ms" in your DT?
>
> There's a listing of tested cards at:
> https://wiki.pine64.org/wiki/ROCKPro64_Hardware_compatibility
>
> Most cards work fine that don't require a large BAR. PCIe switches are
> completely dead without the above hack patch. Cards that lie in the
> middle are ones that expect BIOS / EFI support to initialize, or ones
> that have complex boot roms and don't initialize quickly.
> But yes, it's unfortunately going to be "if you panic, increase the
> delay" unless a more complete database of cards can be generated.

This is really unfortunate because as mentioned in some previous emails, 
using sleep time slows down the kernel. Is there any way to tell the kernel 
to tell the kernel "hey we need some more time here", or in computer science 
terms, load a driver asynchronously?

Thanks.

Vincent.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
