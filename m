Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6B3C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 17:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928C36101C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 17:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928C36101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pesu.pes.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CB0283005;
	Mon, 26 Apr 2021 17:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U20q62XzCb-y; Mon, 26 Apr 2021 17:53:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6213282F9B;
	Mon, 26 Apr 2021 17:53:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FD09C000E;
	Mon, 26 Apr 2021 17:53:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48C2AC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2338883005
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpZYWhiEM_zK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:53:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA12C82F9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:53:00 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id p2so25105914pgh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 10:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gkq+6u4aJWjana+PXPz3rfPaI7gy3M5AW+MTrSZjSuI=;
 b=vqiqLOsk2dEgQy7+23ndN1wQpZPqAHD+wDxz0ZRZrYh+cFzWD+WJ5foLguD7XIZHK6
 +6+rBVIj7TMDDSnQIgAixact0PKzg+n9vcaJLo8bFzOev4X01S6lhbVqGJd289HLo2+z
 FYbeLxSXyzJJ6HcDb0h2vKTSzEO2dK+E2BF3mutW4ruS+GMzbuwmDiKM5RmHOnq+dMzj
 7c4Lh+URI21ksUYPbp8FTR/fGQ7b8PcaAwta4r5n/evstC0LTa2E03WWkx+yA3xv0KMP
 PAJs55bCk1bQNGnw1coHihJPXSvfkdnLGkFW9UPRXIo9s3QJuPFqZmvoe9yaxT1XmrkX
 zE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gkq+6u4aJWjana+PXPz3rfPaI7gy3M5AW+MTrSZjSuI=;
 b=DuLpp97LUT7qIEYOc4ZsdhZrSjKtPfK6UdImHXYK4DEhWRwAo2zHq3u2i3wI6tuN0H
 9ooPZXA/7AfBg4ASNYvcVEeZASa+LdoV1DcgY5kTuk5KqUJaPixCMj40jLtmd7s88FEV
 d9OTyR9YXK4SdZ6PqRRDb6phQQkIlr35PV8q9pLC9NdKT4nmQn+9pCJSr1e38ePam9PW
 1f+/sXVyOfTV78WSQaB6ve0tzyq5Xzw9QHJGdA/kIcoX1nZMjPH6KNMLNOelWuiSeBfB
 F6XlH+OkYvRvxi7CZbYzjvKUTiOnqNtbWjUdogAbom9QE+7iEJ2O0IC6UUP1eHO/Cm1d
 BXfQ==
X-Gm-Message-State: AOAM532N5UHzkcNJXEAZZE2jxF4pGyMev7GosgZC77BlaqD/5Kx21q1L
 e/pD1n1HLd+QfxfhvVuRUhXpBQ==
X-Google-Smtp-Source: ABdhPJxvjPWQjMf7Pn8gwf0tuAB3+nvT1SYTyeTv9FZcVPZwvXnTmeMqi8hqEfrRgFNRzVHU+QHgEg==
X-Received: by 2002:a63:4513:: with SMTP id s19mr17600647pga.34.1619459579958; 
 Mon, 26 Apr 2021 10:52:59 -0700 (PDT)
Received: from localhost ([2406:7400:73:bf98:cdf4:fbe8:4446:3272])
 by smtp.gmail.com with ESMTPSA id p10sm293289pfo.210.2021.04.26.10.52.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 26 Apr 2021 10:52:59 -0700 (PDT)
Date: Mon, 26 Apr 2021 23:22:54 +0530
From: bkkarthik <bkkarthik@pesu.pes.edu>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
Message-ID: <20210426175254.g63l272o4hnagcs2@burgerking>
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
 <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
 <YIZIHR0ZQPXFkOH1@unreal>
 <CAJZ5v0gRv-1qYiN8EXx12iOiJvX7ORzqQfHvtWDnZLtpg6Aijg@mail.gmail.com>
 <YIa3H6kGFXiqWRtg@unreal>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIa3H6kGFXiqWRtg@unreal>
User-Agent: NeoMutt/20171215
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Anupama K Patil <anupamakpatil123@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 kernelnewbies@kernelnewbies.org
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

On 21/04/26 03:50PM, Leon Romanovsky wrote:
> On Mon, Apr 26, 2021 at 02:00:58PM +0200, Rafael J. Wysocki wrote:
> > On Mon, Apr 26, 2021 at 6:57 AM Leon Romanovsky <leon@kernel.org> wrote:
> > >
> > > On Fri, Apr 23, 2021 at 03:08:03PM -0600, Shuah Khan wrote:
> > > > On 4/22/21 12:03 PM, Anupama K Patil wrote:
> > > > > de, e are two variables of the type 'struct proc_dir_entry'
> > > > > which can be removed to save memory. This also fixes a coding style
> > > > > issue reported by checkpatch where we are suggested to make assignment
> > > > > outside the if statement.
> > > > >
> > > >
> > > > Sounds like a reasonable change.
> > >
> > > It is unclear how much changes to ISA code are welcomed.

If changes to ISA code aren't welcomed, should these be marked obsolete in the MAINTIANERS file?

> > 
> > Real fixes and obvious cleanups are, not much more than that.
> 
> While first part is easy to determine, the second one is more blurry.
> 
> > 
> > > According to the Wikipedia, even Windows Vista disabled ISA PnP by default.
> > > https://en.wikipedia.org/wiki/Legacy_Plug_and_Play#Specifications

I wasn't aware until after this reply. Sorry about that!

thanks,

karthik

> > 
> > It is indeed unclear how many systems with this interface still run
> > Linux, but as long as the code is in the tree, there's nothing wrong
> > with attempting to improve it.  There's no assurance that all such
> > patches will be applied, though.
> > 
> > Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
