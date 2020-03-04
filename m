Return-Path: <SRS0=g2Ly=4V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F05AC3F2D8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Mar 2020 11:08:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16B620705
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Mar 2020 11:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16B620705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5C468797A;
	Wed,  4 Mar 2020 11:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLaJ5cutIBKa; Wed,  4 Mar 2020 11:08:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F232E87941;
	Wed,  4 Mar 2020 11:08:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9E5CC089F;
	Wed,  4 Mar 2020 11:08:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40A1DC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Mar 2020 11:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 27223862BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Mar 2020 11:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJ8RWRYO4h5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Mar 2020 11:08:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C48078138B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Mar 2020 11:08:01 +0000 (UTC)
Received: from 79.184.237.41.ipv4.supernova.orange.pl (79.184.237.41) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.341)
 id 2bd8be21abd0c5ba; Wed, 4 Mar 2020 12:07:58 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: madhuparnabhowmik10@gmail.com
Date: Wed, 04 Mar 2020 12:07:58 +0100
Message-ID: <1643853.WSYDh8IRHD@kreacher>
In-Reply-To: <20200303194130.24617-1-madhuparnabhowmik10@gmail.com>
References: <20200303194130.24617-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Cc: len.brown@intel.com, paulmck@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, pavel@ucw.cz, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power:
	main.c: Use built-in RCU list checking
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

On Tuesday, March 3, 2020 8:41:30 PM CET madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> This patch passes the cond argument to list_for_each_entry_rcu()
> to fix the following false-positive lockdep warnings:
> (with CONFIG_PROVE_RCU_LIST = y)
> 
> [  330.302784] =============================
> [  330.302789] WARNING: suspicious RCU usage
> [  330.302796] 5.6.0-rc1+ #5 Not tainted
> [  330.302801] -----------------------------
> [  330.302808] drivers/base/power/main.c:326 RCU-list traversed in non-reader section!!
> 
> [  330.303303] =============================
> [  330.303307] WARNING: suspicious RCU usage
> [  330.303311] 5.6.0-rc1+ #5 Not tainted
> [  330.303315] -----------------------------
> [  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in non-reader section!!
> 
> [  331.934969] =============================
> [  331.934971] WARNING: suspicious RCU usage
> [  331.934973] 5.6.0-rc1+ #5 Not tainted
> [  331.934975] -----------------------------
> [  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in non-reader section!!
> 
> [  332.467772] WARNING: suspicious RCU usage
> [  332.467775] 5.6.0-rc1+ #5 Not tainted
> [  332.467775] -----------------------------
> [  332.467778] drivers/base/power/main.c:269 RCU-list traversed in non-reader section!!
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  drivers/base/power/main.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 0e99a760aebd..6d1dee7051eb 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -40,6 +40,10 @@
>  
>  typedef int (*pm_callback_t)(struct device *);
>  
> +#define list_for_each_entry_rcu_locked(pos, head, member) \
> +	list_for_each_entry_rcu(pos, head, member, \
> +			device_links_read_lock_held())
> +
>  /*
>   * The entries in the dpm_list list are in a depth first order, simply
>   * because children are guaranteed to be discovered after parents, and
> @@ -266,7 +270,7 @@ static void dpm_wait_for_suppliers(struct device *dev, bool async)
>  	 * callbacks freeing the link objects for the links in the list we're
>  	 * walking.
>  	 */
> -	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
> +	list_for_each_entry_rcu_locked(link, &dev->links.suppliers, c_node)
>  		if (READ_ONCE(link->status) != DL_STATE_DORMANT)
>  			dpm_wait(link->supplier, async);
>  
> @@ -323,7 +327,7 @@ static void dpm_wait_for_consumers(struct device *dev, bool async)
>  	 * continue instead of trying to continue in parallel with its
>  	 * unregistration).
>  	 */
> -	list_for_each_entry_rcu(link, &dev->links.consumers, s_node)
> +	list_for_each_entry_rcu_locked(link, &dev->links.consumers, s_node)
>  		if (READ_ONCE(link->status) != DL_STATE_DORMANT)
>  			dpm_wait(link->consumer, async);
>  
> @@ -1235,7 +1239,7 @@ static void dpm_superior_set_must_resume(struct device *dev)
>  
>  	idx = device_links_read_lock();
>  
> -	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
> +	list_for_each_entry_rcu_locked(link, &dev->links.suppliers, c_node)
>  		link->supplier->power.must_resume = true;
>  
>  	device_links_read_unlock(idx);
> @@ -1695,7 +1699,7 @@ static void dpm_clear_superiors_direct_complete(struct device *dev)
>  
>  	idx = device_links_read_lock();
>  
> -	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node) {
> +	list_for_each_entry_rcu_locked(link, &dev->links.suppliers, c_node) {
>  		spin_lock_irq(&link->supplier->power.lock);
>  		link->supplier->power.direct_complete = false;
>  		spin_unlock_irq(&link->supplier->power.lock);
> 

Applied along with the [2/2] (with updated changelogs) as 5.7 material.

Thanks!




_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
