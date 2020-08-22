Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A191C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 17:27:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 453CA20724
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 17:27:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLlgNJFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 453CA20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E7504203E6;
	Sat, 22 Aug 2020 17:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQyYzlDf-qlE; Sat, 22 Aug 2020 17:27:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B3100203E8;
	Sat, 22 Aug 2020 17:27:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98B9FC07FF;
	Sat, 22 Aug 2020 17:27:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4DFAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 17:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 931EB88098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 17:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFNNk93daltZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 17:27:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7052B88047
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 17:27:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f7so4785976wrw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=aAvQ9JQN4K36RGrM2CyVTkbAmrKISAnR8j6gdpGU0mw=;
 b=FLlgNJFjNZskFxDy0rRvm0/em3Uo2oIG8hBPf2x+dUbOwAH3uv77dyAGV/wIzlypgK
 D8D5f7r85Sbyh/0tR2x3hEOwS+Fqih0E0mdHvh4eCJAHlSh/Pt4kphOlQYCD5ueIQnM+
 /zhc/eV4DYxHGGSqWXUuDpd3pwcxieiTZKQ85bJCIUjbQ1vws9XKaMt+cnX7ffo9FCxV
 /JLA0bHy4pk/TQsQsUhFIY/7LjYCUN5i54sDPxuMHYKpcX+CrjUwqPy/pX4rYNYfRSvF
 3gc2YDUygYQ3dc2Kpsa1l10QdsWxo4aCyL1lMoUVl6RXQAasDeFa0u44R1h/mhMz3lqs
 a6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=aAvQ9JQN4K36RGrM2CyVTkbAmrKISAnR8j6gdpGU0mw=;
 b=gS9kNVvoqQtvNXG24eMbOVfF+y2BbLd3qS2cv4fJKOaBbvwu/1C0NwS+z/8NytHAHt
 BWaDxbmrkRVraTLcUe6glvnwJ22k+EszPEmP9jYXlUFRpd0DzBpGZPsMBKNh7Qs0Rd7H
 hl4h/AuxmsslqT434NdCWCTCKxuL+YpNQ6vQuCMxmS/5DOgpSHu3e2FEKIthtyrxnrcN
 WBV86pQ9IUR9CkmctNc8NpBHUSVHDFERsFd2YEyE2+HSGPz2D1fiathsYhfgxRme1s0V
 ldKMxlGkYAQTVJsbdwmObQeRP1KKeMe+tkZb5PY5fTgcttQmISjaMofnkM9BH2sV9OQi
 iwrA==
X-Gm-Message-State: AOAM532ngmluAIIuh4LmdwCluTW76YDGvPp25rlSMMcWeqY95uQAI6DV
 iQCrhVUNqW0Rvn567/Cq1mE=
X-Google-Smtp-Source: ABdhPJzoyAxGNDpRE+cqEMzElsWBknqNg+mljNbbwh+XkIUeWVtxBBTUVN7f2wjGJnsOIaMzz2H0gg==
X-Received: by 2002:adf:82f6:: with SMTP id 109mr8436245wrc.25.1598117265332; 
 Sat, 22 Aug 2020 10:27:45 -0700 (PDT)
Received: from felia ([2001:16b8:2df2:8300:947f:1524:961a:5d03])
 by smtp.gmail.com with ESMTPSA id b65sm27016170wmd.0.2020.08.22.10.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 10:27:44 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 22 Aug 2020 19:27:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Jay Rajput <jay24rajput@gmail.com>
In-Reply-To: <CACFir3i0jt6e=PWn64Hvwg91Lb2i2eNhhqdoPJjAZvmEVvk6Og@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2008221926190.6653@felia>
References: <CACFir3g8CPiN=63am0aLfEU3n9Ft5+ZQ_qJUHQGqqzj96ePHBA@mail.gmail.com>
 <CACFir3jGNRKgcmdAHYDFeLJeO2mXokG5p6yc0WPS0qwCEKNJ6Q@mail.gmail.com>
 <CAKXUXMx81VxEGEzOX1zhh7ZdGsFGASVMn2Xn9e_MMXyNKjHtRQ@mail.gmail.com>
 <CACFir3jhPhyU1kVkQdzgQ+e4Lq8aqZeT3+dZ6ZsW2b7L9RrBeA@mail.gmail.com>
 <CAKXUXMxqv_bz+FL1Nckq2FD8gMs9Ymmw3j2MukJKsmgX5ambNA@mail.gmail.com>
 <CACFir3iwBLcZoS8UqOy4qvtf8gRaQgbvhHWyCREk4XD-ap+BsQ@mail.gmail.com>
 <CAKXUXMy6waZDaEPWY8g5yyASkoVgCgz6caBqxkZpMMELWOHOcw@mail.gmail.com>
 <CACFir3jUvTFfoF5CxLw3NSAy+bfLx+9qmaJHMoSpFcC0SPsChw@mail.gmail.com>
 <CAKXUXMxJdUiR_u6Kh=5SC-i7yc0fo=2JD_syaEPmQwNHCo57ng@mail.gmail.com>
 <CACFir3i0jt6e=PWn64Hvwg91Lb2i2eNhhqdoPJjAZvmEVvk6Og@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1388471573-1598117264=:6653"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Community Bridge Klever Project
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1388471573-1598117264=:6653
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 19 Aug 2020, Jay Rajput wrote:

>       The next task is to run coccinelle on the kernel sources. You will find documentation on how to set up
>       and run coccinelle in the kernel documentation.
> 
> I suggest you run coccinelle on the latest kernel source, v5.9-rc1.
> 
> Lukas
> 
> Hello,
> 
> I ran the coccinelle, I am attaching the output in a google document. Please have a look and let me know the
> further steps:
> Document link: https://docs.google.com/document/d/1ahWouti1FTenrIL92Ra6JXYlWW-9j4KK8qVdh4VvEr0/edit?usp=sharing
> 
> Thanks and Regards,
> Jay Rajput
>  

Okay, all good. The task in this mentorship is to make CodeChecker import 
the results from coccinelle into the UI.

Look at: 
https://github.com/Ericsson/codechecker/tree/master/tools/report-converter

If you can write a first simple report-converter for coccinelle and your 
prototype shows that you understand what needs to be done, we can devise a 
plan to make a full-fledged proper implementation with documentation, 
tests etc. If the plan is solid, I am happy to mentor you through these 
tasks.
If your implementation works, the rough workflow should be:

make coccicheck > coccicheck_output
report-converter -o coccicheck_report -t coccinelle coccicheck_output
CodeChecker server &
CodeChecker store ./coccicheck_report -n linux

Then, we should see the coccinelle findings nicely presented in the UI.

Of course, it might be possible to modify coccinelle, provide parameters 
to the build target to simplify the parser to be implemented in 
CodeChecker.

If that is not clear, we go back one step in the introduction process of 
the task.

Best regards,

Lukas
--8323329-1388471573-1598117264=:6653
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1388471573-1598117264=:6653--
