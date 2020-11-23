Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5B3C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 09:34:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC4D2078E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 09:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmYhlrUX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC4D2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6A40B8707A;
	Mon, 23 Nov 2020 09:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTR-B8-lVQZn; Mon, 23 Nov 2020 09:34:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9A6D870BD;
	Mon, 23 Nov 2020 09:34:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92A31C0891;
	Mon, 23 Nov 2020 09:34:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37C9EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1FC152047D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PvFng+1J3r6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:34:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by silver.osuosl.org (Postfix) with ESMTPS id 8E81320467
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:34:10 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id a19so9491148ilm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 01:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4RitpCPmDjDlGEAJRbTLWnKjGTi7opEi23LfN0DfiK0=;
 b=JmYhlrUXC05Q6pp/e8YxdqAawdwPRi3MIwJ5OVC4m1987aw4vbiPTzi+xobrXuFIqa
 oLCvFJ9gr5F31WisCVISOdtmknPmnq4w5w5LQgzWld2NTP5t64GsbhFfOP4CduYuh4fk
 SPIS+rH2phK0Gjg0Q7bS7UYp/cpNqcIKuTWF+P3o6Q08C5KxCTf/VyigKIcrmYCNmjYT
 VHpclvvmvNwInoClVw4fjjJEe9/aK7DJVu3kwQHWh/ErDlFj+wr4LovnZg05gn33j/V2
 ghGYymVHnECqgeBte7ZT3D6+1ypiRixfaURekIeE5sganc1otHhXUfcYEoevMd+ajzgK
 Zdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4RitpCPmDjDlGEAJRbTLWnKjGTi7opEi23LfN0DfiK0=;
 b=FzfcxEgw4JBcTs+zLUR+HJ2/uYnaA95ur7F/kGgl/uVbARWpdOvEpB5zqsZnS+uSVE
 cYUpYnMUVasqmC4Y8qDTv1lI0dhOp1Boly++63xNZOpMp1z6xkrUO5QzhDGy4kC4XYqM
 KKW4Vb20voiaoNKFVC2E5FSrXmf2/eaPFQzRbfHxJKs9sJfOCU1N4BEiI5/0al3cUger
 pQlarwrIROliziMtkmycXkL4QDVNb7U+rkWpMeGgo6CbM9djCY689bY/VPcGwR4qIq5W
 Uf/8/TsXVpeZJhl+DtkbnFAVuWFUwCY/5uUxWQqEy4/xImZH2P4rp2E5e+zLaH7LBbhw
 PvEA==
X-Gm-Message-State: AOAM5321gdyC/+XfxW/6Olkv97rm3xUotXmwCpvfekqmC0FzsAp8V8t+
 9EGLs0yjrZeFYojnM1U5zxFlXsgUsx/hi76EpMc=
X-Google-Smtp-Source: ABdhPJweCU6CkB7pxysdgzdPdcg5iaqtrdYPVlJGsu1KxptcCgDgyrqUK8DnE+lZ98mXbF2rSRHLycZ2Guukm/6S6l8=
X-Received: by 2002:a92:35d7:: with SMTP id c84mr28282675ilf.251.1606124049795; 
 Mon, 23 Nov 2020 01:34:09 -0800 (PST)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 10:33:58 +0100
Message-ID: <CAKXUXMxwPSELEwWT91-+P8azzjxiaoKY8SLKvZVFLUJznvUyBw@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Alternative to checkpatch fix options
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

Dear Aditya and Dwaipayan,

For creating fix options to checkpatch rules, please note that:

Checkpatch has rules to check the commit message and the file diff.
For the commit message, checkpatch is currently the only tool that
checks that content and hence, it is the only tool with which fixes
and fix options can be proposed. For the code style, certain code
conventions, syntactic/semantic bug classes on code/documentation and
the respective file diff, we have many other tools that can check and
suggest/provide fixes.

Currently, I see the prominent option to always consider if a very
limited specific configuration of clang-format would actually address
and fix the rule violation that checkpatch points out. So rather than
trying to implement the fix option in checkpatch with all the
challenges of getting this right (with quite a limited C parsing
functionality in checkpatch), we could simply investigate if one
clang-format invocation on the diff, with a specific formatting rule,
would lead to the same result. If clang-format cannot be configured to
do the right formatting correction for a specific warning, we can move
forward and implement it in checkpatch.

By the way, Joe and Miguel already discussed clang-format (multiple
times); I am not suggesting to make clang-format "the final tool" or
fully replace checkpatch, but it simply might be easier to invoke
clang-format with a limited rule set for specific formatting fixes
rather than trying to implement all of those syntactic fixes in
checkpatch itself.

Aditya, Dwaipayan, can you please consider that option and investigate
the clang-format capability to do the fix before implementing that in
checkpatch?

From a practical perspective, checkpatch could simply emit or invoke
the clang-format command that needs to be run on the patch to do the
fixes. It might take a bit more time in the beginning to understand
how checkpatch rules and clang-format configurations are related and
how to establish a proper synergy between those two tools, but I am
sure that proposing fixes with clang-format is much faster
"configured" than trying to implement them in checkpatch, once the
initial learning curve is overcome.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
