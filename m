Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5708DC3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 16:04:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ABF32146E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 16:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ABF32146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0805E85B00;
	Mon,  2 Mar 2020 16:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsAr+pzuBjQ2; Mon,  2 Mar 2020 16:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82E2984237;
	Mon,  2 Mar 2020 16:04:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F617C1AE2;
	Mon,  2 Mar 2020 16:04:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C44A2C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 16:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B191C204A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 16:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8i9s9YQc-yC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 16:04:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 32EBB2049F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 16:04:18 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6CE8E5BC; Mon,  2 Mar 2020 17:04:16 +0100 (CET)
Date: Mon, 2 Mar 2020 17:04:13 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200302160412.GA7829@8bytes.org>
References: <20200223165538.29870-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223165538.29870-1-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, Qian Cai <cai@lca.pw>,
 Deepa Dinamani <deepa.kernel@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Lu Baolu <baolu.lu@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Feb 23, 2020 at 10:25:39PM +0530, Amol Grover wrote:
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
> ---
>  include/linux/dmar.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied, thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
