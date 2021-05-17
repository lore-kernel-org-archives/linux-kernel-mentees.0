Return-Path: <SRS0=5laK=KM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80539C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 May 2021 10:13:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 277C0610C9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 May 2021 10:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 277C0610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA6E40282;
	Mon, 17 May 2021 10:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5NBuY822xon; Mon, 17 May 2021 10:13:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 544534019A;
	Mon, 17 May 2021 10:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE4DC000D;
	Mon, 17 May 2021 10:13:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E3D4C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 10:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EE4F401F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 10:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtmclxiLAvyU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 10:13:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 363704019A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 10:13:22 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HADDpg018783; Mon, 17 May 2021 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=f87dLmC0j6gWoUu+50r2vzkGFGGPi5tJfQ5olNEG49s=;
 b=l7I+RyQgNSZd3XMG37nqg7Rah4RXlne6Oz1c34kgq4rOKJGXywBa7+xHy652oucPhr9b
 dZr2rTI2MNrx7wsHM6H4oBVq20SVKZwfVQiZwmEI2IwsvEjofGWErgm4o6hz74h8T/1b
 FlpASzHa4Wa0+caui38tITaa8CoqR2fiZFxskxaZ8XVuI9FCyLsoffGU5fIbsXV/s+eL
 8Z17hAyGnx/HuHL93LgR4ZuRahECjTwEIbyRFBNOwYxlJ6AshNrbickuMlqpcBDrlXfH
 AKSX3sq7Q6Po18HNpfEwCT/rqGGZytajyzClrz+elEJYVANCzyZNbgbS9+F8hwxzlnD3 Kg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kfhwg4qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 10:13:13 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14HADCMA025213;
 Mon, 17 May 2021 10:13:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38j4bb1d4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 10:13:12 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14HADCLc025196;
 Mon, 17 May 2021 10:13:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 38j4bb1d4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 10:13:12 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14HADBVG008187;
 Mon, 17 May 2021 10:13:11 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 May 2021 10:13:10 +0000
Date: Mon, 17 May 2021 13:13:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 7/7] Staging: rtl8723bs: fix block comment in
 HalBtc8723b1Ant.c
Message-ID: <20210517101302.GF1955@kadam>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
 <20210516122927.1132356-8-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210516122927.1132356-8-desmondcheongzx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: esNB97Fc0mpYUVaDvyoiC-TtUK7SLMQF
X-Proofpoint-ORIG-GUID: esNB97Fc0mpYUVaDvyoiC-TtUK7SLMQF
Cc: eantoranz@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, fabioaiuto83@gmail.com, hdegoede@redhat.com,
 fmdefrancesco@gmail.com, marcocesati@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Larry.Finger@lwfinger.net
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

On Sun, May 16, 2021 at 08:29:27AM -0400, Desmond Cheong Zhi Xi wrote:
> This commit fixes the following checkpatch.pl warning:
> 
> WARNING: Block comments use * on subsequent lines
> +		/*
> +		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> index cc7f558903ac..87156b2cd1f0 100644
> --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> @@ -2511,10 +2511,10 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
>  		CL_PRINTF(cliBuf);
>  
>  		/*
> -		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
> -			pCoexDm->errorCondition);
> -		CL_PRINTF(cliBuf);
> -		*/
> +		 *CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)",
> +		 *	pCoexDm->errorCondition);
> +		 *CL_PRINTF(cliBuf);
> +		 */
>  	}

Always just delete dead code.  Otherwise the patchset seems good.

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
