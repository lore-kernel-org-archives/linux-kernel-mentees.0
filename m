Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053C9C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:11:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D8120829
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="c1etfYcK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D8120829
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CE0E72E130;
	Mon, 26 Oct 2020 18:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhtd60cyhGZg; Mon, 26 Oct 2020 18:11:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D76952011B;
	Mon, 26 Oct 2020 18:11:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC1D3C0859;
	Mon, 26 Oct 2020 18:11:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE23BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E0AC88543B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbyowdAqGGJk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:11:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 50D8584DDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:11:40 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id ev17so4748846qvb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXbdbicKVeXDRSO9MY7B1zqIT3oHv+LTHNtkKPt2D2A=;
 b=c1etfYcK4UNhq0LLeOS3Fyh2e89joQELvnJVPIbaj1PWxbTphDsP0AjrZNeoBzlS5Q
 9Vc9V4DtO54YtziHvzgJd/VUGo2LkbvXnN6FWCpvWZCwCL41WH4/MztPmFEl1teTQxqw
 C4yKXYKJY5GpMxboXZzlnSt/9rCemQusXpalfDg7cf8AGFxMol3mWQgoqmtBi0TLleM8
 ge7o+r2S7KDzHYYojoADRVsvln7pDRE2hoW9STGUerFkkVbV7OB4CAO49jRvQU7eCi7c
 CRQVJmVZHnsTkA3QvN2MiHs2yvLPrafKpvtrKpRUZSx0/q56gFdFIsEuXibDEFD4svFx
 fkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXbdbicKVeXDRSO9MY7B1zqIT3oHv+LTHNtkKPt2D2A=;
 b=ia+7TmGpaEwiSC/m1qNCKkQxnyeaaxXC6lFzyOfjq2ALf1i/a1JE9fNj0+vN5QPc7d
 4rxm2EDgHQUIuLxLwEHbMywJ5t4OmeUXadzJghXYiQW2AgoJ/Qtoy0rKV4ksH9dRWqIj
 HJSe/SzM6SIey5+e5GpYISaQ4pc6XQB3UjwuXdMTinlUZqYGn/6/pFDECBNXilF8PEnR
 02Uc0SxZhshgc8tKSkgIhWXGI3zBoCVu8skWdc6vMXT6CcjiXbuclR2/J59xEwK7rZrl
 DC3pgfHyg7bCQX8D6abifItv96Zrw6qXCI+ZjXdd3aHXixEjy9z0b2/RgCRpBMbMsRpe
 N0SQ==
X-Gm-Message-State: AOAM5338NBceM79+/PoL73si92dqOHUuDStCv5vsvvYKbda9QiIk1zAb
 FFd0Olkn6AV+fRkW1V+be+RfKqJWVLjXKkBWAXbZ
X-Google-Smtp-Source: ABdhPJxCVt0hlOpjCr4DRBoxaQZuxsKFgDcYuSZvK1o2Qz94wNBVxtgEEFyFN1OHIAFTWCkpOw8UBiG+JoZum53bHpE=
X-Received: by 2002:ad4:46a8:: with SMTP id br8mr18327630qvb.24.1603735899186; 
 Mon, 26 Oct 2020 11:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201023150536.282568-1-98.arpi@gmail.com>
 <20201023150634.282631-1-98.arpi@gmail.com>
In-Reply-To: <20201023150634.282631-1-98.arpi@gmail.com>
Date: Mon, 26 Oct 2020 11:11:02 -0700
Message-ID: <CAAXuY3q6c3d5kkLOqsG2LBmBYS4d9qRuEeZ2ChpJF1OVTkV5gw@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] fs: ext4: Modify
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
From: Iurii Zaikin via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

> +static struct timestamp_expectation test_data[] = {
Can you mark this and the rest of the hardcoded values as the const they are?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
