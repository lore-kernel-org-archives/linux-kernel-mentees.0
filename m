Return-Path: <SRS0=9x8T=H7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF747C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 21:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAADC60232
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAADC60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EAA4F1C7;
	Mon,  1 Mar 2021 21:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfp8Q_fVcS3g; Mon,  1 Mar 2021 21:57:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FE04F0F3;
	Mon,  1 Mar 2021 21:57:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A0A6C000B;
	Mon,  1 Mar 2021 21:57:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 814FEC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67A64843CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfIb6T868Jhb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:57:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF63F843C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:57:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 3EEB22B8;
 Mon,  1 Mar 2021 21:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3EEB22B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614635860; bh=i6jQL2vEgTZpDiPscbXFNSE/AGEJG68OoQFCzcs14eY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m5sBTavMke52rPDsk6aPF9PVFu/38tbTbHO05WGk4Yxo2KFTQSKKW+4HchgwPXhZ2
 AiNq0lrvJhr6ZD3ClJtjAsAMPB+D/gvmnZBEOHN2Gqo/sS4nX2p8NrX2Kra541iyLe
 7APV/lFPjTnh3CvcptaIGCGTCeGvifyCY7arlJgzUfUkux4gOBrNEtbvLLF2A4xptP
 3M8jwv3thGIdhu5HGz95SQsB0M4C6VsiRhqW/SqrIRO4ivW+tSCcHaUTW0qT3PPUOA
 a+p6Hi7m3CKGtdVtw0AtdNY5EWaa7JMOqXaygxmiFcMYhcxVTDFocH2VqwoP/JxdYz
 iYWm5kTF3P/Ww==
From: Jonathan Corbet <corbet@lwn.net>
To: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 mchehab@kernel.org
Subject: Re: [PATCH v8 0/3] checkpatch: add verbose mode
In-Reply-To: <70877984ec78d837159dc643e3ae2b05fd91561c.camel@perches.com>
References: <20210226093827.12700-1-dwaipayanray1@gmail.com>
 <87tupu36xi.fsf@meer.lwn.net>
 <70877984ec78d837159dc643e3ae2b05fd91561c.camel@perches.com>
Date: Mon, 01 Mar 2021 14:57:39 -0700
Message-ID: <87czwi35bg.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

Joe Perches <joe@perches.com> writes:

> On Mon, 2021-03-01 at 14:22 -0700, Jonathan Corbet wrote:
>> Dwaipayan Ray <dwaipayanray1@gmail.com> writes:
>> 
>> > Add a new verbose mode to checkpatch. The verbose test
>> > descriptions are read from the new checkpatch documentation
>> > file at `Documentation/dev-tools/checkpatch.rst`, which
>> > is also added by this series.
>> 
>> So I can certainly take the doc change, as requested.  Remind me,
>> though...should I apply the whole set, or will the checkpatch changes go
>> via another path?
>
> There's no dedicated upstream path for checkpatch.
> So please take the checkpatch changes too.

OK, I have just done that.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
