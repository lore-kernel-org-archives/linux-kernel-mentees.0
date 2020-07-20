Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6075C433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 17:10:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BA522482
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 17:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="JglkJGye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77BA522482
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4274C86FAE;
	Mon, 20 Jul 2020 17:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuzDiDMqGtY0; Mon, 20 Jul 2020 17:10:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C42DF86578;
	Mon, 20 Jul 2020 17:10:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB0BFC089F;
	Mon, 20 Jul 2020 17:10:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA032C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C73A38679A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9W+xB6KPaKaf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:09:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E024286773
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 17:09:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595264998; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=pEBC16t+YV4FGYaWikogHtEEGJZCLsu+AxuloV4iKJY=;
 b=JglkJGyecNNxO3mhaItBLY+2qYFBXW1xbL2x7loVJV/Xf5kfz1xA61UL2/Wd2HOVPiWR+0bV
 L9OywxSN/7EWod5hv07WyI1fWmH0lVN7CffnS76KkZxWMY+lRArYqxVt/lCuzraTPs0llbZy
 LiujMHsvVURm8g/w4KHX5/1i7UY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1ODQyZiIsICJsaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f15cfdfed710aec62996a56 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 17:09:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 10071C433C6; Mon, 20 Jul 2020 17:09:51 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCB1CC433C9;
 Mon, 20 Jul 2020 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCB1CC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200713175529.29715-2-refactormyself@gmail.com>
References: <20200713175529.29715-2-refactormyself@gmail.com>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200720170951.10071C433C6@smtp.codeaurora.org>
Date: Mon, 20 Jul 2020 17:09:51 +0000 (UTC)
Cc: linux-pci@vger.kernel.org,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 3/14 v3] ath9k: Check the return
 value of pcie_capability_read_*()
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

"Saheed O. Bolarinwa" <refactormyself@gmail.com> wrote:

> On failure pcie_capability_read_dword() sets it's last parameter, val
> to 0. However, with Patch 14/14, it is possible that val is set to ~0 on
> failure. This would introduce a bug because (x & x) == (~0 & x).
> 
> This bug can be avoided without changing the function's behaviour if the
> return value of pcie_capability_read_dword is checked to confirm success.
> 
> Check the return value of pcie_capability_read_dword() to ensure success.
> 
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9a8ab2bfb678 ath9k: Check the return value of pcie_capability_read_*()

-- 
https://patchwork.kernel.org/patch/11660731/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
