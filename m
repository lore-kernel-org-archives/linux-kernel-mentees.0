Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EECAC001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 06:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB2B415BB;
	Mon,  7 Aug 2023 06:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB2B415BB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QwwhSDhy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZv37_1Dwa1u; Mon,  7 Aug 2023 06:04:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E15D240125;
	Mon,  7 Aug 2023 06:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E15D240125
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9C38C0071;
	Mon,  7 Aug 2023 06:04:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FFEDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB50460F15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB50460F15
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=QwwhSDhy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFdPxJyFJ9lx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:04:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CBDE6073E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CBDE6073E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E73DC614E9;
 Mon,  7 Aug 2023 06:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A50C433C7;
 Mon,  7 Aug 2023 06:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691388285;
 bh=J8BZEiTK2yZodmwjqDpMdP3/pfBrbHGljFh9Vq42geM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QwwhSDhyTCpciTAWZXcJNGak53J5KQN2R6/bIbFaQL+nOzZSjIVD1P82x5vOuSn8J
 vQyp9fG2olmAv5jsPeGE9CDfW1/LnJmsguLZO0sqH3i5fwHVMSSYug6hRtDYglz/x3
 ilVbnoyyVXSz5aspwmjG0IhKVQEQr7jQ46CkytZI=
Date: Mon, 7 Aug 2023 08:04:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atul Raut <rauji.raut@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: replace one-element array with
 flexible-array member
Message-ID: <2023080712-deepen-thank-3767@gregkh>
References: <20230806200527.18797-1-rauji.raut@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806200527.18797-1-rauji.raut@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, dev@lynxeye.de,
 stefan@agner.ch
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

On Sun, Aug 06, 2023 at 01:05:27PM -0700, Atul Raut wrote:
> One-element arrays are obsolete, and flexible
> array members have taken their place. So, in
> struct tegra_nand_chip, replace the one-element
> array with a flexible-array member.
> 
> This fixes warnings such as:
> ./drivers/mtd/nand/raw/tegra_nand.c:189:5-7: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> ---
> v1 -> v2:
>  Corrected commit message
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
> index eb0b9d16e8da..f34cd8cd0eaf 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -186,7 +186,7 @@ struct tegra_nand_chip {
>  	u32 config;
>  	u32 config_ecc;
>  	u32 bch_config;
> -	int cs[1];
> +	int cs[];
>  };

Again, no, please stop.  We have responded as to why these changes are
not correct, why are you ignoring our reviews?

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
