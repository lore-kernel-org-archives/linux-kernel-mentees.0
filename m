Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DE1C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 16:08:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6A220684
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 16:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XCrBGgrY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6A220684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC9E8883C1;
	Thu, 23 Jan 2020 16:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTsO+MZ4jloG; Thu, 23 Jan 2020 16:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CD83883A8;
	Thu, 23 Jan 2020 16:08:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41054C18DD;
	Thu, 23 Jan 2020 16:08:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FEB4C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 16:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2BD59883A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 16:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knEZDEvwJjfk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 16:08:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9163D8838F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 16:08:56 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00NFwZZJ007967;
 Thu, 23 Jan 2020 16:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=sIDGp/oEBR2StqKw04W1x4gi0FRiIz5M+YjbmfBvszs=;
 b=XCrBGgrYj9bndyOobOoM8k5DYXHJfr1LPqt3+wr5qcoGmJLNtIfq78+281u4BfrvfzVi
 a0I2DtfFLW/snynjFqvrhnIChESd8xA1roDVJNldRARO5BVL6VEIGSHJRRg0Ftmk4rwH
 oskLVpTfdnGnS5U2mRfYZCWITkC1bB103TNoaQfnJvPlXfpiNlP1rWrveGrqKSHGi3Sy
 LWNggW28CHBmk2pI1zRgux+6PXvl812eQuCoyuCVTK9oOploaaLBnh4GlyZQk4TMI2mV
 8X2V2YSIIYSx6IJlDSg8mPkEdDudQHUAY7z+KPkPcFiH3lSiC3k8iphraCxqWqKQzN7A lA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2xkseuudfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jan 2020 16:08:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00NFxJMg072214;
 Thu, 23 Jan 2020 16:08:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2xpq7n2pej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jan 2020 16:08:44 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00NG8etx011729;
 Thu, 23 Jan 2020 16:08:40 GMT
Received: from ca-dmjordan1.us.oracle.com (/10.211.9.48)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 23 Jan 2020 08:08:40 -0800
Date: Thu, 23 Jan 2020 11:08:50 -0500
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200123160850.gcwoydrdpw6saotk@ca-dmjordan1.us.oracle.com>
References: <20200122170246.20177-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122170246.20177-1-madhuparnabhowmik10@gmail.com>
User-Agent: NeoMutt/20180716
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9508
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=385
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001230130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9508
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=440 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001230130
Cc: steffen.klassert@secunet.com, Herbert Xu <herbert@gondor.apana.org.au>,
 paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux-crypto@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] padata.h: Annotate parallel_data
	with __rcu
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

[add Herbert]

Hi Madhuparna,

On Wed, Jan 22, 2020 at 10:32:46PM +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> This patch fixes the following sparse errors:
> kernel/padata.c:110:14: error: incompatible types in comparison expression
> kernel/padata.c:520:9: error: incompatible types in comparison expression
> kernel/padata.c:1000:9: error: incompatible types in comparison expression

This recent patch to padata in the cryptodev tree has fixed these sparse errors
and is heading for mainline soon:

https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=bbefa1dd6a6d53537c11624752219e39959d04fb

Thanks,
Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
