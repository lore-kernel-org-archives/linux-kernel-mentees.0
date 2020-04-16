Return-Path: <SRS0=u3rr=6A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D82DC2BA2B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Apr 2020 23:20:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2573F2078B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Apr 2020 23:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="P1GARF+N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2573F2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDD3E85FC6;
	Thu, 16 Apr 2020 23:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id irNnBvBlTa5v; Thu, 16 Apr 2020 23:20:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 745BC85FC7;
	Thu, 16 Apr 2020 23:20:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E2BCC1AE8;
	Thu, 16 Apr 2020 23:20:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D4A0C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8A25185FC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRYGa-N3Kk2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:20:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1F94E85FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 23:20:43 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f8so227331plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Apr 2020 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oid4502jx5OsVv4L1q5Cd9rnzIb1+xycaGqywcIvDmc=;
 b=P1GARF+NJi/hKDeu3e7WXiqMUzJJ1TPa5ZL+H9WidK8i3Ok+u3ItGbMm8f0h7WKP8h
 VKvcDZV/uCrR72RmlTHJC2Wu2Ns8pOMvMIABo/jP57B5N0nfKzCh3eKh2zOCuYMB/8JM
 ES4CcSIF4ng+h0a+pk3r9bUXRAMWETWzdYO4QI38NLxXoEeuFbr1JiDFKWMzlbyKIkQW
 EJcsZsLkv2KnKK1fGR31Hr8XWI+PKmW9qRSoB3QdoSej0qDdHwn99ywssrxmsc+rUJtt
 KEDyymPb6uStMgTNzip2IAESB5GCJp7vdVrtw/amlJgcuU6oavtnKSCYJq1dvPve/+oJ
 W2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oid4502jx5OsVv4L1q5Cd9rnzIb1+xycaGqywcIvDmc=;
 b=S7jCsaqBFj2R6ENoVsZq4UqguKNb0gX4l6BxpELvLBBVRz09b32tQW6dQizTeb0GS4
 c8Y1hBUUraYgyzK47/RirAZe2m++gQBkIZPPfbn14xXFg5fs5XwevdNVpjhUtgMz677K
 JPxDEDwZ/+H2aDbaMwc1FTSfSOh585ubG8b+68HeeS4iJm8lNaq8CuKmZ6uMpNMHmWKK
 UH/Kd1Si8zdoT2K8gN8zaq2qXHFW38nm7zhRKC9areQDN4vHhfvLxERqvb+k1FHvF3K6
 RCDFqD46mKVQT2i+gqLtRXMS+X6dFB5CVg15xlxhKjgr22mL8fhSoGFCpJxuY/ZuN+co
 qXEw==
X-Gm-Message-State: AGi0PubwBKJ0nFGGCPpVAFNjme4QxbItJcN1i9opCGKPTw1j/nhdxuZw
 1NsBFkrg/JpRsrYUbv8VyymxUeeq+QtY/QaMeWBHEA==
X-Google-Smtp-Source: APiQypL1gv9lxNUxpuv/LgpCAKGRZAyBFLkc8zFH07ZvjhxVjxDqpX/VBKMtcVsZYhDRPwusjIukR+LAefhB2ibng7M=
X-Received: by 2002:a17:90a:e28e:: with SMTP id
 d14mr881656pjz.29.1587079242348; 
 Thu, 16 Apr 2020 16:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200414233753.94978-1-vitor@massaru.org>
In-Reply-To: <20200414233753.94978-1-vitor@massaru.org>
Date: Thu, 16 Apr 2020 16:20:31 -0700
Message-ID: <CAFd5g442ka0c+D+qs7--_ERqn=Bqc3V4AHuER8FLsJi1oesirQ@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: use KUnit defconfig by
	default
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Apr 14, 2020 at 4:37 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> To improve the usability of KUnit, defconfig is used
> by default if no kunitconfig is present.
>
>  * https://bugzilla.kernel.org/show_bug.cgi?id=205259
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
