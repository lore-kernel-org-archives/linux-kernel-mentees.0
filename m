Return-Path: <SRS0=uyzn=HM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8975BC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Feb 2021 12:19:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B8D64E31
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Feb 2021 12:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B8D64E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 89BDA8452E;
	Wed, 10 Feb 2021 12:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jepa02SkgXla; Wed, 10 Feb 2021 12:19:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25F7C8361A;
	Wed, 10 Feb 2021 12:19:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09910C0174;
	Wed, 10 Feb 2021 12:19:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DCC4C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7A02686F64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cO0f1O-t1jAf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:19:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5C84A86D5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:19:32 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11ACFIJj117957;
 Wed, 10 Feb 2021 12:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=RSSYx5ZKyLwSH2WY20S360SzVHoate5hhIssdRM7i4w=;
 b=PePQVMmURpS+XLsy2yNWWMLPwxopuGErm8HDwg+7rysPqfu+Fc3eNsM8ba93ZfXUzTWT
 WOdg00F3KBIBf/arngjQ+PXREcvrC15p2xfBkJClXR8UhfqKO+CLCLQYiDmquMUjsura
 jNZkX+O8nQfmB49VMuvDch6E/irvkCBxe2s6HmS6SsEshzPpz2xerlNsq+5Y56VZNnMc
 2P//T/MIqf/Oy9y6x4qYPgKP5eVcheLS3hWAn56D+k9PrzYB5xkDVbPug0c/bO/HBNbe
 DszITgMQe2V0NAVJNpapEiGNrxQaXQD2CPCjACbJ6GBXGFbmH2y8GZeWcJzA00tx7YMN fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36m4upsnum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 12:19:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11ACEg1c074049;
 Wed, 10 Feb 2021 12:19:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 36j4vsqyj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 12:19:24 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11ACJNjJ008895;
 Wed, 10 Feb 2021 12:19:23 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 10 Feb 2021 04:19:22 -0800
Date: Wed, 10 Feb 2021 15:19:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Message-ID: <20210210121915.GX2696@kadam>
References: <20210210120348.262328-1-aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210120348.262328-1-aakashhemadri123@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9890
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100120
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9890
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100120
Cc: devel@driverdev.osuosl.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: ralink-gdma: Fix
	checkpatch.pl CHECK
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

On Wed, Feb 10, 2021 at 05:33:48PM +0530, Aakash Hemadri wrote:
> Remove CHECK: Lines should not end with a '('
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
> 
>  drivers/staging/ralink-gdma/ralink-gdma.c | 28 ++++++++++++-----------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
> index 655df317d0ee..a11f915f3308 100644
> --- a/drivers/staging/ralink-gdma/ralink-gdma.c
> +++ b/drivers/staging/ralink-gdma/ralink-gdma.c
> @@ -135,8 +135,7 @@ struct gdma_data {
>  	int (*start_transfer)(struct gdma_dmaengine_chan *chan);
>  };
> 
> -static struct gdma_dma_dev *gdma_dma_chan_get_dev(
> -	struct gdma_dmaengine_chan *chan)
> +static struct gdma_dma_dev *gdma_dma_chan_get_dev(struct gdma_dmaengine_chan *chan)
>  {
>  	return container_of(chan->vchan.chan.device, struct gdma_dma_dev,
>  		ddev);
> @@ -510,10 +509,11 @@ static void gdma_dma_issue_pending(struct dma_chan *c)
>  	spin_unlock_irqrestore(&chan->vchan.lock, flags);
>  }
> 
> -static struct dma_async_tx_descriptor *gdma_dma_prep_slave_sg(
> -		struct dma_chan *c, struct scatterlist *sgl,
> -		unsigned int sg_len, enum dma_transfer_direction direction,
> -		unsigned long flags, void *context)
> +static struct dma_async_tx_descriptor
> +	*gdma_dma_prep_slave_sg(struct dma_chan *c, struct scatterlist *sgl,

Don't do it like this...  The original code is better so, I guess, lets
leave it as is.  There are two accepted ways to start a function in the
kernel:

ONE:
static type
function_name(paramenters)

TWO
static type function_name(paramenters)

Either option will let you grep for the names of the functions:

	egrep "^[a-zA-Z]" dir/file.c | grep '('

regards,
dan carpenter


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
