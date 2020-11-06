Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D52C55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:39:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A1B20735
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="XIn0aYLW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81A1B20735
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC53D8754C;
	Fri,  6 Nov 2020 18:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7tJh4eIki0L; Fri,  6 Nov 2020 18:38:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E02518754A;
	Fri,  6 Nov 2020 18:38:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF448C0893;
	Fri,  6 Nov 2020 18:38:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B1B6C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D19652E11C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWx1eHUTmplH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:38:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 9914E203DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:38:56 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j14so2145529ots.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 10:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YxHuRb9btK6fIk12CKU8DqhKvsu/vUJtkdyol4DJ8ic=;
 b=XIn0aYLWh5cfYI8YC8hnnl+xITpJDnJfsx1CLbBNUc+eCZZd57DKArsvW7NDUqVSt1
 LheCTXJR5A2xA9YYkLBgHiNAFh0oWTUTNf3j6wEN6ZsXKsOSbE4ZvTs4h+FpXAIFXeyt
 Pmij+rPN/c2LZwrq9SM4W6hND4HiVPfiI1cD2ERzy6Hd5GJ0fd6CkwQh6r5w/2ZwMTTA
 +S5xw1FmFZmLSVBxFCRBcLTSF6cmUwmsKCL10xkwBZNcb2q3Lm+IkI5xlJn62nAxiMJP
 xd/L4tYnn0i3ENSMpCo5fGMt6h5HbECCZK40m4p9ZJuA+34kehcoRo8kdBykFutyedKG
 8YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxHuRb9btK6fIk12CKU8DqhKvsu/vUJtkdyol4DJ8ic=;
 b=NxfhvUIMU3es0fbXiq9qa4ayumB+BzGMS284fUUBN6o2GwKqpriw0opFY+9TzkchCr
 Rn2i9QbCSLhr9m3xIAzMI6dTXghZEL/KxArATYlTejFhFbmLpKaRUlfVtKh39V0jz7y2
 K4AxM4CMYWSi9jXIEe1bYJw69V/PgjXItTXWfxhzHHeDkxPvdB7EufOp4hXiK29R05OG
 DGJ8mSBqcDp3zhfOTnrtSRo7M4fGjor2fTEH4s1i83oQ32/7V9lNDEhIKSajEelMZc1n
 g1ARDf94s/viqeQu5RrLQDDMSmRqds8yOX3pk9O08gFhF344cpJ5qlLn4ZQnAkpeL3+r
 N7ug==
X-Gm-Message-State: AOAM530EIbVNG5KfSXjYTABkCY4jYaMVAphIRf0GwEfSH8AawHSXj8r1
 AUoFnpUI5xHpPLv5tIMKm2Sc/t5K4nHmlKET+6G4yw==
X-Google-Smtp-Source: ABdhPJxNcc3J7eTwqEeCUsfredQHDe3wiEWZuB9t+2mZJN3+7jqYuEo+q+e2qHzI5HQK1c1ykKTjqQ8tIuyGLvZ7mOQ=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr1849209oth.251.1604687935680; 
 Fri, 06 Nov 2020 10:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20201106182657.30492-1-98.arpi@gmail.com>
 <20201106182850.30602-1-98.arpi@gmail.com>
In-Reply-To: <20201106182850.30602-1-98.arpi@gmail.com>
Date: Fri, 6 Nov 2020 19:38:44 +0100
Message-ID: <CANpmjNP4+ByVyabqiDy1KW94XBEMG3j4jqugY3kN+C-w1kEVhA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v5 2/2] fs: ext4: Modify
 inode-test.c to use KUnit parameterized testing feature
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 6 Nov 2020 at 19:29, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> Modify fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> ---
[...]
>  fs/ext4/inode-test.c | 314 ++++++++++++++++++++++---------------------
>  1 file changed, 158 insertions(+), 156 deletions(-)

Acked-by: Marco Elver <elver@google.com>

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
