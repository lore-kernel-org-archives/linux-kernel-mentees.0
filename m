Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82CAC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 05:54:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D7B2071E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 05:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSOfWG1j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82D7B2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4800788170;
	Tue, 25 Aug 2020 05:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2n42jPOycM3; Tue, 25 Aug 2020 05:54:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2D008816F;
	Tue, 25 Aug 2020 05:54:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B927EC07FF;
	Tue, 25 Aug 2020 05:54:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04A85C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 05:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DD798226F5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 05:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icT8jUw3sIWT
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 05:54:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 1986A22643
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 05:54:23 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id r13so9427360iln.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 22:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PHxBwQUj4UjwBqv80EN8+MK3NofBAmjKGbfHW2Gek6Y=;
 b=JSOfWG1jfi5ZlD1YRC47R/gxME1b/ffJ7LsJEOpU2AzkKkiE+jwmKGsDQaKvkEB1tq
 EQ84TjXop4q0n9gFzh/mINGH5nLqf3RGhEytqVC8zh3e25zck2+Im4D1dgcYff4dmple
 95WHyTvsLODSLBpJx5SonrCEBsOrzfp4eyD/pZcUqMtjU7ZCTfAYT6cT/Jz7FoUmbTFZ
 MNJYx8bwaBO5Oq7hp1WfoLcZuiaNF8IKMjaDyVVsy3pzyMfRsytIlvsNGZHYGjsIh9Gx
 HGv3DFTzPPIKDZ5YxrCXKnPoxyTAJ877FKU6JGe9xi1fgRSt6t7x8/nkn0jflHIvUbU0
 DAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PHxBwQUj4UjwBqv80EN8+MK3NofBAmjKGbfHW2Gek6Y=;
 b=ruL08bO5P5Emy3LOHOPvosOKaDKCfOewlxsAtu7g2zPzEukdkANldwJMifgMH9OGtO
 BgQ+jZ8LRN5WNKBUV3tpXJ/EuGRWsOTiRY0ds7HyvGg18Vu0vIzVzrBSHw5rl5QUISnX
 pKbcv33sZLAL9LRUplBdMqG4kTSLxUCvT5bCzRarWzJ+bnTlb0u7Ilg8NmsbrWHdC5Fc
 hPQ8cLFO7My85YBIxQGpkzqGOmBvLZLcisimvTj9/JrwAUzfoXoJlXNHCSSudTD5WSlA
 HLbl4A8nUomGh0dOPiDlxYZazs9XJ8jW4hAeyM61pFPHrvtV8RiRKud9uD9Lt4ZJLV2B
 +nbg==
X-Gm-Message-State: AOAM533FSmmpmP5pjoYiDq0Xr6yARlFZI+9v7LNCK/I+C7ms9yPj0nJM
 Oz7f+u7WDrH/oD7tBVg6WvB243G0OyQztW2h3tg=
X-Google-Smtp-Source: ABdhPJxoWsCMYOJribMw1ufIskmKR2PEyXCjG05gCY68er10+xNYRRUYuAMB2lAObbzG1le0Qgk7d2EIwJxQCVsOPCY=
X-Received: by 2002:a92:ae06:: with SMTP id s6mr7634374ilh.64.1598334862275;
 Mon, 24 Aug 2020 22:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <alpine.DEB.2.21.2008222117460.20211@felia>
 <20200824083529.m7vqwgbr54lvmcwi@mrinalpandey>
 <alpine.DEB.2.21.2008241054470.2932@felia>
 <20200825045608.t52hx3qc5gg2dvuh@mrinalpandey>
In-Reply-To: <20200825045608.t52hx3qc5gg2dvuh@mrinalpandey>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 25 Aug 2020 07:54:11 +0200
Message-ID: <CAKXUXMzg8UiVooBkVjW7PWWFQu5zsZzG5xr-Y7quf8LfMLHbwg@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
 identifier check for script files
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

> >
> > Can you share those 35 cases you identified?
> >
> > Then, we can discuss the individual changes for those 35 cases.
>
> Sir,
>
> The list is attached herewith and is in the format:
> <first-line> : <file-name>

664 scripts/gcc-plugins/gen-random-seed.sh : #!/bin/sh
664 scripts/nsdeps : #!/bin/sh
664 scripts/spdxcheck-test.sh : #!/bin/sh
664 scripts/xen-hypercalls.sh : #!/bin/sh

These four can all be set to be executable and spdxcheck-test.sh, also
can be a SPDX-License line.

The changes should be clear, can you phrase a commit message and
determine the developers the different patches shall be sent to.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
