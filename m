Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D2AC33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 11:48:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E0E2214AF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 11:48:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iXjK0EpU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E0E2214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 00B8520429;
	Tue, 28 Jan 2020 11:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1NN6KWsfHEA; Tue, 28 Jan 2020 11:48:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 60B0E203D3;
	Tue, 28 Jan 2020 11:48:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D12CC0178;
	Tue, 28 Jan 2020 11:48:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2ED6C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 11:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 88C5D203D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 11:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0oYwvmLvfcyo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 11:48:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id B6BFC2034F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580212112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lz7R+vtlTh6RBBwj0e/+jD30ITTxMxb0pWI2woJxCN4=;
 b=iXjK0EpUFLJbFcE55x3mbfbnjLLXQtocwKSWSYhlY8It3ijHFQkPYotuFa8ipLHnqnvan4
 eQ/bciTlsFBtSJRiTR0kvbJHBaKtJU6Ky39LylENhcAteUgwhM9rjD2qIJ0c4hbmEXcxLo
 1jMg/mLL1FB/toLRQ3yKq1jOCFHyk/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-UsiETWpOOCi5duRfEJ096Q-1; Tue, 28 Jan 2020 06:48:24 -0500
X-MC-Unique: UsiETWpOOCi5duRfEJ096Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 949F0107ACC4;
 Tue, 28 Jan 2020 11:48:22 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
 by smtp.corp.redhat.com (Postfix) with SMTP id 3FDA788828;
 Tue, 28 Jan 2020 11:48:20 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Tue, 28 Jan 2020 12:48:21 +0100 (CET)
Date: Tue, 28 Jan 2020 12:48:18 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Jann Horn <jannh@google.com>
Message-ID: <20200128114818.GA17943@redhat.com>
References: <20200128072740.21272-1-frextrite@gmail.com>
 <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 James Morris <jamorris@linux.microsoft.com>,
 David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 Joel Fernandes <joel@joelfernandes.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] cred: Use RCU primitives to
	access RCU pointers
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

On 01/28, Jann Horn wrote:
>
> On Tue, Jan 28, 2020 at 8:28 AM Amol Grover <frextrite@gmail.com> wrote:
> > task_struct.cred and task_struct.real_cred are annotated by __rcu,
>
> task_struct.cred doesn't actually have RCU semantics though, see
> commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
> it would probably be more correct to remove the __rcu annotation?

Yes, but get_task_cred() assumes it has RCU semantics... To be honest
I didn't know we have this helper. Can't it race with revert_creds() in
do_faccessat() ?

Oleg.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
