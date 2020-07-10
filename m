Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1869EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:31:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4272068F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuEmcx/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4272068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9A00829478;
	Fri, 10 Jul 2020 21:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSSi32QX+2-k; Fri, 10 Jul 2020 21:31:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D4C1F21F76;
	Fri, 10 Jul 2020 21:31:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2C20C0890;
	Fri, 10 Jul 2020 21:31:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04CD1C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E811E883FE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQX3kYHPeEJT
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:31:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 54077883F0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:31:23 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id r12so6300849ilh.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 14:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uLHnt9pPWsAVsorl32sFgKBBl3I+MJKH37bJcFKtyiE=;
 b=CuEmcx/n6O863Mu5ZUwQtJ99bQXkItVEV9ut6UlQm8iF5Bnc9VHXF+JigYGcUvqxuB
 kkEF1d5g4c6/5QHwC4rwQULHUKDyhiTcUYWWdNnZ7oajnE4XmgYBnbWqE0b6zEsbSTt7
 OWYOKR13ww3grCzPZuKK+/xorxqq9pe3Xh3DEvWBtrpU2mfKRRGNP2ckOQ/SbEzUcXFm
 K+xrnqrZR7o5MH5DsE6Rwu9X7MaSzgdomeC6ynZ6Lbot5VvdgUAE0uL0rgVnygbgnPSG
 g75Bzj+sd1YUba64iz9LvBf4Tje0IvM0cLK1x/utX7N4hERMMTMkG054N/LGOR07VEe1
 Xx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uLHnt9pPWsAVsorl32sFgKBBl3I+MJKH37bJcFKtyiE=;
 b=a5WCIcXFuoJl6dlfLy1ETHPn0x2AwqhJKd0q133TAYy+DUTwDmuvJMxHof8z5pa3eQ
 zRwKGPRw1mRtSn5mYkLdD1xIvBsw8XzzfHKJDu5ipn+D2dQ/3KM3vmp8mORvEHLKi9YQ
 tLFJDa72s/ogX83adz1zXvloySqpgLZFQpOdnArIvIB7FPIQXrv6RO4HEajJGu2nA/m5
 GDK7W2RSxiVM7YO1Su9dHJMb63A//cdKuH3bk/nAQMbjYHSFL6sR/79Ql7SjP2gQ6SRN
 cOVQfb4sDfwe1Ug44j24SEMhTI19JDU4+4UV4OOcx2QeXRBsr9Gu6HXuEtxsbZbAJwnP
 LTMA==
X-Gm-Message-State: AOAM533ADv5IxYwCOMzuTTz83JrcEoT1vSgBZzcms/eJNuDm3ePO0cDG
 Fkakr9/6VQfwmLQc2xrOcg2fDzkReY7nBdULMvY=
X-Google-Smtp-Source: ABdhPJxKqRGtaFyBjWau5G2IuSMxMFdHXg7+dBwsmKyVl83AtGWzPZs2ePkSch4ooGgkNVibWeXP+t7cDDmGNZ+c8b8=
X-Received: by 2002:a05:6e02:11a6:: with SMTP id
 6mr35326538ilj.64.1594416682487; 
 Fri, 10 Jul 2020 14:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
In-Reply-To: <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 10 Jul 2020 23:31:11 +0200
Message-ID: <CAKXUXMzFHnW5Yn5gwXgh3YtwCWfhFjeucMV4-JvX--2rFkFirg@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Adjust spelling
	check false positive
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

>>
>> For Issue 6: Can you provide me the commit hash that caused this
>> checkpatch.pl error? Then, we can reproduce and confirm that issue
>> probably simply with `git format-patch -1 $SHA |
>> ./scripts/checkpatch.pl` and observe the bug and crash ourselves?
>
>
> These are the commit hashes that crashed the checkpatch:
> 6b3e0e2e0461
> 19ce2321739d
> 059c6d68cfc5
>

Okay, I checked the output of checkpatch.pl on those three commits and
I can confirm that checkpatch.pl warns during its own execution with:

Use of uninitialized value $1 in regexp compilation at
./scripts/checkpatch.pl line 2638.

Mrinal, can you debug and find out why and what specifically in those
patches cause this warning in line 2638?

Also, what is the intent and when was this introduced to
checkpatch.pl? It could be that it never worked since it was
introduced or that it broke due to some refactoring. Can you find what
happened in this case here?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
