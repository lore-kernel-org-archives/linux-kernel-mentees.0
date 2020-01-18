Return-Path: <SRS0=GiD0=3H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF185C33CB7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 18:07:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D2F246B3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 18:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P4/pJzfh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D2F246B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8155420397;
	Sat, 18 Jan 2020 18:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vd22jC2VmNR7; Sat, 18 Jan 2020 18:07:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 554452002E;
	Sat, 18 Jan 2020 18:07:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 466E0C1796;
	Sat, 18 Jan 2020 18:07:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4B5BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 821428610F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 18:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mg8TNZmVax5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 18:06:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AC7E4860BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 18:06:58 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00II3IWl131777;
 Sat, 18 Jan 2020 18:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=RUMWuHIuYnvZA0LwP+zxBuE0/DCOWdUGFyUQQD5rKQA=;
 b=P4/pJzfhEdJDU7JJZOE10GaVmE6eLwEi8LK1DG8FjjJVxysF8jrUWnQ7L1faMJnXpQYu
 QdVKcKqZdYVG1+zt/xo1sv2OYXwNzwcR/c605UNRaoD8VCq5rrHE4K33hvgpKE84o5yT
 x1IefSONdkDUiREXVYEvQsRMXYawt7sxXDTkbgUEsJ58fdjlg4vH7XgVuzogbJfOsXuf
 w7bEJ3wauliuLHHX7JSobJ21oGHcGFGPmZBBEyJEZex/SXv528ptBIiAesi7F6/rHnlX
 LiYEX/ZkFBL/DvEuaHTmY5azWGkIXJwRw8BbhPC12Vr4lE8u2mWoAjlIQwcPV978OtwZ FQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2xkseu1qv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Jan 2020 18:06:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00II3u0D024002;
 Sat, 18 Jan 2020 18:06:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2xksc41da6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Jan 2020 18:06:36 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00II6W91026232;
 Sat, 18 Jan 2020 18:06:32 GMT
Received: from [192.168.86.20] (/69.181.241.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 18 Jan 2020 10:06:32 -0800
To: Amol Grover <frextrite@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>
References: <20200118042433.4968-1-frextrite@gmail.com>
From: santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <c58b6751-7502-fad4-e087-9f0bb744ebb9@oracle.com>
Date: Sat, 18 Jan 2020 10:06:30 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200118042433.4968-1-frextrite@gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9504
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001180149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9504
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001180149
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 soc@kernel.org, arm@kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] drivers: soc: ti:
 knav_qmss_queue: Pass lockdep expression to RCU lists
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 1/17/20 8:24 PM, Amol Grover wrote:
> inst->handles is traversed using list_for_each_entry_rcu
> outside an RCU read-side critical section but under the protection
> of knav_dev_lock.
> 
> Hence, add corresponding lockdep expression to silence false-positive
> lockdep warnings, and harden RCU lists.
> 
> Add macro for the corresponding lockdep expression.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
> v2:
> - Remove rcu_read_lock_held() from lockdep expression since it is
>    implicitly checked for.
>
Thanks.
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>

>   drivers/soc/ti/knav_qmss_queue.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 1ccc9064e1eb..37f3db6c041c 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -25,6 +25,8 @@
>   
>   static struct knav_device *kdev;
>   static DEFINE_MUTEX(knav_dev_lock);
> +#define knav_dev_lock_held() \
> +	lockdep_is_held(&knav_dev_lock)
>   
>   /* Queue manager register indices in DTS */
>   #define KNAV_QUEUE_PEEK_REG_INDEX	0
> @@ -52,8 +54,9 @@ static DEFINE_MUTEX(knav_dev_lock);
>   #define knav_queue_idx_to_inst(kdev, idx)			\
>   	(kdev->instances + (idx << kdev->inst_shift))
>   
> -#define for_each_handle_rcu(qh, inst)			\
> -	list_for_each_entry_rcu(qh, &inst->handles, list)
> +#define for_each_handle_rcu(qh, inst)				\
> +	list_for_each_entry_rcu(qh, &inst->handles, list,	\
> +				knav_dev_lock_held())
>   
>   #define for_each_instance(idx, inst, kdev)		\
>   	for (idx = 0, inst = kdev->instances;		\
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
