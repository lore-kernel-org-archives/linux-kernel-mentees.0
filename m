Return-Path: <SRS0=XQRh=HW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9E7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Feb 2021 06:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E805864E92
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Feb 2021 06:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E805864E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783486F619
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Feb 2021 06:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5OjN66nf-HA
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sat, 20 Feb 2021 06:27:59 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id E9FBF6F4B8; Sat, 20 Feb 2021 06:27:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB3716F4B8;
	Sat, 20 Feb 2021 06:27:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C50FC000B;
	Sat, 20 Feb 2021 06:27:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2189DC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 06:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0707886BB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 06:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LnOpU7UaJeB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 06:27:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EDBA786BA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 06:27:52 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k17so161557ioc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 22:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cbhfHHRIUaZy8yAJGu8fLFh9WOmxHPl60f50bXM7zwo=;
 b=HRXdEKtvf9vgz47G1cFkpU6z5Ea5Es/FYQdYNgksGTbBybgWgmNmEkp4rUNyeQZCoF
 j6O3IUwc75w4wBH7Mh1bZt9eDpgg2aqGR6cesxUI0p9xbwSq/zffQ8GHbt2PuYoJrk6I
 W7yvIBxQ3dSb7b1UItfnH1RnIHgJZDWLvBXP30LSV+PFE8SGhHTTyCS+JISfl4fC/79b
 EV3286239qCeESz+SfqysFOcyp5r7GCJw1NOaS/cl0qQnsmI/MoScMoTyO6SqpgiQLmT
 rscaBLSg2JhOjzaTEn4t++VDAds0L0ho3+jeNtiVleoC8BVL+AmKMc/vp6GCrX+urqBl
 PPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cbhfHHRIUaZy8yAJGu8fLFh9WOmxHPl60f50bXM7zwo=;
 b=cTYQYZB607NY7Hga+klrTfL52MuNtSLzqiSAfm4mrCjHn49OTNfbJ8YVyr9UXzjOO5
 y1337AFnguvDNHUjmhz33PdrVwCwQFuE6KdeV5rxHMQHOVUPtedraG2g5Cd6T9Axhfwx
 IJxaqyz5S0coo65CFSGpwKdHs/b9IbA8idE1nNdr7K8GkJDXhfMCrJyGogKEHvyOWu5B
 9sx3t45+1D6I8Y8kQu0Hx5FpAYMPkYyM0vTvruh9LhGeMN6X3gmTB6WSKl9s5U+MzqXw
 ZiKpmGG/zoRkGCAGEMh6O27p+wk75Cqs+S+EVO5+Kn+2yZ/PpvtaIs74Z2/ObsLxzycd
 Y1yw==
X-Gm-Message-State: AOAM530jdXghDT0vQ9x4RNWBXejI1NW0J6WE4i8R2YjyosNO6zqzt4qr
 0Tf/WB0B+AwewnSG3SyvSYT/09coX4TlidS1+kY=
X-Google-Smtp-Source: ABdhPJx1RfWuVeA2Vy5Otxd772m3nvFKCMmiiHWZ/qHRV3FMId+h+cZs0K/hWTNXSAQ3KtWeZysSnHoTexLEyyMZJc8=
X-Received: by 2002:a5e:8f49:: with SMTP id x9mr7220367iop.189.1613802472221; 
 Fri, 19 Feb 2021 22:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20210217145625.14006-1-yashsri421@gmail.com>
In-Reply-To: <20210217145625.14006-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 20 Feb 2021 07:27:41 +0100
Message-ID: <CAKXUXMx+DEh6Mso_dxA1-NbYZaugUQ9JBfjb4+yyouw2AFPdfA@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix array
 element capture in pointer-to-func parsing
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

On Wed, Feb 17, 2021 at 3:56 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, kernel-doc causes an unexpected error when array element (i.e.,
> "type (*foo[bar])(args)") is present as pointer parameter in
> pointer-to-function parsing.
>
> For e.g., running kernel-doc -none on kernel/gcov/gcc_4_7.c causes this
> error:
> "Use of uninitialized value $param in regexp compilation at ...", in
> combination with:
> "warning: Function parameter or member '' not described in 'gcov_info'"
>
> Here, the parameter parsing does not take into account the presence of
> array element (i.e. square brackets) in $param.
>
> Provide a simple fix by adding square brackets in the regex, responsible
> for capturing $param.
>
> A quick evaluation, by running 'kernel-doc -none' on entire kernel-tree,
> reveals that no additional warning or error has been added or removed by
> the fix.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly over next-20210217
>

Aditya, Jonathan,

I have tested this change with:

git ls-files | xargs ./scripts/kernel-doc -none 2>&1 | tee kernel-doc-output

Applied the patch, and re-ran that command and compared the diff.

First, I observed that ./scripts/kernel-doc is not fully deterministic
on my machine, although I could not really pinpoint it to the exact
reason where that comes in.

Secondly, more importantly, the relevant diff affected by this patch is:

< Use of uninitialized value $param in regexp compilation at
./scripts/kernel-doc line 1559, <IN_FILE> line 308.
< Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 308.
< Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 308.
< Use of uninitialized value $param in substitution (s///) at
./scripts/kernel-doc line 1617, <IN_FILE> line 308.
< Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1651, <IN_FILE> line 308.
< Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1651, <IN_FILE> line 308.
< Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1652, <IN_FILE> line 308.
< Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1654, <IN_FILE> line 308.
< Use of uninitialized value $param in concatenation (.) or string at
./scripts/kernel-doc line 1655, <IN_FILE> line 308.
< drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h:308:
warning: Function parameter or member '' not described in
'brcmf_fweh_info'
< Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1672, <IN_FILE> line 308.


< Use of uninitialized value $param in regexp compilation at
./scripts/kernel-doc line 1559, <IN_FILE> line 96.
< Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 96.
< Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 96.
< Use of uninitialized value $param in substitution (s///) at
./scripts/kernel-doc line 1617, <IN_FILE> line 96.
< Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1651, <IN_FILE> line 96.
< Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1651, <IN_FILE> line 96.
< Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1652, <IN_FILE> line 96.
< Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1654, <IN_FILE> line 96.
< Use of uninitialized value $param in concatenation (.) or string at
./scripts/kernel-doc line 1655, <IN_FILE> line 96.
< kernel/gcov/gcc_4_7.c:96: warning: Function parameter or member ''
not described in 'gcov_info'
< Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1672, <IN_FILE> line 96.

So, I can confirm that the mentioned issue is really resolved with
this patch, and that deserves a tag:

Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks, Aditya. When can we expect the next patch for ./scripts/kernel-doc?

Looking forward to running the next test :)

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
