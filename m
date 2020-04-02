Return-Path: <SRS0=QmcU=5S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F85CC2BA15
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 12:56:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19B3820784
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 12:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="X0A+Fzuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19B3820784
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAD26870B2;
	Thu,  2 Apr 2020 12:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLfumzL-JERC; Thu,  2 Apr 2020 12:56:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D34C786FF2;
	Thu,  2 Apr 2020 12:56:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD611C1D74;
	Thu,  2 Apr 2020 12:56:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE6CEC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 12:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CD42087C6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 12:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ye3KUzCBFNlE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 12:56:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 889DB87648
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 12:56:49 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v1so3936199edq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Apr 2020 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kqap/nho/VO53wl1Vvcx8z2BRfU3VDatECjPDe+uq9o=;
 b=X0A+Fzucb/KO5++vaKA82oslAdSJ02Ad2PGxG52ciH4zqaN2Ob8RUBW8nA0UWosKPZ
 PPtJYVvaYCzZ5n035ZACtzQCPpIAM9qZeZqSIl8mp35Gj5eCth7/M8I0LiPpNGrdtrIj
 WT+FKp3KqN4oIGomZ3sb5UiP4Nyaq3Ns7Qx+M5YfSJppFUzriaiMkqNr4qfxo/Bf/FXJ
 gLEwmfs8P6WzW5RbkM7GrzaPiESoKE5R54dzEzPQWQiC9knvJf2ICkuiTbLfmA8/S9hf
 dzKErLHxzxke8Crk1wmgJlTmvnkkz6Uu/ifKaB+UOJb9GU95F096QP35C8CzQ2Wda/Oi
 1oVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kqap/nho/VO53wl1Vvcx8z2BRfU3VDatECjPDe+uq9o=;
 b=Z5Y/AC/dECegj81UBunaHQJwIfbPMvsFi8DTvua5uwFl3dZ2GctxlMzJrNQv9D2Hlg
 97m2covXxy9Qxs6RbaGeBrvmxtwrsXiB61ywWRKXccZ6Ne+8oualeOoAwUuioJz/PCCT
 Bq8Q5PrsrYgupNH89MKI59H/Il5m8TQb+dU6WAZ4apl/+AD1HN4icR8iKahQJQCBtyq5
 cibf/gS3H8D8ozrBXlinV7oswivKu58czo4eB+EzxNwF42CW/JR8Ouw560sd9O/b7o+3
 8GwbjZekmCH2RXgXb0SyVtQJCaach4db1Li1LCpvRFy2DUOgAoQjcWdSrUQGsZPuHs5R
 CmMg==
X-Gm-Message-State: AGi0PuYKqaL3slOOOU8tcM/4FGBnxXigA4udhO5WZCqGA+HqhM4TotNm
 TIJzHY1/IbXC09D3tridlzEaX17HtiDaWnD19nLH
X-Google-Smtp-Source: APiQypLVYVm4b4T8DRqBziIjHudBd14857uA+siaIatX8UbnCBqo/2HtxpahLb9nbo8P4Et/bV6FLvts7uscuxu9uyA=
X-Received: by 2002:a17:906:583:: with SMTP id 3mr3007633ejn.308.1585832207648; 
 Thu, 02 Apr 2020 05:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
 <20200402055640.6677-3-frextrite@gmail.com>
In-Reply-To: <20200402055640.6677-3-frextrite@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Apr 2020 08:56:36 -0400
Message-ID: <CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
To: Amol Grover <frextrite@gmail.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 James Morris <jamorris@linux.microsoft.com>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-audit@redhat.com, "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/3 RESEND] auditsc: Do not use
 RCU primitive to read from cred pointer
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

On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> task_struct::cred is only used task-synchronously and does
> not require any RCU locks, hence, rcu_dereference_check is
> not required to read from it.
>
> Suggested-by: Jann Horn <jannh@google.com>
> Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/auditsc.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

This is the exact same patch I ACK'd back in February, yes?

https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4effe01ebbe2..d3510513cdd1 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
>  /* Determine if any context name data matches a rule's watch data */
>  /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
>   * otherwise.
> - *
> - * If task_creation is true, this is an explicit indication that we are
> - * filtering a task rule at task creation time.  This and tsk == current are
> - * the only situations where tsk->cred may be accessed without an rcu read lock.
>   */
>  static int audit_filter_rules(struct task_struct *tsk,
>                               struct audit_krule *rule,
>                               struct audit_context *ctx,
>                               struct audit_names *name,
> -                             enum audit_state *state,
> -                             bool task_creation)
> +                             enum audit_state *state)
>  {
>         const struct cred *cred;
>         int i, need_sid = 1;
>         u32 sid;
>         unsigned int sessionid;
>
> -       cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
> +       cred = tsk->cred;
>
>         for (i = 0; i < rule->field_count; i++) {
>                 struct audit_field *f = &rule->fields[i];
> @@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
>         rcu_read_lock();
>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
>                 if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
> -                                      &state, true)) {
> +                                      &state)) {
>                         if (state == AUDIT_RECORD_CONTEXT)
>                                 *key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
>                         rcu_read_unlock();
> @@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
>         list_for_each_entry_rcu(e, list, list) {
>                 if (audit_in_mask(&e->rule, ctx->major) &&
>                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
> -                                      &state, false)) {
> +                                      &state)) {
>                         rcu_read_unlock();
>                         ctx->current_state = state;
>                         return state;
> @@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
>
>         list_for_each_entry_rcu(e, list, list) {
>                 if (audit_in_mask(&e->rule, ctx->major) &&
> -                   audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
> +                   audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
>                         ctx->current_state = state;
>                         return 1;
>                 }
> --
> 2.24.1

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
