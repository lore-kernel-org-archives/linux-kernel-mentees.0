Return-Path: <SRS0=Gq3P=CJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CC9C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 05:45:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B161520578
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 05:45:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SthwgJj9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B161520578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7372D20492;
	Mon, 31 Aug 2020 05:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coioetNFsaOb; Mon, 31 Aug 2020 05:45:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C02220451;
	Mon, 31 Aug 2020 05:45:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EA13C0052;
	Mon, 31 Aug 2020 05:45:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6094C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B878E85AF1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fInTRbNIvVxq
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:45:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 88C2785AE4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:45:29 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id a26so6863634ejc.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 22:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=QpctQpS39czKh39FA3DsibwWwLFrQ9w8q7Ndiy8iuZ4=;
 b=SthwgJj9Az/3r32xLQsxuUe6T0MewJhKyV/Hco3TxmWIHJj4DepBs8La5TxnUWFCCG
 YDn3y6jKbzNdsEUab+UBYdjdvbPZomqG13t6p8nzlelUtTXVQS1uaGXb80OBXi+4Au46
 1L99scYJ1+LtDsC0z9eqriy6BlmgGSmz/z5KSiSQjMTS1UULHACE/5DaJ3g3oP9V0tn+
 C3kyRGQK3bTbPAdNgXOpiaUidK5MERG8Tl2BHWeof41BecEt9Tnk+4OqBnN8F5QmevL6
 pOXpVep53mhoYUJxxhX6fNo279JakvMOSGWcnagCYOiR+6vNOpVVBtpi5yRoxBjyL1K6
 bkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=QpctQpS39czKh39FA3DsibwWwLFrQ9w8q7Ndiy8iuZ4=;
 b=NY0VgYGbNBBMfCxiajQdVzb918jnITi+CLFUrlpEqg1SQ9GsxTDLbJ1o0D6VnHDUco
 oQTCY6xMEGcKLZ+FOzmGayyEY37+4EFMgA3Oc3PH1TZK9j7DPJ+9gQv6/kz3S9ICchwR
 dfGUtFJTKQ4mgLIU2YsxKMiVo110kTp4PRKYgOfehHLqh86XNNO6eWGHTsn3xmlMHH1L
 ggByhCIru63+bNBSqrwXkRpD8A4dhPKERCDy/nDJFjFtYjIS8NyO7ceax17eV9UY5fl/
 dnprS1zL0vFbERUPUgE8JC//AQhWtA+OH/PMa9VLFcyKndn/XfAkIbHdG4Y58LNx08+G
 zW7w==
X-Gm-Message-State: AOAM531Rr7179USPDIWce3myM4kiGaf/peKZ9QMU1uwJBlvdAZBCrSya
 zpUIianQA4xZyKfrUD4zKlA=
X-Google-Smtp-Source: ABdhPJww5C52aNdNrjE6lwcruAeSoi0YPmIcXls0hV/emdb9wLo+Twlo+eLLVBqIT1XjQOuheM96mQ==
X-Received: by 2002:a17:907:270d:: with SMTP id
 w13mr10151624ejk.191.1598852727702; 
 Sun, 30 Aug 2020 22:45:27 -0700 (PDT)
Received: from felia ([2001:16b8:2de1:2200:9c37:36bb:80e7:91d])
 by smtp.gmail.com with ESMTPSA id t16sm7073952eju.125.2020.08.30.22.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 22:45:27 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 31 Aug 2020 07:45:25 +0200 (CEST)
X-X-Sender: lukas@felia
To: Andrew Morton <akpm@linux-foundation.org>, keescook@chromium.org
In-Reply-To: <20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org>
Message-ID: <alpine.DEB.2.21.2008310714560.8556@felia>
References: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
 <20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-spdx@vger.kernel.org, kernel-hardening@lists.openwall.com,
 maennich@google.com, linux-kernel@vger.kernel.org, re.emese@gmail.com,
 tglx@linutronix.de, Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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



On Sun, 30 Aug 2020, Andrew Morton wrote:

> On Thu, 27 Aug 2020 14:54:05 +0530 Mrinal Pandey <mrinalmni@gmail.com> wrote:
> 
> > commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> > spdxcheck-test.sh to the repository without the executable flag and license
> > information.
> 
> The x bit shouldn't matter.
> 
> If someone downloads and applies patch-5.9.xz (which is a supported way
> of obtaining a kernel) then patch(1) will erase the x bit anyway.
>

Andrew, Kees,

thanks for the feedback.

As his mentor, I see two valuable tasks for Mrinal to work on:

1. Document this knowledge how scripts should be called, not relying on 
the executable bit, probably best somewhere here:
./Documentation/kbuild/makefiles.rst, a new section on using dedicated 
scripts in chapter 3 ("The  kbuild files").

https://www.kernel.org/doc/html/latest/kbuild/makefiles.html#the-kbuild-files

2. Determine if there are places in the build Makefiles that do rely on 
the executable bit and fix those script invocations. (Kees' idea of remove 
all executable bits and see...)


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
