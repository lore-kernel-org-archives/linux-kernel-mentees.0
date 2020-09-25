Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D95C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 15:35:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5903F22B2D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 15:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQGnqsi9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5903F22B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAB5E86CED;
	Fri, 25 Sep 2020 15:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtJ_GT9itIvn; Fri, 25 Sep 2020 15:35:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7BDD886CE4;
	Fri, 25 Sep 2020 15:35:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E424C0859;
	Fri, 25 Sep 2020 15:35:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4357CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3A9922E152
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrW6CFMRPzu5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id E9FEE2E16B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:35:17 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g29so2918890pgl.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H/9+qYXF9GN9bRK/C5H5FmZN11jhXx2ehr1k98ass28=;
 b=bQGnqsi9trU4rchmHNT+IDgA2k6+MHytIahgg3FdvAvXLkOqo3HSiPipNaPY6tzrU0
 saZMEvvp18hb5cctMiXbAwwdqEtAcLz7sPvZhAyVhlZpBF4LYs/hKpLIA5BlM5T20YeV
 tPTDEoH1GxEm2CV8U0/mJ2mOBJ9L7PUKyJbQqCPOnpyX8ohd15TlgMC+DsiZGV26XGE+
 2z1CA7TU+0K7gKWYNUiZQKGUlLyMebr9WRQx81Q6djTGlGxLXvfJaDgaOcnN1p4Ru3Hc
 IRA49OvXD0yIN8n62rf0CT17tM4MRnhc4nUc9FKLj1sZrJjcK+wxUdsUOgzFdSL/g+p4
 fzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H/9+qYXF9GN9bRK/C5H5FmZN11jhXx2ehr1k98ass28=;
 b=neu+Chr3K/YB4NEHKfIEjHzS66WCparKfYqG8em0grj+JUgVpB3ylDtvyEhibP+JWm
 uydszRsI+7F7JSZgKEIAu98i2vMPvODyVtGx7yvkQ3KVk68XJp8HcoHxJ25o+qbCGW0b
 vZprlUVHjVOoIFW2uU+MKinzwKAQiuSLFJLYXuRxK00cfP8es1lIPtmhQJ0l1F7c48ep
 l5z/1vK6iIihODVKqmgwsKPzQs1NOOKl0ioMnNxeUIWB35168Kv+180Kt8PVziqMrQNs
 Qefn2j3ju2bjZmx5dVoImMNc7lNlsOMhqdcKHilUKbQM/VHnU3tgXwXgt25vC3Xgyryh
 54Bw==
X-Gm-Message-State: AOAM532MjUP/wMTMr3c0pBKBYMqgcqjxI1Uk7bpx2TUtFQxdQ8KIGgv+
 EZHWaQDwyuAuPOezjpNwbQ==
X-Google-Smtp-Source: ABdhPJypCGDd/spbzL267gES6OYRMPR4S4hEJjiFO5vQCn8uHug/BJxwZZg36Chf8IEvIzbCNPLsJw==
X-Received: by 2002:a62:7c43:0:b029:139:858b:8033 with SMTP id
 x64-20020a627c430000b0290139858b8033mr4515529pfc.3.1601048117493; 
 Fri, 25 Sep 2020 08:35:17 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id 123sm2680229pgd.83.2020.09.25.08.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 08:35:16 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:35:09 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20200925153509.GA895804@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925132551.GF438822@phenom.ffwll.local>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access
 for built-in font data buffers
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

On Fri, Sep 25, 2020 at 03:25:51PM +0200, Daniel Vetter wrote:
> I think the only way to make this work is that we have one place which
> takes in the userspace uapi struct, and then converts it once into a
> kernel_console_font. With all the error checking.

Ah, I didn't think of that! When trying to introduce
`kernel_console_font` I ended up using the uapi version and the kernel
version in parallel...

> Then all internal code deals in terms of kernel_console_font, with
> properly typed and named struct members and helper functions and
> everything. And we might need a gradual conversion for this, so that first
> we can convert over invidual console drivers, then subsystems, until at
> the end we've pushed the conversion from uapi array to kernel_console_font
> all the way to the ioctl entry points.
> 
> But that's indeed a huge pile of work, and fair warning: fbcon is
> semi-orphaned, so by doing this you'll pretty much volunteer for
> maintainership :-)
>
> But I'd be very happy to help get this done and throw some maintainership
> credentials at you in the proces ...

Sounds exciting, I will be glad to do this! I'm just a beginner, but I
will try to do what I can do.

Thank you,
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
