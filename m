Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFB4C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 17:00:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B342465A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 17:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B342465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69E55855D3;
	Tue, 14 Jan 2020 17:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BHZKbwuF6c6; Tue, 14 Jan 2020 17:00:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A63E18610F;
	Tue, 14 Jan 2020 17:00:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 902B6C1D83;
	Tue, 14 Jan 2020 17:00:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50238C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 17:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A17985FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 17:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZAypQl4IVT0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 17:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6D0D986027
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 17:00:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 09:00:36 -0800
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; d="scan'208";a="213395849"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.201.179])
 ([10.254.201.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Jan 2020 09:00:34 -0800
To: Jason Gunthorpe <jgg@ziepe.ca>, madhuparnabhowmik04@gmail.com
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
Date: Tue, 14 Jan 2020 12:00:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200114165740.GB22037@ziepe.ca>
Content-Language: en-US
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1:
 verbs.c: Use built-in RCU list checking
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

On 1/14/2020 11:57 AM, Jason Gunthorpe wrote:
> On Tue, Jan 14, 2020 at 09:53:45PM +0530, madhuparnabhowmik04@gmail.com wrote:
>> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>>
>> list_for_each_entry_rcu has built-in RCU and lock checking.
>> Pass cond argument to list_for_each_entry_rcu.
>>
>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>>   drivers/infiniband/hw/hfi1/verbs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
>> index 089e201d7550..22f2d4fd2577 100644
>> +++ b/drivers/infiniband/hw/hfi1/verbs.c
>> @@ -515,7 +515,7 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
>>   				       opa_get_lid(packet->dlid, 9B));
>>   		if (!mcast)
>>   			goto drop;
>> -		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
>> +		list_for_each_entry_rcu(p, &mcast->qp_list, list, lockdep_is_held(&(ibp->rvp.lock))) {
> 
> Okay, this looks reasonable
> 
> Mike, Dennis, is this the right lock to test?
> 

I'm looking at that right now actually, I don't think this is correct. 
Wanted to talk to Mike before I send a response though.

-Denny
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
