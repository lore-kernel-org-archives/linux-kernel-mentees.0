Return-Path: <SRS0=Icdq=CT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376EDC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 10:49:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AEFD20872
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 10:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a68PNyTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AEFD20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5068A204D2;
	Thu, 10 Sep 2020 10:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJIyDckMlkJf; Thu, 10 Sep 2020 10:49:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1B16F2040C;
	Thu, 10 Sep 2020 10:49:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB69BC0859;
	Thu, 10 Sep 2020 10:49:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84E1EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 10:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6D73D86BA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 10:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JOhfZaN6LaM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 10:49:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A473E86BA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 10:49:47 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08AAYPWK177381;
 Thu, 10 Sep 2020 10:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=fN/ETYUSmj9/pRoUk3iHgY2Npxy2z+BXnfBD/U2xvEE=;
 b=a68PNyTuR/Ya7gDF83LDKZQwcJPvMkAb8MTEijJIo8fXjvS5/dm2yiB8iBvckb6OO4/V
 yR1giJXwGSHbLA6bJgRepaaLySl/LcC01ieNDGys7GTX6TcHtikMJbTS26UOsvAw4a9W
 aAdXPBGpbBL1Tx/GqkI/L7T7LWg1/36uU2Hkmd6HnGEcocw3vJhJlug+qGVHcBqO7bJX
 kQYf7e+l0+sVFw5cGLjN+jOVt7HOuG3t1cdCyNrIJQrEGNfzWtEtdGK48DGcSuEomfDk
 93MRfMYzfeZugwO4tH6FUIIxGCayOxvU3wPFIQN0leeWDXjlzH69xGeyA3A90zn+ofpc wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 33c3an76nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Sep 2020 10:49:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08AAkerQ067429;
 Thu, 10 Sep 2020 10:49:33 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 33cmm0rd75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 10:49:32 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08AAnRgq022266;
 Thu, 10 Sep 2020 10:49:27 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Sep 2020 03:49:27 -0700
Date: Thu, 10 Sep 2020 13:49:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20200910104918.GF12635@kadam>
References: <20200910043424.19894-1-anmol.karan123@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910043424.19894-1-anmol.karan123@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009100099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100098
Cc: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 johan.hedberg@gmail.com, netdev@vger.kernel.org, marcel@holtmann.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
 dereference in hci_event_packet()
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

On Thu, Sep 10, 2020 at 10:04:24AM +0530, Anmol Karn wrote:
> Prevent hci_phy_link_complete_evt() from dereferencing 'hcon->amp_mgr'
> as NULL. Fix it by adding pointer check for it.
> 
> Reported-and-tested-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=0bef568258653cff272f
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> ---
>  net/bluetooth/hci_event.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 4b7fc430793c..871e16804433 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -4936,6 +4936,11 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
>  		return;
>  	}
>  
> +	if (IS_ERR_OR_NULL(hcon->amp_mgr)) {

It can't be an error pointer.  Shouldn't we call hci_conn_del() on this
path?  Try to find the Fixes tag to explain how this bug was introduced.

(Don't rush to send a v2.  The patch requires quite a bit more digging
and detective work before it is ready).

> +		hci_dev_unlock(hdev);
> +		return;
> +	}
> +
>  	if (ev->status) {
>  		hci_conn_del(hcon);
>  		hci_dev_unlock(hdev);

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
