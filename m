Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F17C3524D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 05:26:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89C52085B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 05:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJayuJpZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B89C52085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8953685772;
	Wed,  5 Feb 2020 05:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ckqs75BY-k6; Wed,  5 Feb 2020 05:26:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 127CE81CC4;
	Wed,  5 Feb 2020 05:26:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEB81C0177;
	Wed,  5 Feb 2020 05:26:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A853EC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9F9BB857D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKBrg1gU9-Yy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:26:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0DA7885772
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:26:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so381797plp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Feb 2020 21:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lVCuHJnMuCmwTfOue9M7b3xZrfn6U2mf9Vp/kH0JJOs=;
 b=cJayuJpZmhN21d7X3rkS5Tr+K3EfQSzoT/0HJFSLNt66wGfiKSP0FyG6cTfzM/7oVF
 o8IpmfXRopueRDlU+qbkKLmIr9BLAJqgHU9SmiyJ9vi7AQ1ML9uzAs7buBBaa4oRPKxE
 hOTsjE0M6zFrn+PmyJiu0+8YwHmlGDBbxSzzzvemYGLOe2OMTgm25HXzn73akKPnO9Lk
 XJ9uGmJv8gsSv57jfVJxHXKLEA1hLu1mhbMixuxv79EgW0dYC38C5uyXgBVEyePyaGJ2
 ilP1rvkY0dAGud8omj3cVnS64RFlkFHW63Zji/Qot9oxZkkoje0tGdx+58HmO1/9nBx6
 +jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lVCuHJnMuCmwTfOue9M7b3xZrfn6U2mf9Vp/kH0JJOs=;
 b=Cbdop5HtnZOqzlCd9OXzHDY4g4JRZOyLTF4k1P+I+FbEztUOC1C77iy+4nY+764lYN
 dVdomuTWBXhJNCgIftoVBtVAMm5b0Lrz5mQvIocCueSg/6Lbf8efZ2P1MTGRUUAdtbWX
 0I0LOCf07w7dYPOCXCV3oIfB7YWo+iJLTePgZ1+mnR58473Jx2gMcfdT+E+xhpBkw7DA
 s0w20gkyfGFP/VmUPcD6efpm5WOrellZpvB2tFN/tF6Ihx8qKKRovaCaF5YlRqvAJocJ
 HLknEoWsLsVHFhhsnyoQi7QWenduB4gEwzeWuN1My7wf9o2xwz0bwA/Y0cGH/zX2US6m
 03aA==
X-Gm-Message-State: APjAAAUdm7OZnWq19+GNxM62PURyiIBQybkfn6uIa8ngPzDjaqM1ywfY
 JTRuvBrjidiFrdtboa0g02Y=
X-Google-Smtp-Source: APXvYqyzZSifvglSEHY4SkdDLNx4HtPkcV2z8C35LMbuNY7OjP2JjNstBX4Mb8HDYkB6XQD165h0jg==
X-Received: by 2002:a17:902:4a:: with SMTP id
 68mr34234329pla.245.1580880399635; 
 Tue, 04 Feb 2020 21:26:39 -0800 (PST)
Received: from workstation-portable ([103.211.17.109])
 by smtp.gmail.com with ESMTPSA id i3sm26130751pfg.94.2020.02.04.21.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 21:26:38 -0800 (PST)
Date: Wed, 5 Feb 2020 10:56:32 +0530
From: Amol Grover <frextrite@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20200205052632.GB1540@workstation-portable>
References: <20200201072703.17330-1-frextrite@gmail.com>
 <20200203163301.GB85781@google.com>
 <20200204200116.479f0c60@oasis.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204200116.479f0c60@oasis.local.home>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] tracing: Annotate
	ftrace_graph_hash pointer with __rcu
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

On Tue, Feb 04, 2020 at 08:01:16PM -0500, Steven Rostedt wrote:
> On Mon, 3 Feb 2020 11:33:01 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> 
> > > --- a/kernel/trace/trace.h
> > > +++ b/kernel/trace/trace.h
> > > @@ -950,22 +950,25 @@ extern void __trace_graph_return(struct trace_array *tr,
> > >  				 unsigned long flags, int pc);
> > >  
> > >  #ifdef CONFIG_DYNAMIC_FTRACE
> > > -extern struct ftrace_hash *ftrace_graph_hash;
> > > +extern struct ftrace_hash __rcu *ftrace_graph_hash;
> > >  extern struct ftrace_hash *ftrace_graph_notrace_hash;
> > >  
> > >  static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
> > >  {
> > >  	unsigned long addr = trace->func;
> > >  	int ret = 0;
> > > +	struct ftrace_hash *hash;
> > >  
> > >  	preempt_disable_notrace();
> > >  
> > > -	if (ftrace_hash_empty(ftrace_graph_hash)) {
> > > +	hash = rcu_dereference_protected(ftrace_graph_hash, !preemptible());  
> > 
> > I think you can use rcu_dereference_sched() here? That way no need to pass
> > !preemptible.
> > 
> > A preempt-disabled section is an RCU "sched flavor" section. Flavors are
> > consolidated in the backend, but in the front end the dereference API still
> > do have flavors.
> 
> Unfortunately, doing it with rcu_dereference_sched() causes a lockdep
> splat :-P. This is because ftrace can execute when rcu is not
> "watching" and that will trigger a lockdep error. That means, this
> origin patch *is* correct. I'm re-applying this one.
> 

Something new to learn, thank you for the information Steve!

Thanks
Amol

> -- Steve
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
