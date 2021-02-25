Return-Path: <SRS0=c32l=H3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE162C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 11:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E6164EBD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 11:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E6164EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A168B4EDF3;
	Thu, 25 Feb 2021 11:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bgOY_rRaNa5; Thu, 25 Feb 2021 11:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF074EDEC;
	Thu, 25 Feb 2021 11:48:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D7E0C000A;
	Thu, 25 Feb 2021 11:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B70CFC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 11:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAD5F84025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 11:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uiJ-I9HS0Zex
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 11:48:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FCC684023
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 11:48:12 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id u20so5522394iot.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 03:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p3L7usN+5cmsXeKGLPgVIQPUIqxaAXKtFSZCm0zZ0Hk=;
 b=oBf6vlDmlJBTEeO9ygLoHlDgg7UVVuSXuYc28Nfjg9q3yy/TtXuxWvEJadtVpbFh5a
 tAvKfmgZWO3/LL4wKLwoNl3XrJLB37efdjaupMxFg1k5Ml3I5OutcnzyMrO+MV/GBDNb
 IKSz5lN4anDRqaG99BrmoKRBE0xfPRdOBVuhZ+C6QxKJvbLLRCpbvG6YRvqIAhpk3Z3v
 kyIIHSwXAMFOp8pKoI5Lpz5NY2Vk/WQvtVWs8Yt1QzSdotjyPRIswtg+2z3RiOPlf1EX
 XeKwg9J41LWqHHn/f57g74uR4zXAvZxF3xI4oBcZnDGZtCa2+oQyk6Ur0X5ziG6wRKbV
 PJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p3L7usN+5cmsXeKGLPgVIQPUIqxaAXKtFSZCm0zZ0Hk=;
 b=Y5wJvKIfQrusgphw4hxmtuGI1zGM3jZ6bSAWrOaFNHXPclFnLcN2ECsQkMgK/YkyNz
 es2eQ6CBVnWGO7v3l4N5EyR6e0wcedlcdPm912ViLCtmNjPSP3+M+eR0NQQnIFJqSnti
 POunz0bfygov/ssraZhsohSUZcJCscj/jG7a0McUdcOI1bBT9X4nno3CrNVYz1J75HHf
 eRdh60IbYy4pmb//q+5IqmbwdYzWIqWLCPOOIBqcpPrzppoIrnabE/3a84IOIDCvruW9
 w0VNjc5rQcKCxRiQbtRVvicPEXGdHsmIygsbtDj2uJl2Uhe6bVn0kkJ0EGJIr20DzDBW
 sj+g==
X-Gm-Message-State: AOAM531wWJRPi6+eeNMcF4fF3BNJMGsK3zo3i5VJlITzh5ZHbqchLmpj
 ayWuMlk6VEtuhVWlU24wwuE564exI3DIUst48Kg=
X-Google-Smtp-Source: ABdhPJw/f34MGRY1uPbeITLqjNsfPAa1w+m4HVjyP0Iido2zkqPagHTuhMpIKQSevXUSvu1nuowj0WnT6tPoA7uB/J8=
X-Received: by 2002:a6b:b452:: with SMTP id d79mr2218002iof.183.1614253691517; 
 Thu, 25 Feb 2021 03:48:11 -0800 (PST)
MIME-Version: 1.0
References: <875z2jlr2j.fsf@meer.lwn.net>
 <20210224133002.13503-1-yashsri421@gmail.com>
In-Reply-To: <20210224133002.13503-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 25 Feb 2021 12:48:00 +0100
Message-ID: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
Subject: Re: [RFC v2] scripts: kernel-doc: fix typedef support for
 struct/union parsing
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
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

On Wed, Feb 24, 2021 at 2:30 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, there are 447 files in the kernel tree, which use 'typedef
> struct/union' syntax for defining some struct/union. In total, there
> are ~1290 such occurrences in the kernel tree.
>
> However, kernel-doc does not support it currently, and running
> scripts/kernel-doc -none on emits:
> "error: Cannot parse struct or union!"
>

I will help rephrasing it more precisely:

Currently, there are ~1290 occurrences in 447 files in the kernel tree
'typedef struct/union' syntax for defining some struct/union. However,
kernel-doc currently does not support that syntax. Of the ~1290
occurrences, there are four occurrences in ./include/linux/zstd.h with
typedef struct/union syntax and a preceding kernel-doc; all other
occurrences have no preceding kernel-doc.

Add support for parsing struct/union following this syntax.



I also tested it; here is my quick diff of "git ls-files | xargs
./scripts/kernel-doc -none 2>&1" before and after patch application:

< include/linux/zstd.h:154: error: Cannot parse struct or union!
< include/linux/zstd.h:171: error: Cannot parse struct or union!
< include/linux/zstd.h:181: error: Cannot parse struct or union!
18857d18853
< include/linux/zstd.h:936: error: Cannot parse struct or union!


So, again:

Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Aditya, can you please pick up my rephrasing and send out a v3.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
