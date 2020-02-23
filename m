Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B7CC35673
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 23:34:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98368206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 23:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98368206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 419A385D52;
	Sun, 23 Feb 2020 23:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEsjNH8-9Qhp; Sun, 23 Feb 2020 23:34:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 166268251D;
	Sun, 23 Feb 2020 23:34:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9BF9C18DA;
	Sun, 23 Feb 2020 23:34:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 902B5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 23:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 79843862DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 23:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELFXNxSFk7Ss
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 23:34:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A0CA386246
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 23:34:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Feb 2020 15:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,477,1574150400"; d="scan'208";a="349801062"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.230])
 ([10.254.212.230])
 by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2020 15:34:48 -0800
To: Amol Grover <frextrite@gmail.com>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Qian Cai <cai@lca.pw>,
 Deepa Dinamani <deepa.kernel@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20200223165538.29870-1-frextrite@gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <d1d7506c-b692-3730-fb01-5af86ab06258@linux.intel.com>
Date: Mon, 24 Feb 2020 07:34:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200223165538.29870-1-frextrite@gmail.com>
Content-Language: en-US
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, baolu.lu@linux.intel.com
Subject: Re: [Linux-kernel-mentees] [PATCH RESEND] iommu: dmar: Fix RCU list
	debugging warnings
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

On 2020/2/24 0:55, Amol Grover wrote:
> dmar_drhd_units is traversed using list_for_each_entry_rcu()
> outside of an RCU read side critical section but under the
> protection of dmar_global_lock. Hence add corresponding lockdep
> expression to silence the following false-positive warnings:
> 
> [    1.603975] =============================
> [    1.603976] WARNING: suspicious RCU usage
> [    1.603977] 5.5.4-stable #17 Not tainted
> [    1.603978] -----------------------------
> [    1.603980] drivers/iommu/intel-iommu.c:4769 RCU-list traversed in non-reader section!!
> 
> [    1.603869] =============================
> [    1.603870] WARNING: suspicious RCU usage
> [    1.603872] 5.5.4-stable #17 Not tainted
> [    1.603874] -----------------------------
> [    1.603875] drivers/iommu/dmar.c:293 RCU-list traversed in non-reader section!!
> 
> Tested-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Thanks for the fix.

Cc: stable@vger.kernel.org
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
