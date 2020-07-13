Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FD8C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 10:03:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB872080D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 10:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="FdED5WFn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB872080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE402896AA;
	Mon, 13 Jul 2020 10:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwsnXuRFiSHv; Mon, 13 Jul 2020 10:03:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 281EB896A4;
	Mon, 13 Jul 2020 10:03:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10045C0888;
	Mon, 13 Jul 2020 10:03:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C4F7C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3E55788B76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DND7OywcypU7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:03:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 70FFC88B4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:03:27 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id uvIwj6dSlGLmCuvIzjAv4p; Mon, 13 Jul 2020 12:03:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1594634605; bh=JZ0u6IVYJ3t6A5I0FiTBQH+7zjb770/fle7atpAVCzs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=FdED5WFnNNxHgJOQ5hMxpOAdDav4DkMFqmX2rh8kqXVBRvBg6xZmoTXN3A+fPcH8f
 hZ2lZ5oQ+rIBr6fSK1NWaTL3tEm3ciEeo2XsxVTg7jqosxzroC+i2TFxKeLdk8CE0E
 HiSZOHl9i4jgrOppQbtxy2WXs9nXq98I8augJvQR0Bwm8GPXsIIc7HbiZJHuKR9r6d
 +5stJHF8lm0r1SgL3DO+mLWXU5kvoy2L+AYaWogtEx+Z69MDyk5xyPp/O/oM0I8V5N
 Yl+Hfk/eMpbHj3YMT03+pd+4rAyIhIuTvy7BNti4xzusBgXdwMtA7DJdsrACA4KBKs
 GIBALBr20T7BA==
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
 <20200629073604.205478-4-vaibhavgupta40@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <126d8fe6-1480-137c-ac64-d828a32b99f9@xs4all.nl>
Date: Mon, 13 Jul 2020 12:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200629073604.205478-4-vaibhavgupta40@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFiuY3g36s+/lIFf8CRg5WvA6XQU+S7/+hihune9u/ukz+XXtQn0TrUcq5itDVbjWDM+5qoFf1B+Uz8z8GJsH6bfd8Mic/MwYp9w1q/yvaKUQmRBOfxh
 hkQI37AksyhAQFB2A315MaOXpkzTzKmcqGQy5DwsPAVp6kwFYYSjFnvMSdkGuLZ55KdCj5W4YkQGiny8ejEdv3Dsg72Go6kGjVgTheWacfPMBtSRSfmVDPOS
 AO12fd2Ogjry+oCJpHNTDOiBJTVhWOUbXpHHGz07HgzUMlAlpmpk3jI0cWXRZFy/O65GHnS5Q1bOgKlYO7tSywQttExU0vbn71cPstiaxjhPKiNjB78U8c0G
 Pf/Yk4hEYGHkHHm/5qugLvNw8Lxcy17KLO8w0DXVN9ib6gmgnk8522/6SpRuKHeGiobxcnMfDri+cUhYKnszwIc7iVZFWDyWoA6HFjkDYRLluXmjg71c93Ql
 m80gBTFhNn6JbA/3iKKpGnKZ3VuViHqIWuPjcIxC3lRJ9SQ5m61E4l/0how=
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 3/6] [media] cx25821: use
	generic power management
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

On 29/06/2020 09:36, Vaibhav Gupta wrote:
> The .suspend() and .resume() callbacks are not defined for this driver.
> Still, their power managemgement stucture can be easily upgraded to
> gemeric, without affecting its normal behaviour.
> 
> Hence, define them NULL and use struct dev_pm_ops type to bind them.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/cx25821/cx25821-core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
> index 41be22ce66f3..59501939d741 100644
> --- a/drivers/media/pci/cx25821/cx25821-core.c
> +++ b/drivers/media/pci/cx25821/cx25821-core.c
> @@ -1369,14 +1369,18 @@ static const struct pci_device_id cx25821_pci_tbl[] = {
>  
>  MODULE_DEVICE_TABLE(pci, cx25821_pci_tbl);
>  
> +#define cx25821_suspend NULL
> +#define cx25821_resume NULL
> +
> +static SIMPLE_DEV_PM_OPS(cx25821_pm_ops, cx25821_suspend, cx25821_resume);
> +
>  static struct pci_driver cx25821_pci_driver = {
>  	.name = "cx25821",
>  	.id_table = cx25821_pci_tbl,
>  	.probe = cx25821_initdev,
>  	.remove = cx25821_finidev,
>  	/* TODO */
> -	.suspend = NULL,
> -	.resume = NULL,
> +	.driver.pm = &cx25821_pm_ops,
>  };

Same question as for 2/6.

Regards,

	Hans

>  
>  static int __init cx25821_init(void)
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
