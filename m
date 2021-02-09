Return-Path: <SRS0=4kCg=HL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AB3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Feb 2021 04:14:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E475A64EA4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Feb 2021 04:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E475A64EA4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4BCD86BB2;
	Tue,  9 Feb 2021 04:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feqmOzlxZSab; Tue,  9 Feb 2021 04:14:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C1AC86BAB;
	Tue,  9 Feb 2021 04:14:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01FC8C0174;
	Tue,  9 Feb 2021 04:14:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6D13C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Feb 2021 04:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B4CB86BC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Feb 2021 04:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3U3RwO3NQ0il
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Feb 2021 04:14:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6D4AC86BAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Feb 2021 04:14:11 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id o21so3213047qtr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Feb 2021 20:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qNUQIupD3GGLBey1/X5gmVGVkVA7U1s8MGMqjyHWErs=;
 b=EHinha8XUX5Z+3Kr1WENVDD6ag542fYjU7VJLsIQjf5KKzvucAGFBd5aLRqyvDSGGL
 FLmfNZJ5Icsa0z3LuIrTib3J81OA3Jss5FEN7SqA/kAoPhjCDTSauLY8vf5F38zIBIeS
 9o1DOxv58KUS7AkCsMqhwveiGxwnQ+jEixXyLjf9dEoZHIY1oqJr1cnOl6oqNFStNOkE
 VMhuoRrHMQPJ0I2c79UjHi61l5gDHZC7gEr/ivWBHkEojanAV8GUJtWDuMI943W6kCBv
 Xlpg4AQbfR3AcM9o/WpWyomsUiBSZz80MKPie0AovUfa6vEeuBNyuvnbNsOPgxFd7T2n
 IvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qNUQIupD3GGLBey1/X5gmVGVkVA7U1s8MGMqjyHWErs=;
 b=XSd/H7zrKoK3NdvzoAX412nId3XlM9MHp++tup9Xt93K0SvytW1lcno5MVpc62R3in
 Qxid+j8bAAXAr9qnonlJATzLQSO940b+kuPjuUB77CwdPA3zi+/PXXvvFDC1zwYtoupF
 e4fx+yaY1prs8UQ1hnK60YA4WN+VSm0kSU2RVrF/CskvJ9nn4ZbEWAlK4JYi+hRMeSXa
 Kgkg5ldfVwFOzBsQ13Pm17Vig4LisrJhtAhX/8FkufOpxuCJ5IhqF91pHRW6LXgC5tGs
 42Th6sPLMJJKApmAKsLTB7Wpv5fcUSDFSBDefp8wmqo/20gFkkR8Og71I3d8jGsZZs+N
 eDJQ==
X-Gm-Message-State: AOAM533RT6L4AeQcVpforHcRsS/PCu5v71SA713k5zpgo0Y2M+ls8oVX
 BYBppW6lcCN+HAt8y2RVQA6BPa/1q3j7uo984bc=
X-Google-Smtp-Source: ABdhPJw4hSlY3x9H25VdauskB2zRD7i0NBRkAj/2fvfTLzaazIegKU+pR9/T94IME7mmOSuw81O4WbRZ8IzGAlE+fXU=
X-Received: by 2002:a05:622a:453:: with SMTP id
 o19mr18313103qtx.344.1612844050262; 
 Mon, 08 Feb 2021 20:14:10 -0800 (PST)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 9 Feb 2021 05:13:59 +0100
Message-ID: <CAKXUXMzje=kiC5NwdWuFT4sO8d8WXXx3TQkT6HdybrgMU7NBFw@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Investigating ./scripts/kernel-doc for third
	phase of mentorship
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

Hi Aditya,


I have been using ./scripts/kernel-doc lately and noticed a few issues
with this script.
For the third phase, I expect you to investigate the issues on
./scripts/kernel-doc below, describe the issue to the kernel-doc
maintainer, and work on proper support for this parser in kernel-doc.

When running kernel-doc on these files below, you should observe these errors:

./scripts/kernel-doc -none kernel/gcov/gcc_4_7.c

Use of uninitialized value $param in regexp compilation at
./scripts/kernel-doc line 1559, <IN_FILE> line 95.
Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 95.
Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 95.
Use of uninitialized value $param in substitution (s///) at
./scripts/kernel-doc line 1617, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1651, <IN_FILE> line 95.
Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1651, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1652, <IN_FILE> line 95.
Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1654, <IN_FILE> line 95.
Use of uninitialized value $param in concatenation (.) or string at
./scripts/kernel-doc line 1655, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1672, <IN_FILE> line 95.


./scripts/kernel-doc -none include/linux/zstd.h

include/linux/zstd.h:153: error: Cannot parse struct or union!
include/linux/zstd.h:170: error: Cannot parse struct or union!
include/linux/zstd.h:180: error: Cannot parse struct or union!
include/linux/zstd.h:230: error: Cannot parse struct or union!
include/linux/zstd.h:273: error: Cannot parse struct or union!
include/linux/zstd.h:365: error: Cannot parse struct or union!

include/linux/zstd.h:421: error: Cannot parse struct or union!

include/linux/zstd.h:537: error: Cannot parse struct or union!
include/linux/zstd.h:682: error: Cannot parse struct or union!

include/linux/zstd.h:935: error: Cannot parse struct or union!

Can you reproduce these issues?


Further, I would see that you can create two new features for kernel-doc:

- Support for warning types and configuration of build warning flags,
i.e., with -W command-line arguments and output as known for compilers
- Support of default arguments

Let us start with investigation of those issues in the files, though.
Then, we see how complicated it is to resolve those and discuss that
with the maintainer.


Best regards,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
