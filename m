Return-Path: <SRS0=ha8c=IN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3FAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 08:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5474464E98
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 08:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5474464E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F36E833DB;
	Mon, 15 Mar 2021 08:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kw63cMw6F-Ch; Mon, 15 Mar 2021 08:41:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D1783372;
	Mon, 15 Mar 2021 08:41:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02E3AC000B;
	Mon, 15 Mar 2021 08:41:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DEF1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 301CF430BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id Vcsy-BcO65hF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:41:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id B73DB4016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:41:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615797709; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=9Yz2prTldpg06djW1uSjsLo9RAV7sQVLS2v0kM5ni7Y=;
 b=cy7zrEd/GG/7Fi43w8+HfsA1qi1dJjOANxwxetcqT0YFk4AnmH52jwNd1yVSeu/KGBoM5Rnx
 RYF14m3uNrwR01+l+7ui57WTtb+NmleqlUYpZCeljmAGnRqpILE5w8VfORVdEWRm98jpPH6/
 JMG98doJxx74xTKOP59pnMn6950=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1ODQyZiIsICJsaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 604f1dc01de5dd7b99df341d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 08:41:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B731C43466; Mon, 15 Mar 2021 08:41:36 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C5D0C43463;
 Mon, 15 Mar 2021 08:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C5D0C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 00/10] rsi: fix comment syntax in file headers
References: <20210314201818.27380-1-yashsri421@gmail.com>
 <CAKXUXMzH-cUVeuCT6eM_0iHzgKpzvZUPO6pKNpD0yUp2td09Ug@mail.gmail.com>
Date: Mon, 15 Mar 2021 10:41:30 +0200
In-Reply-To: <CAKXUXMzH-cUVeuCT6eM_0iHzgKpzvZUPO6pKNpD0yUp2td09Ug@mail.gmail.com>
 (Lukas Bulwahn's message of "Mon, 15 Mar 2021 09:01:56 +0100")
Message-ID: <87a6r4u7ut.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Cc: Aditya Srivastava <yashsri421@gmail.com>, Netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, amitkarwar@gmail.com,
 siva8118@gmail.com, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
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

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> On Sun, Mar 14, 2021 at 9:18 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> The opening comment mark '/**' is used for highlighting the beginning of
>> kernel-doc comments.
>> There are files in drivers/net/wireless/rsi which follow this syntax in
>> their file headers, i.e. start with '/**' like comments, which causes
>> unexpected warnings from kernel-doc.
>>
>> E.g., running scripts/kernel-doc -none on drivers/net/wireless/rsi/rsi_coex.h
>> causes this warning:
>> "warning: wrong kernel-doc identifier on line:
>>  * Copyright (c) 2018 Redpine Signals Inc."
>>
>> Similarly for other files too.
>>
>> Provide a simple fix by replacing the kernel-doc like comment syntax with
>> general format, i.e. "/*", to prevent kernel-doc from parsing it.
>>
>
> Aditya, thanks for starting to clean up the repository following your
> investigation on kernel-doc warnings.
>
> The changes to all those files look sound.
>
> However I think these ten patches are really just _one change_, and
> hence, all can be put into a single commit.

I agree, this is one logical change to a single driver so one patch will
suffice. I think for cleanup changes like this one patch per driver is a
good approach.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
