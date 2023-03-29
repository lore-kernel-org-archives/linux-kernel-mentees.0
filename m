Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613BBC6FD18
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Mar 2023 03:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D517E4019D;
	Wed, 29 Mar 2023 03:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D517E4019D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhAGIKET
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4rgTx9T6gSr; Wed, 29 Mar 2023 03:36:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D2717400E4;
	Wed, 29 Mar 2023 03:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2717400E4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9842C0037;
	Wed, 29 Mar 2023 03:36:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B02CDC002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84E8160C12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84E8160C12
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhAGIKET
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMZ4ja76v_XH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:36:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28B1960B3B
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28B1960B3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=M9TunKd1G1N8i08Qa3nbIbBIZrjzPf28LPaVrO9lrtY=; b=VhAGIKETJphnkp7TqQjN3cFg0f
 Qx9gpbrB7SqFuCU/jkYgYVCat/Oe/O4GTIr2CJNQOemF4KgX+Elg/ra/3C3qw1B2X/DvLguSba79n
 DKrpVWrOSlFroWBuxn7D6B+xpjoSway7ullkRTsEG/Run4U4hKp1pdOG+1gyQZbRm4dvwDqqal+Wr
 +DdKs+EAq7uqGtidMWLaeJLaK6gDrgeWIjoA00z8DfuqqA4HGvtw4WXxxlaCpP7MdaP3a93UUxhxA
 OQ/ekUey57m5AIR0cwtpgDXMGRbwivnm/SxpyGPKY3SAv3V1xicOpQhWNO3EFRA7rY1N9BiRR/e27
 K4R8inNQ==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1phMc4-00GTBS-0a; Wed, 29 Mar 2023 03:36:40 +0000
Message-ID: <22e509fc-e250-29b3-e9f1-d62a6d10ec60@infradead.org>
Date: Tue, 28 Mar 2023 20:36:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] usb:dwc:core.h Fixed warning of documentation
Content-Language: en-US
To: Piyush Thange <pthange19@gmail.com>, Thinh.Nguyen@synopsys.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230329032938.225211-1-pthange19@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230329032938.225211-1-pthange19@gmail.com>
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Hi--

On 3/28/23 20:29, Piyush Thange wrote:
> While compiling documentation a following warning is generated.
> Function parameter or member 'resume_hs_terminations' not described 
> in 'dwc3'

This one appears to be fixed already.

> One more warning arises in the same file as follows
> Function parameter or member 'gfladj_refclk_lpm_sel' not described 
> in 'dwc3'
> 
> I need some insights on this.

The second one needs a line added, probably just after:

 * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
 *			instances in park mode.

like

 * @gfladj_refclk_lpm_sel: {some description here}

Thanks.

> Signed-off-by: Piyush Thange <pthange19@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 582ebd9cf9c2..4743e918dcaf 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1098,7 +1098,7 @@ struct dwc3_scratchpad_array {
>   *			change quirk.
>   * @dis_tx_ipgap_linecheck_quirk: set if we disable u2mac linestate
>   *			check during HS transmit.
> - * @resume-hs-terminations: Set if we enable quirk for fixing improper crc
> + * @resume_hs_terminations: Set if we enable quirk for fixing improper crc
>   *			generation after resume from suspend.
>   * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
>   *			instances in park mode.

-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
