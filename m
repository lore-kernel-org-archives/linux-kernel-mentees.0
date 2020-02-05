Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9F0C35247
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 23:31:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DC62082E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 23:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DC62082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1D9FA20243;
	Wed,  5 Feb 2020 23:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4XdsSmrbNxW; Wed,  5 Feb 2020 23:31:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 568AE1FD7D;
	Wed,  5 Feb 2020 23:31:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38416C1D81;
	Wed,  5 Feb 2020 23:31:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF990C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 23:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE6B883204
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 23:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueoESge6OYPa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 23:30:59 +0000 (UTC)
X-Greylist: delayed 00:29:17 by SQLgrey-1.7.6
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 31AA882507
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 23:30:58 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out03.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@gmail.com>)
 id 1izTfx-0003qf-3V; Wed, 05 Feb 2020 16:01:41 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@gmail.com>)
 id 1izTfw-0003aP-3A; Wed, 05 Feb 2020 16:01:40 -0700
From: ebiederm@gmail.com (Eric W. Biederman)
To: madhuparnabhowmik10@gmail.com
In-Reply-To: <20200205172437.10113-1-madhuparnabhowmik10@gmail.com>
 (madhuparnabhowmik's message of "Wed, 5 Feb 2020 22:54:37 +0530")
References: <20200205172437.10113-1-madhuparnabhowmik10@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 05 Feb 2020 16:59:52 -0600
Message-ID: <87wo90myhj.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
X-XM-SPF: eid=1izTfw-0003aP-3A; ; ; mid=<87wo90myhj.fsf@x220.int.ebiederm.org>;
 ; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@gmail.com; ; ; spf=softfail
X-XM-AID: U2FsdGVkX19SlWeMtxZF3em6BGlwGbQs4O7QcR8gtuc=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@gmail.com
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, oleg@redhat.com,
 joel@joelfernandes.org, ebiederm@xmission.com, tj@kernel.org,
 christian.brauner@ubuntu.com, linux-kernel-mentees@lists.linuxfoundation.org,
 guro@fb.com
Subject: Re: [Linux-kernel-mentees] [PATCH] signal.c: Fix sparse warnings
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

madhuparnabhowmik10@gmail.com writes:

> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
> This patch fixes the following two sparse warnings caused due to
> accessing RCU protected pointer tsk->parent without rcu primitives.
>
> kernel/signal.c:1948:65: warning: incorrect type in argument 1 (different address spaces)
> kernel/signal.c:1948:65:    expected struct task_struct *tsk
> kernel/signal.c:1948:65:    got struct task_struct [noderef] <asn:4> *parent
> kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> kernel/signal.c:1949:40:    expected void const volatile *p
> kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> kernel/signal.c:1949:40:    expected void const volatile *p
> kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  kernel/signal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 9ad8dea93dbb..8227058ea8c4 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  	 * correct to rely on this
>  	 */
>  	rcu_read_lock();
> -	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
> -	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
> +	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_dereference(tsk->parent)));
> +	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_dereference(tsk->parent), user_ns),
>  				       task_uid(tsk));
>  	rcu_read_unlock();


Still wrong because that access fundamentally depends upon the
task_list_lock no the rcu_read_lock.  Things need to be consistent for
longer than the rcu_read_lock is held.

This patch makes sparse happy and confuses programmers who are trying to
read the code.


Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
