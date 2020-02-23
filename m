Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B448C35671
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 18:19:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 283E0206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 18:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="jSbgn2w7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 283E0206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C337861A0;
	Sun, 23 Feb 2020 18:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3DFO8ZLwku7; Sun, 23 Feb 2020 18:19:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8294E86193;
	Sun, 23 Feb 2020 18:19:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 795FEC1AE2;
	Sun, 23 Feb 2020 18:19:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADC64C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9BD22861A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZr4UJOQJcuK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:19:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 67FD586193
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:19:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so7744910wru.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FqHsgNFlSSHhJTOWB1G7rDoiJVu5BMqVM2zZksRNNdQ=;
 b=jSbgn2w7cVRMomeohFPnY+ivGDINUX5QQpgab5aHCquYazWZCfiXR6X9D2cF64pDA/
 sTmoA5szkmDXbs8uW46tpiPZW0nMrgkRuh7XvGiYe27YXbA2S/cd1IlNu1oLEEHtvSvI
 ken/DNbscknXxXjOuDISRVxkEBlSIgxXpk01uscWMjrhMBIBUkqaIYvfhKvxiuqX1Qah
 6UjW+Vxg2VOgoUFv/syjEBKKGHGH1CgS7hHlZbZedxfj54I8Z6zsYwGqQDNBwseOH5Vs
 /IfJGEd8T5PAMnFh/Hat/Z6ka8F/eLSGUW2MuGJC6ApE9oS8Jq4xtn1y+VIdsUW/6AnJ
 7KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FqHsgNFlSSHhJTOWB1G7rDoiJVu5BMqVM2zZksRNNdQ=;
 b=BIDC9MNmE87vlGh2FIrN9PV2VySNhK3bUmW2FDV4cKUmT6LhT0mWo7n7bdH6RygwVh
 4JQb9t8QEqBLz6BbZrusgvWgMc7yYdK0SrITlkXHqk0FlWtmMPxqr7T12BXRHPVnoCbU
 37mwfPdQ+g84hWhRs2daw03xRFNjGIre6sHAAjtXycs8B1NImbb1lNpUH9VakXGW84m+
 bEmDMvNQR3IdLfE8WE0Pm+Zl9n63so7Gu7GLkMxuOW7oQwP4Zk/VbabGh5QOKeofBtgi
 PiWrGzwC/f561ZBsprKchOZLJRkzH/h9S7f8ZerxhVx3kII6IVTJ8+34kRNsjz6axXS2
 Zh/g==
X-Gm-Message-State: APjAAAUlkXShiCMr/bTzxYJ53M32CMVLjNgmdOoECC2OQZiCz56OqFsf
 NjIFsCN3Adns8fetou/0T3omIA==
X-Google-Smtp-Source: APXvYqzlxbuPW7iVzw2Nc2Q1NWGhU2whm7YsebgkXGuNbziiMil+HIMpmUL5LowpYE+fXL0vkQuIBw==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr37100249wrm.302.1582481975798; 
 Sun, 23 Feb 2020 10:19:35 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id b10sm11285443wmj.48.2020.02.23.10.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 10:19:35 -0800 (PST)
Date: Sun, 23 Feb 2020 19:19:34 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Message-ID: <20200223181934.GG2228@nanopsycho>
References: <20200221165141.24630-1-madhuparnabhowmik10@gmail.com>
 <20200221172008.GA2181@nanopsycho>
 <20200223110342.GB2400@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223110342.GB2400@madhuparna-HP-Notebook>
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 jiri@mellanox.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Use
	built-in RCU list checking
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

Sun, Feb 23, 2020 at 12:03:42PM CET, madhuparnabhowmik10@gmail.com wrote:
>On Fri, Feb 21, 2020 at 06:20:08PM +0100, Jiri Pirko wrote:
>> Fri, Feb 21, 2020 at 05:51:41PM CET, madhuparnabhowmik10@gmail.com wrote:
>> >From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>> >
>> >list_for_each_entry_rcu() has built-in RCU and lock checking.
>> >
>> >Pass cond argument to list_for_each_entry_rcu() to silence
>> >false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
>> >by default.
>> >
>> >Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>> 
>> Reviewed-by: Jiri Pirko <jiri@mellanox.com>
>> 
>> Thanks.
>> 
>> However, there is a callpath where not devlink lock neither rcu read is
>> taken:
>> devlink_dpipe_table_register()->devlink_dpipe_table_find()
>> I guess that was not the trace you were seeing, right?
>> 
>> 
>> >---
>> > net/core/devlink.c | 3 ++-
>> > 1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/net/core/devlink.c b/net/core/devlink.c
>> >index 4c63c9a4c09e..3e8c94155d93 100644
>> >--- a/net/core/devlink.c
>> >+++ b/net/core/devlink.c
>> >@@ -2107,7 +2107,8 @@ devlink_dpipe_table_find(struct list_head *dpipe_tables,
>> > {
>> > 	struct devlink_dpipe_table *table;
>> > 
>> >-	list_for_each_entry_rcu(table, dpipe_tables, list) {
>> >+	list_for_each_entry_rcu(table, dpipe_tables, list,
>> >+				lockdep_is_held(&devlink->lock)) {
>
>Hi Jiri,
>
>I just noticed that this patch does not compile because devlink is
>not passed as an argument to devlink_dpipe_table_find() and it is not
>even global. I am not sure why I didn't encounter this error before
>sending the patch. Anyway, I am sorry about this.
>But it seems to be the right lock that should be held and checked for
>in devlink_dpipe_table_find(). 
>So will it be okay to pass devlink to devlink_dpipe_table_find()?

Sure.

>Anyway devlink_dpipe_table_find() is only called from functions
>within devlink.c.
>
>Let me know what you think about this.
>Thank you,
>Madhuparna
>
>
>> > 		if (!strcmp(table->name, table_name))
>> > 			return table;
>> > 	}
>> >-- 
>> >2.17.1
>> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
