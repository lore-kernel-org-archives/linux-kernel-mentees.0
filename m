Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7CDC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 00:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA74081516;
	Tue,  9 Aug 2022 00:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA74081516
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=P7WoNvVp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcNYnZyum2RU; Tue,  9 Aug 2022 00:34:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F168A8142C;
	Tue,  9 Aug 2022 00:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F168A8142C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6E14C0033;
	Tue,  9 Aug 2022 00:34:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03E0DC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFBCA40319
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFBCA40319
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=P7WoNvVp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlLDoSD7N0qm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:34:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3E81402E5
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3E81402E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:34:29 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y141so9474236pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 17:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=6C9ArOHrYaAILM0KZ4kBvP+nUNIqPYA+uHHXGsdeawA=;
 b=P7WoNvVpS3okL4YI3o5uz9544qztcUEr1d+LExJylyHYHQZklqf4z8S2h44Nc5Rqre
 qNENlB9cRxxMXJSQLaVPA0ibUYmjuaUJxWHlEQg7XuwMMHiCKjfD800w6HWCWFW97jG/
 ipFPUBO9QJxq33W2C+jnkG+6srCtqkLKyelalaRu86/MhVjtgfzdbu2VciP74lTDXia9
 tcw8AMqrymPwqEMiio9pnZkOQSBjcxgOGJcbHeqKSwXLqqqiqfSq/J4xmKGbmk8N1IHN
 DNkD36mh4S1SoQfCQvhfZ0UTfN6afTiLMOCwOk8MufKvKKOHJeMYrKKHKZ0GG2/hN1yX
 s3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=6C9ArOHrYaAILM0KZ4kBvP+nUNIqPYA+uHHXGsdeawA=;
 b=R/SMfOprVjkl5NqL0JRvOX4JsSVwI4erv9XTjIbgkN9fEjdDKg6ByH5QlUQc1qlGun
 J7k3flds9WUsZ+pAsI4rZ/JSDveP0s31ZkO7HzJFRUe+Wt2dK1Ab1qSpCMGoKhL1TPFQ
 Ndn+ZzMHPxvX1t8Jn5szadwZuMmrJEq1ho7pc628HbH0JQbPeVDdH2hsxHvn7pU0t/By
 ElbDRuFHaVNHxTLJRDnXSjlMMimbefEH8yLpY9MhRGEmBid4ePtktr8y42MF68MmAAGO
 ktl0lHmhK/NwGrhBSEuOPpFS21q9JWviHeHj+vZQ2dEtXbKguqaNZG2f8zycQ3To8gqB
 pqPA==
X-Gm-Message-State: ACgBeo3UN5BGo6VtuDeUeW5hEkMzjS/XKdHUrKd+/XVfwVzoOwvetbaS
 gSlsAMW2zFg7o0DP+k+txHFTSA==
X-Google-Smtp-Source: AA6agR4Gz5g5vG/l/tZyqtSjI3vc8zXtknoeHx9hIKW+yKI0a0eBaFzsrwCevFsok5EYWzWVjhoKBA==
X-Received: by 2002:a63:ea11:0:b0:41d:9296:21e6 with SMTP id
 c17-20020a63ea11000000b0041d929621e6mr4696671pgi.603.1660005268964; 
 Mon, 08 Aug 2022 17:34:28 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 o13-20020a17090a420d00b001f260b1954bsm8740402pjg.13.2022.08.08.17.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 17:34:28 -0700 (PDT)
Date: Tue, 9 Aug 2022 00:34:24 +0000
To: Coleman Dietsch <dietschc@csp.edu>
Subject: Re: [PATCH v3 2/2] KVM: x86/xen: Stop Xen timer before changing IRQ
Message-ID: <YvGrkII3Sgw/qTeo@google.com>
References: <20220808190607.323899-2-dietschc@csp.edu>
 <20220808190607.323899-3-dietschc@csp.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220808190607.323899-3-dietschc@csp.edu>
Cc: x86@kernel.org, kvm@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Aug 08, 2022, Coleman Dietsch wrote:
> Stop Xen timer (if it's running) prior to changing the IRQ vector and
> potentially (re)starting the timer. Changing the IRQ vector while the
> timer is still running can result in KVM injecting a garbage event, e.g.
> vm_xen_inject_timer_irqs() could see a non-zero xen.timer_pending from
> a previous timer but inject the new xen.timer_virq.
> 
> Fixes: 536395260582 ("KVM: x86/xen: handle PV timers oneshot mode")
> Cc: stable@vger.kernel.org
> Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
> Reported-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
> Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
