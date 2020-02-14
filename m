Return-Path: <SRS0=hVmh=4C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DF5C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 17:26:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8691524650
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 17:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8691524650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B1F086D2D;
	Fri, 14 Feb 2020 17:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHpobsZlpYMY; Fri, 14 Feb 2020 17:26:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0E1A851E0;
	Fri, 14 Feb 2020 17:26:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBF46C0881;
	Fri, 14 Feb 2020 17:26:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83721C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 80211868BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BA3eytJ3jL8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:26:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8ACC1868B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:26:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 09:26:37 -0800
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; d="scan'208";a="223081578"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.204.146])
 ([10.254.204.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Feb 2020 09:26:35 -0800
To: madhuparnabhowmik04@gmail.com, mike.marciniszyn@intel.com, jgg@ziepe.ca,
 paulmck@kernel.org
References: <20200114162536.20388-1-madhuparnabhowmik04@gmail.com>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <b9a48945-7fc7-2463-2b56-61ad43e54754@intel.com>
Date: Fri, 14 Feb 2020 12:26:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200114162536.20388-1-madhuparnabhowmik04@gmail.com>
Content-Language: en-US
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 3/3] infiniband: sw: rdmavt:
 mcast.c: Use built-in RCU list checking
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

On 1/14/2020 11:25 AM, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> Use built-in RCU and lock-checking for list_for_each_entry_rcu()
> by passing the cond argument.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>   drivers/infiniband/sw/rdmavt/mcast.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/sw/rdmavt/mcast.c b/drivers/infiniband/sw/rdmavt/mcast.c
> index dd11c6fcd060..31c7f12c7665 100644
> --- a/drivers/infiniband/sw/rdmavt/mcast.c
> +++ b/drivers/infiniband/sw/rdmavt/mcast.c
> @@ -224,7 +224,7 @@ static int rvt_mcast_add(struct rvt_dev_info *rdi, struct rvt_ibport *ibp,
>   		}
>   
>   		/* Search the QP list to see if this is already there. */
> -		list_for_each_entry_rcu(p, &tmcast->qp_list, list) {
> +		list_for_each_entry_rcu(p, &tmcast->qp_list, list, lockdep_is_held(&(ibp->lock))) {
>   			if (p->qp == mqp->qp) {
>   				ret = ESRCH;
>   				goto bail;
> 

This one is OK. The lock is held and it is the correct one to use when 
updating the list.

Reviewed-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
