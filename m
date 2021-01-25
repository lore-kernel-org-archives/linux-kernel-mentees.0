Return-Path: <SRS0=F5qy=G4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702B5C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Jan 2021 14:28:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56712310A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Jan 2021 14:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56712310A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3ED8C87280;
	Mon, 25 Jan 2021 14:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-NWCK27Hvsi; Mon, 25 Jan 2021 14:28:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79CD486B52;
	Mon, 25 Jan 2021 14:28:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65589C08A1;
	Mon, 25 Jan 2021 14:28:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1044C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 14:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BC53687010
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 14:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whOSsAA+TZsg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 14:27:56 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.7.6
Received: from m42-8.mailgun.net (m42-8.mailgun.net [69.72.42.8])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCFF78700B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jan 2021 14:27:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611584876; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=n6LnzX+9OwV112HZOi7kygONlFWnbReQdwO0xSe4hbU=;
 b=naeDt2BomNgJjIAOM/Fqa4G37N+ZjzH4l4jTHxzoJ9yFSwia+m1KQMNpFSjDZUZSOudhV36s
 bp5+y6oYAqPIIiNeqL2JnVx6CwQjb2F+Gg3WTi0vRump/c+3slR5n4tm/NYcIwCTVL12aiA1
 VM/ERM4O/2lnzf4CngR2t80q6fA=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1ODQyZiIsICJsaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 600ed42bfb02735e8c8fb23c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Jan 2021 14:22:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2A63DC433CA; Mon, 25 Jan 2021 14:22:35 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BFE08C433CA;
 Mon, 25 Jan 2021 14:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFE08C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210110121525.2407-2-yashsri421@gmail.com>
References: <20210110121525.2407-2-yashsri421@gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210125142235.2A63DC433CA@smtp.codeaurora.org>
Date: Mon, 25 Jan 2021 14:22:35 +0000 (UTC)
Cc: pkshih@realtek.com, yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH 1/5] rtlwifi: rtl_pci: fix bool
	comparison in expressions
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

Aditya Srivastava <yashsri421@gmail.com> wrote:

> There are certain conditional expressions in rtl_pci, where a boolean
> variable is compared with true/false, in forms such as (foo == true) or
> (false != bar), which does not comply with checkpatch.pl (CHECK:
> BOOL_COMPARISON), according to which boolean variables should be
> themselves used in the condition, rather than comparing with true/false
> 
> E.g., in drivers/net/wireless/realtek/rtlwifi/ps.c,
> "if (find_p2p_ie == true)" can be replaced with "if (find_p2p_ie)"
> 
> Replace all such expressions with the bool variables appropriately
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

5 patches applied to wireless-drivers-next.git, thanks.

d8cbaa3de403 rtlwifi: rtl_pci: fix bool comparison in expressions
f7c76283fc5f rtlwifi: rtl8192c-common: fix bool comparison in expressions
64338f0dfd6a rtlwifi: rtl8188ee: fix bool comparison in expressions
33ae4623d544 rtlwifi: rtl8192se: fix bool comparison in expressions
9264cabc1204 rtlwifi: rtl8821ae: fix bool comparison in expressions

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210110121525.2407-2-yashsri421@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
