Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB5AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 14:51:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC68020709
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 14:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ny+VE1/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC68020709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 93B44884DF;
	Thu, 23 Jul 2020 14:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QO5RmHC31Obi; Thu, 23 Jul 2020 14:51:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 254AE88476;
	Thu, 23 Jul 2020 14:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 134BBC004D;
	Thu, 23 Jul 2020 14:51:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96C43C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 14:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 78CB3228EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 14:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jMSbcbMT1wH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 14:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by silver.osuosl.org (Postfix) with ESMTPS id 6FF77204B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 14:51:35 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06NEpOne183308;
 Thu, 23 Jul 2020 14:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UVrd0dvtpq4Ts0ES1WmJVk4CRHzFgNiih/Z08HeKfdc=;
 b=Ny+VE1/0UAr8PLABJpV7zTl/cnINTVy9DOxtSXKoFowavcD47xgA2M/Z7hraFY5ujCgR
 UZKI+TWGMBcl6eSm+cTM6EZNg+IEbaz90+tNvy8INq3TaVsUC/4bx+tVfVq0ppawe+Fz
 6rcojvz4Z34Tn+Au5sNnE4HdRVU5T5JF74H5y74p7n61P63ekBJ33GnHLXNbc+a6PSC/
 h/Q+/AdBPsULRCKgH6XetWoYp04hoQTwJ3LehFl8GhRpUiETZiJc9v7RPwvxy7M3c4LB
 D3HSrio1+XeR/HWnRFN1by39yTe+o2J82005h5IsGE2bWefgRk8eyvzoaksTl7YfwoGN 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 32bs1mstfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Jul 2020 14:51:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06NEhB3h051179;
 Thu, 23 Jul 2020 14:51:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 32fb8gx3ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 14:51:30 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06NEpSgX017197;
 Thu, 23 Jul 2020 14:51:29 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 23 Jul 2020 07:51:28 -0700
Date: Thu, 23 Jul 2020 17:51:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200723145121.GR2549@kadam>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720195209.4365-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720195209.4365-1-yepeilin.cs@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230111
Cc: linux-usb@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] usbhid: Fix
 slab-out-of-bounds write in hiddev_ioctl_usage()
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

On Mon, Jul 20, 2020 at 03:52:09PM -0400, Peilin Ye wrote:
> `uref->usage_index` is not always being properly checked, causing
> hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.
> 
> Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>     - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
>       Dan Carpenter <dan.carpenter@oracle.com>)

Looks good to me.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
