Return-Path: <SRS0=q8LZ=HR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D38C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 18:24:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F6C64DFD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 18:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F6C64DFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 023C286A01;
	Mon, 15 Feb 2021 18:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tb5W36NJXHPE; Mon, 15 Feb 2021 18:24:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A271F869DF;
	Mon, 15 Feb 2021 18:24:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B066C0893;
	Mon, 15 Feb 2021 18:24:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48738C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 383E7869DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7HNgU-UGn4t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:24:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A96C7867CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 18:24:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::e2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C272B2A0;
 Mon, 15 Feb 2021 18:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C272B2A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1613413453; bh=DUnfItWJCN14J1yb4OPWjTaD3Z5ocs557C6vmLrHVKk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qak9vLUnqMq8bLcu7aQLHKkOnZtkwA4I4FP8pOl9kKJjToKwUvC5WLlhbiadkzw0q
 IuTZxtkfqHT5mggsIKvNvhlgg0LvC0bXkHWlmeOpyBxm6OAvlTdTNq2Sl+GmfgYNKK
 5UsVJzUKmjqkFpmF6lOlsy4kkdXeWY+e3tMTAwhCzsRUgFgviQL6A1WWMJApuselbz
 Dj7SQ2HS2rzEGmw5RbvJlIX8xZeCPPkWOBTHXAWdc/DxyYIyaPHo6EW47kF+3d7LGo
 aVizhT+u1o4Mrat6PoF1HMwFcmPWzCcM170aoE0fuX+S+fez9bGbGrBmEtKssL2Gme
 rG3DFl2Y5muUA==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <5d519211-987e-3367-2ce9-9d1300445bc4@gmail.com>
References: <5d519211-987e-3367-2ce9-9d1300445bc4@gmail.com>
Date: Mon, 15 Feb 2021 11:24:13 -0700
Message-ID: <87v9at42b6.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: yashsri421@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Issues with kernel-doc
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

Aditya <yashsri421@gmail.com> writes:

> Here, although the compiler may not cause any error, kernel-doc emits
> the error as it probably expects "struct struct_name" to occur together.
>
> What do you think about these issues?
> I want to fix these issues, if you agree that they need to be fixed.
>
> There are a few more issues as well, apart from these two. But for the
> start, I want to begin with Uninitialized $param errors.

There is no need to ask permission before sending bug fixes!  I would be
more than happy to receive them.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
