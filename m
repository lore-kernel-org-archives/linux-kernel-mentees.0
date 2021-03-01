Return-Path: <SRS0=9x8T=H7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4E5C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 21:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075C0601FD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 21:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075C0601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD1960670;
	Mon,  1 Mar 2021 21:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcBPNAImjzfk; Mon,  1 Mar 2021 21:22:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A90060659;
	Mon,  1 Mar 2021 21:22:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84890C000B;
	Mon,  1 Mar 2021 21:22:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71F27C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60DE16065F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ca5K0lD_ApbT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:22:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD03B60659
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:22:50 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D0AC22BA;
 Mon,  1 Mar 2021 21:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D0AC22BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614633770; bh=VCRXVUkenSuHp0KioD8Z4ZPbBAR1shgvy7q8YJn2q0k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AWsbF5Zp6mmMuhNJAGxIO6wrmTXjReoBnZFoUWdYSjhr7Z/lRGTR1VHPc70H1BzGZ
 sSLc+ZvLZ9vfWrkOFqm5wUZtB+v062cHD0JC1omOaeZHMngCEE2dc3yzxwNFybL/Ne
 TytJlgh28uO/XMZg3WCIKdyHedKM559wqLswH7Y5aZGe8F6R2A+llWrPzQ7kzPBwp/
 BSbbpkUc+MuQEd5zt24S2op5lcDt+RekHRapzsECCwgFoqvqp2n9MmmScEiwJRAm+9
 fRA96d+s0MSAe0WkEQGwlGdtfgoFI8JEhCexcRbq/BNYCch6NJehO8YE7RFtzaQQnU
 frm6rX7C+wcuQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, joe@perches.com,
 mchehab@kernel.org
Subject: Re: [PATCH v8 0/3] checkpatch: add verbose mode
In-Reply-To: <20210226093827.12700-1-dwaipayanray1@gmail.com>
References: <20210226093827.12700-1-dwaipayanray1@gmail.com>
Date: Mon, 01 Mar 2021 14:22:49 -0700
Message-ID: <87tupu36xi.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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

Dwaipayan Ray <dwaipayanray1@gmail.com> writes:

> Add a new verbose mode to checkpatch. The verbose test
> descriptions are read from the new checkpatch documentation
> file at `Documentation/dev-tools/checkpatch.rst`, which
> is also added by this series.

So I can certainly take the doc change, as requested.  Remind me,
though...should I apply the whole set, or will the checkpatch changes go
via another path?

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
