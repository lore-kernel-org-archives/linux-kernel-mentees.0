Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12984C33CB3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 09:30:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFB724681
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 09:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="VzGyPT+y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCFB724681
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9C33A20413;
	Tue, 28 Jan 2020 09:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtQ+syCYy4O7; Tue, 28 Jan 2020 09:30:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B78A1FEF0;
	Tue, 28 Jan 2020 09:30:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 030CCC0178;
	Tue, 28 Jan 2020 09:30:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53019C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 09:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 49A0685631
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 09:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBBNgAwb9i5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 09:30:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2C12285582
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 09:30:48 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 77so11348052oty.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 01:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yh41YjQOL6v5qPkhPRLG/JO3Fw/88a695J6NKkJZrX0=;
 b=VzGyPT+yQnMZWoX1YeBN9u8Fx5p+Am8kWrm005R45IP8atXD3C+oTdtHxSOA5v9BRE
 3Nig17W/n+ysFLzSZAFhSx3yjCeq+JLnmIcBu3dJ8nsNKx/4Q/bYUFTUbDjmze6metaP
 Hy3VRvHtnNsmHjt8W/xS4mDccKPlw8UL4hwQmxuQ9DzABpDaJE7b3DR9Jd1v58JmVsv0
 MVNYjHw494rtK0iFkHcOGuIPm6dyRgOvqti7c5R/MbBVHMaBNSSwoscjG2dlDlnKGPgN
 vLy4PB4tKkgZ3053449rUXz2ZNMb53RTi2tkML4hNLrxnFwbpBW75aMMsRkM+v+X0Y+A
 36mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yh41YjQOL6v5qPkhPRLG/JO3Fw/88a695J6NKkJZrX0=;
 b=gL/N5Ew/9akmRGtGM9D9eev3lMleAffq1E0Br9AztqbHNhJsHQteIcPWskbj0h6/tR
 ml7xtG5GrMxnZlKgBaxPbkd3bKm7K3TPqtvefkc9F3kvyWPw5fBEimxJvtruvUOepU7F
 xm+r6xeRfBhC8K0auHYXg/PE4dgXucVT5d/Dkkql4EqJtxYuXQBkbST5gYHb5Yn22GzK
 7abbgH+CxUPmFQ7Mvt06HAc0jp1pPCUIoQDgGT373ZNbAjTggDMOccSk7NuuzmEJxQFg
 kjcM8eloOkgBsnqU7zEVxmq3wUHpRA+S0UsbZwYEitkDTyc7gpCVTRxwRf/KbpcGV5IR
 k48Q==
X-Gm-Message-State: APjAAAUFcGWDBYOaH7mVUtY2WwSeCXv7Qto3CjlceXtv9jiX6I76Jap8
 tnZHaCrJYwOyxZFutF2L8QAbqb/9DJDSk6mI6+gXMA==
X-Google-Smtp-Source: APXvYqymR8w/Jv0Wq2tNhPnRAIsBKyqe0PLz5bMDnxBePf0GK0M2eqKuON/UlhLLm577QR6m4J2QrKzRKeI22A+nyXA=
X-Received: by 2002:a05:6830:1d6e:: with SMTP id
 l14mr15362244oti.32.1580203847077; 
 Tue, 28 Jan 2020 01:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20200128072740.21272-1-frextrite@gmail.com>
In-Reply-To: <20200128072740.21272-1-frextrite@gmail.com>
Date: Tue, 28 Jan 2020 10:30:19 +0100
Message-ID: <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
To: Amol Grover <frextrite@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, James Morris <jamorris@linux.microsoft.com>,
 kernel list <linux-kernel@vger.kernel.org>,
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
From: Jann Horn via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jan 28, 2020 at 8:28 AM Amol Grover <frextrite@gmail.com> wrote:
> task_struct.cred and task_struct.real_cred are annotated by __rcu,

task_struct.cred doesn't actually have RCU semantics though, see
commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
it would probably be more correct to remove the __rcu annotation?

> hence use rcu_access_pointer to access them.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
