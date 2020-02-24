Return-Path: <SRS0=/sBJ=4M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7DFC3567B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 07:32:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECA720637
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 07:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h5bFUu77"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ECA720637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 002D42046B;
	Mon, 24 Feb 2020 07:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBUGhn3khfU4; Mon, 24 Feb 2020 07:32:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C88C20017;
	Mon, 24 Feb 2020 07:32:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 228D9C07FF;
	Mon, 24 Feb 2020 07:32:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEE4FC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 07:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C8B6A86BA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 07:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qDXYcRUPZH5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 07:32:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9967586450
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 07:32:39 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01O7VL7i053525;
 Mon, 24 Feb 2020 07:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ctgNwyDsGErJORzON8g3jp9u7VQvJRVglKKheMnzkkU=;
 b=h5bFUu77Tdpq7K6YcUFW/6O4hLpE73MsWFyh9w4MrdE0V4+wivoFHCxCP8oTouXgs3qA
 oOlexsdjkR9v5E/7QDKns/Ma8KiqUA8jnAtfbpwJmfjLWOIFdYT1+KL9qH8uD8J+1GpX
 PsNboxUAIqwRoBjNifdVjVhhQlsFsO07gYgWywQ5MOt9B3WHsIit5Ok4rdXba8gGCVLb
 1YjHM4VscAqNv2BnyyPq60MTgaujJVZKMyKAIXOXAj1qMmKyqsC9FL43rSAO5M8GoWvc
 N2tQWhWrmDoXh66/Ih8FuPrYpB/k7y5lCRBCX5zPD1I4vEUNv0OXXEvPDMBBI5rk/D8s 2Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2yauqu5f6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 07:32:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01O7SLXe162686;
 Mon, 24 Feb 2020 07:32:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2yby5anfs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 07:32:12 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01O7W9o4007023;
 Mon, 24 Feb 2020 07:32:10 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 23 Feb 2020 23:32:09 -0800
Date: Mon, 24 Feb 2020 10:31:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200224073157.GB3286@kadam>
References: <20200222001513.43099-1-colin.king@canonical.com>
 <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002240065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240065
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Colin King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>,
 Christian Brauner <christian@brauner.io>
Subject: Re: [Linux-kernel-mentees] [PATCH][next] clone3: fix an unsigned
 args.cgroup comparison to less than zero
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

On Sat, Feb 22, 2020 at 01:18:01PM +0100, Christian Brauner wrote:
> On Sat, Feb 22, 2020 at 12:15:13AM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The less than zero comparison of args.cgroup is aways false because
> > args.cgroup is a u64 and can never be less than zero.  I believe the
> > correct check is to cast args.cgroup to a s64 first to ensure an
> > invalid value is not copied to kargs->cgroup.
> > 
> > Addresses-Coverity: ("Unsigned compared against 0")
> > Fixes: ef2c41cf38a7 ("clone3: allow spawning processes into cgroups")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks, Colin.
> Dan has reported this issue a few days prior on the janitors list so he
> likely should get a 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> too.

Colin found it independently so no need for a Reported-by.

> diff --git a/kernel/fork.c b/kernel/fork.c
> index 2diff --git a/kernel/fork.c b/kernel/fork.c
> index 2853e258fe1f..dca4dde3b5b2 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2618,7 +2618,8 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
>                      !valid_signal(args.exit_signal)))
>                 return -EINVAL;
> 
> -       if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
> +       if ((args.flags & CLONE_INTO_CGROUP) &&
> +           (args.cgroup > INT_MAX || (s64)args.cgroup < 0))

If we're capping it at INT_MAX then the check for negative isn't
required and static analysis tools know it's not so they might complain.

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
