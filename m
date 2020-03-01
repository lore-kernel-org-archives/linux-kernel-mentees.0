Return-Path: <SRS0=fG7l=4S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34DBC3F2D5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 20:13:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8142246BF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 20:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8142246BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E48785540;
	Sun,  1 Mar 2020 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmMoOKfrxsuK; Sun,  1 Mar 2020 20:13:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C7CBD85168;
	Sun,  1 Mar 2020 20:13:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3F01C07FE;
	Sun,  1 Mar 2020 20:13:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EA6FC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7D9A885168
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTxAkK0Mud97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:13:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B735385540
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:13:04 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 5so2697773oiy.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Mar 2020 12:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFSBXCeJ1jB8KcQMkp6NN1TRtUlXUbslxnRcWQMIR6I=;
 b=Kch62l3B9SHy1R8r0qfrfhVxHpo2RbINUfexzzai44+VjQfe9KeMbH/ZRrSL7YIvrU
 5f0ADHUtu3vp633cG87kgJDQ8VnfUZR1usEXugEVgSGyn2bA5XrD7RXO0PF2swrlKTOc
 QJm1ONCwKmWJUIqJP7BMoQXTQ2r+Hj6RRVtdEY0zVB4OMnTh9MmD2Wo0+t2rWFHB4E/N
 An2i4/tmxEj68n863WBrNyGhobi3b8lRYOfgRVSUZ7kBGE5+xoxcWQXbCCOMLeWRPTGk
 gdIdQpb47+zO+S4BoG6jUCcpRjiXwc+1IaRc1amGl/zliZ+Oy0U/jKi9phgXwLzJe+Ua
 E4cg==
X-Gm-Message-State: APjAAAUV3s1V8xxH0Xu/cyr/+y/1e+Gs51IJu6OpsnOYfYyPwAAMu9RH
 jZ/kgibhcQfqceda0uOjqpRFMfLi8Ml9pM2MbGQ=
X-Google-Smtp-Source: APXvYqxbxPHmtfRGPpPP1hveHtyD20S1Jgyu5yQkA7cDSv5uULtoifR1CJMcxL/u/2XdY7RWZkl38PW9OoOvYdgqVlM=
X-Received: by 2002:aca:c044:: with SMTP id q65mr4390997oif.68.1583093583908; 
 Sun, 01 Mar 2020 12:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
In-Reply-To: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 1 Mar 2020 21:12:53 +0100
Message-ID: <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
To: madhuparnabhowmik10@gmail.com, Joel Fernandes <joel@joelfernandes.org>
Cc: Len Brown <len.brown@intel.com>, paulmck@kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power: main:
	Use built-in RCU list checking
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

On Fri, Feb 28, 2020 at 6:47 PM <madhuparnabhowmik10@gmail.com> wrote:
>
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
> This patch passes the cond argument to list_for_each_entry_rcu()
> to fix the following false-positive lockdep warnings:
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

I don't see these warnings in the kernels run locally here.

What do you do to get them?

Joel, any comments here?

>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  drivers/base/power/main.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 0e99a760aebd..742c05f3c1e7 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -266,7 +266,8 @@ static void dpm_wait_for_suppliers(struct device *dev, bool async)
>          * callbacks freeing the link objects for the links in the list we're
>          * walking.
>          */
> -       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
> +       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
> +                               device_links_read_lock_held())
>                 if (READ_ONCE(link->status) != DL_STATE_DORMANT)
>                         dpm_wait(link->supplier, async);
>
> @@ -323,7 +324,8 @@ static void dpm_wait_for_consumers(struct device *dev, bool async)
>          * continue instead of trying to continue in parallel with its
>          * unregistration).
>          */
> -       list_for_each_entry_rcu(link, &dev->links.consumers, s_node)
> +       list_for_each_entry_rcu(link, &dev->links.consumers, s_node,
> +                                device_links_read_lock_held())
>                 if (READ_ONCE(link->status) != DL_STATE_DORMANT)
>                         dpm_wait(link->consumer, async);
>
> @@ -1235,7 +1237,8 @@ static void dpm_superior_set_must_resume(struct device *dev)
>
>         idx = device_links_read_lock();
>
> -       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
> +       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
> +                                device_links_read_lock_held())
>                 link->supplier->power.must_resume = true;
>
>         device_links_read_unlock(idx);
> @@ -1695,7 +1698,8 @@ static void dpm_clear_superiors_direct_complete(struct device *dev)
>
>         idx = device_links_read_lock();
>
> -       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node) {
> +       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
> +                                device_links_read_lock_held()) {
>                 spin_lock_irq(&link->supplier->power.lock);
>                 link->supplier->power.direct_complete = false;
>                 spin_unlock_irq(&link->supplier->power.lock);
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
