Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD097EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 06:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF34402E8;
	Mon,  7 Aug 2023 06:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF34402E8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dy0ni2/i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQjF-KMBOuCb; Mon,  7 Aug 2023 06:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 40AFD40121;
	Mon,  7 Aug 2023 06:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40AFD40121
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 183CFC0071;
	Mon,  7 Aug 2023 06:02:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D589C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 336B980DD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336B980DD0
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=dy0ni2/i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ph46_Dujlsj1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:02:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CC8581026
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 06:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC8581026
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC897614FF;
 Mon,  7 Aug 2023 06:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1692C433C7;
 Mon,  7 Aug 2023 06:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691388119;
 bh=uo8+tFYw6wpXYV3huWw6KN1IdxTkJNzVIY85nkqD9Fs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dy0ni2/iZjbtw3LiAn5DLLIEIPOIMj+bb1cEx/sK67Z/fcwf0YT/xqYfg3ARSny8g
 EnNMkCXg129XjKbPLlw35C7zuDMPyE1EaUs2yr/vq2LEXLQabfCf+4/5vFP3wLoN2H
 MlQMoQyCLIC1CwzPRFd6Tzb6iZwZjwcSfwTbNdOs=
Date: Mon, 7 Aug 2023 08:01:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH v1] drivers: edac: zynqmp_edac: Updates return value check
Message-ID: <2023080727-wildly-veal-c0fd@gregkh>
References: <20230806130514.159102-1-atulpant.linux@gmail.com>
 <2023080631-salon-banter-31b7@gregkh>
 <20230807023104.GA4030@atom0118>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807023104.GA4030@atom0118>
Cc: tony.luck@intel.com, rric@kernel.org, linux-edac@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 shubhrajyoti.datta@amd.com, bp@alien8.de, james.morse@arm.com,
 mchehab@kernel.org, michal.simek@amd.com, sai.krishna.potthuri@amd.com
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

On Mon, Aug 07, 2023 at 08:01:04AM +0530, Atul Kumar Pant wrote:
> On Sun, Aug 06, 2023 at 03:37:01PM +0200, Greg KH wrote:
> > On Sun, Aug 06, 2023 at 06:35:14PM +0530, Atul Kumar Pant wrote:
> > > Updating the check of return value from edac_debugfs_create_dir
> > > to use IS_ERR.
> > > 
> > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > ---
> > >  drivers/edac/zynqmp_edac.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/edac/zynqmp_edac.c b/drivers/edac/zynqmp_edac.c
> > > index ac7d1e0b324c..cefbbafb945e 100644
> > > --- a/drivers/edac/zynqmp_edac.c
> > > +++ b/drivers/edac/zynqmp_edac.c
> > > @@ -351,7 +351,7 @@ static void setup_debugfs(struct edac_device_ctl_info *edac_dev)
> > >  	struct edac_priv *priv = edac_dev->pvt_info;
> > >  
> > >  	priv->debugfs_dir = edac_debugfs_create_dir("ocm");
> > > -	if (!priv->debugfs_dir)
> > > +	if (IS_ERR(priv->debugfs_dir))
> > >  		return;
> > 
> > Again, not correct, sorry.  Please do not make these types of changes.
> > 
> > Why do you feel this is needed at all?
> > 
>     edac_debugfs_create_dir uses debugfs_create_dir that return ERR_PTR.
>     Hence to check the return value by this function I changed null
>     comparison with IS_ERR.

But that's not needed at all, right?

As this check has not ever really worked, why check it at all?

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
