Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7BEC64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 20:38:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9B5206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 20:38:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="JT8a4im5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C9B5206E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5783B2E18D;
	Tue,  1 Dec 2020 20:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3L+L-caqfY6; Tue,  1 Dec 2020 20:38:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4163627266;
	Tue,  1 Dec 2020 20:38:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 318CFC0859;
	Tue,  1 Dec 2020 20:38:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25330C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 20:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0C8272E18D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 20:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfrtyW+V1+0o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 20:38:38 +0000 (UTC)
X-Greylist: delayed 00:07:18 by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 1736227266
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 20:38:38 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id 7so2222085qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 12:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZzwh1qZeO2b0+phIivb7f/h0/WTvwlyT6OwTCuU8Go=;
 b=JT8a4im5mRuwETNO39npw148r3340SB50NEKuWNK0T0EuLy6OY9QxvW2zT/YDF2yFp
 UDut3hb/IwScMF6t2XadwaGd+yHJh+yFtyRwrtZpeoHwNKSKSdAMjf3ot8WcDsnZjxqf
 bMAuJ4tVWjR7xLj3IP145iuAhRDUlXYWfYAEA6byKRLe3aotgpbVCFQZZ4gA8DHne6/k
 Rb5mEgw3XQWX9US8bpL1sM9eU5aL+7nYIo7rmz1/s3gQWSI6h3f+hcarRBw7d+JUJAtw
 thynGtAl3j149w2TA2Keiu7Q77qscbMbf9q8yi6/+z56GAa+epwJnUIXluzV9/0K2Q8o
 1Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZzwh1qZeO2b0+phIivb7f/h0/WTvwlyT6OwTCuU8Go=;
 b=DWwhHZzM7mPjK7Zy2gGTKdhKwneIGP1ycKdwD415blqnIQMMaTlz2nRa1x8X2t+DRd
 I8WwtYWGOkeDW3pvh0BwFwT6/TSOZtfrQGolyPuWsZqweBfztkKvQgz6rktpkjz/6y8v
 LISyxQXb1DVR5NUj5Fh0bCpKl8NMqSzKo0pQEvZclVqhbD6qsMNJ5qR7uEE+EIVR7s6S
 rc0vYddXQtTjtdk1LDw9K+d++Cfk38JLa8/WSKIEjcriYYirQ3jbNAD9ZZQJzW3WtO+5
 rH98jzbiNypi1D0z0T7pUkF4M5vAwtt/4fHReOwplRWmTQs2gMjpUHnQ9xmMJih//lar
 Ufcg==
X-Gm-Message-State: AOAM533W/EyefJCwMUesqsFpQWga4NuaHRer8heFXoqIzr8oPa+Zsy9v
 HWe7+p/9wvTW6j5nrh1YW/Y+KtzssJimNh5svJTBx62/odcM
X-Google-Smtp-Source: ABdhPJwORLiqHf9AEcfRZc8YF8T9RnXczT+vC9iTlw0cFtvOwxSpw6bde3sJmjRTqSW8oC8iYZN969xbu1Qx+8dDGiA=
X-Received: by 2002:ac8:679a:: with SMTP id b26mr4823395qtp.79.1606854679256; 
 Tue, 01 Dec 2020 12:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <20201116054150.211562-1-98.arpi@gmail.com>
In-Reply-To: <20201116054150.211562-1-98.arpi@gmail.com>
Date: Tue, 1 Dec 2020 12:30:42 -0800
Message-ID: <CAAXuY3rE9D+QbY-0rfkeFSMUULPkzvqZGsyYhM2Fza2nNt3e3w@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, Theodore Ts'o <tytso@mit.edu>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, David Gow <davidgow@google.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 2/2] fs: ext4: Modify
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

>
> Modify fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.

Reviewed-by: Iurii Zaikin <yzaikin@google.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
