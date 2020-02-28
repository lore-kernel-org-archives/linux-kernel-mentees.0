Return-Path: <SRS0=XrqI=4Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C6FC3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 11:49:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82AE7246AA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 11:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82AE7246AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57B3584FB1;
	Fri, 28 Feb 2020 11:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MI1ba6uLc6nz; Fri, 28 Feb 2020 11:49:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3489287F0C;
	Fri, 28 Feb 2020 11:49:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C37EC1D84;
	Fri, 28 Feb 2020 11:49:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70328C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 11:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5883D86DE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 11:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aoKt19xS3aDT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 11:49:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C1FB1864F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 11:49:07 +0000 (UTC)
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 3EA0F548ADD1CC5E62CD;
 Fri, 28 Feb 2020 11:49:03 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 28 Feb 2020 11:49:02 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Fri, 28 Feb
 2020 11:49:02 +0000
To: Amol Grover <frextrite@gmail.com>, Corey Minyard <minyard@acm.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200228081731.18149-1-frextrite@gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <b843fa9d-7fd3-940f-fb18-5ce3bef3a9be@huawei.com>
Date: Fri, 28 Feb 2020 11:49:01 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200228081731.18149-1-frextrite@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml708-chm.china.huawei.com (10.201.108.57) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: "Paul E . Mckenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] ipmi: Fix RCU list lockdep
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

On 28/02/2020 08:17, Amol Grover wrote:
> It is completely safe to traverse ipmi_interfaces and
> intf->users under SRCU read lock using list_for_each_entry_rcu().
> Tell lockdep about it as well else it will show false-positive
> warnings as the one below.
> 
> Fixes the following false-positive warning and others that may follow.
> 
> [   29.772408] =============================
> [   29.776863] WARNING: suspicious RCU usage
> [   29.780915] 5.6.0-rc3-00001-g907305ae6618-dirty #1755 Not tainted
> [   29.787046] -----------------------------
> [   29.791100] drivers/char/ipmi/ipmi_msghandler.c:744 RCU-list traversed in
> non-reader section!!
> 
> Reported-by: John Garry <john.garry@huawei.com>
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Tested-by: John Garry <john.garry@huawei.com>

Thanks, the warnings have gone away with this

> ---
>   drivers/char/ipmi/ipmi_msghandler.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index cad9563f8f48..d202022c69de 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -741,7 +741,8 @@ int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
>   	list_add(&watcher->link, &smi_watchers);
>   
>   	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>   		int intf_num = READ_ONCE(intf->intf_num);
>   
>   		if (intf_num == -1)
> @@ -1188,7 +1189,8 @@ int ipmi_create_user(unsigned int          if_num,
>   		return -ENOMEM;
>   
>   	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>   		if (intf->intf_num == if_num)
>   			goto found;
>   	}
> @@ -1241,7 +1243,8 @@ int ipmi_get_smi_info(int if_num, struct ipmi_smi_info *data)
>   	struct ipmi_smi *intf;
>   
>   	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>   		if (intf->intf_num == if_num)
>   			goto found;
>   	}
> @@ -4098,7 +4101,8 @@ static int handle_read_event_rsp(struct ipmi_smi *intf,
>   	 * getting events.
>   	 */
>   	index = srcu_read_lock(&intf->users_srcu);
> -	list_for_each_entry_rcu(user, &intf->users, link) {
> +	list_for_each_entry_rcu(user, &intf->users, link,
> +				srcu_read_lock_held(&intf->users_srcu)) {
>   		if (!user->gets_events)
>   			continue;
>   
> @@ -4453,7 +4457,8 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>   		int index;
>   
>   		index = srcu_read_lock(&intf->users_srcu);
> -		list_for_each_entry_rcu(user, &intf->users, link) {
> +		list_for_each_entry_rcu(user, &intf->users, link,
> +					srcu_read_lock_held(&intf->users_srcu)) {
>   			if (user->handler->ipmi_watchdog_pretimeout)
>   				user->handler->ipmi_watchdog_pretimeout(
>   					user->handler_data);
> @@ -4746,7 +4751,8 @@ static void ipmi_timeout(struct timer_list *unused)
>   		return;
>   
>   	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>   		if (atomic_read(&intf->event_waiters)) {
>   			intf->ticks_to_req_ev--;
>   			if (intf->ticks_to_req_ev == 0) {
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
