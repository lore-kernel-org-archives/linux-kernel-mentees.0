Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1D9C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 00:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 622E74028D;
	Tue,  9 Aug 2022 00:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 622E74028D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VyTvIIKo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUkCpuEzLGtP; Tue,  9 Aug 2022 00:32:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 686D6403E9;
	Tue,  9 Aug 2022 00:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 686D6403E9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 267DFC0033;
	Tue,  9 Aug 2022 00:32:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3A46C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA40F403E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA40F403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-IAYW-n0dWY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022DA4028D
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 022DA4028D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:32:37 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id bh13so10036979pgb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 17:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=+HUkPvuuOTk15ciD228fegwLapHu71WyDv7F8CnSYGY=;
 b=VyTvIIKo32Ts14uZj4gGJQgFNn6PxunBV0AToi9VGIWi7EL6AdRczj8mEy6bWULths
 flHjCXT75SfRoJUeLfyEBmwFOSurufSgfe2FC9XVzvvv8+xfCpTqG1Rup+IKt8iikJX6
 nFSgMEsAbGOy0pdnVq+6hM9WWfTyL+sUhnUxBwukd0qGXf/U6HNxF34IPWQBs1VJKxEI
 bcgBNhWQ0+OAkk70nzQIroovFAeCtwm6MQcloyL4wFvYMrpY2O6F+krn0g5XEAjIFVzk
 Al5GB6yvEq710fqPAaCrQU9L3wsfrRj9TuQOY08QIjZ0Jn0IZu4a10Qaeaxbsbps2hd0
 w/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=+HUkPvuuOTk15ciD228fegwLapHu71WyDv7F8CnSYGY=;
 b=1r69QSXMYcJAhjFvSiRE0dsZzbVXNgIpo8h54dJ0HfmLKGzRs/Ws7exrKq4I5QJz0H
 veyp2z4Va0amMdyByd+CdxY7XEBpqxqt5HPTS4EBG2YyZyzy3awR2vO+puSGNSiaNUOY
 HLDdsX1DIdX78o7Apsq+hokiONeCzwuLSlNCd7X6D24Gya3yPZU3OBdDV0jn8ipKijGS
 7TGUqm3tGLE4zAm4TdeiMisUlkaRpklRm/cfJK885bGFhynVlVJWrw/XQDIIcW5jklWa
 7owPV/SHVuEo72zkK8Oc5PPTqGa+4QWg4flO0CqHP1NE9udAaasP79YpSZj9A/YVQEIO
 1oxg==
X-Gm-Message-State: ACgBeo30MhO6xNPJtVfBbRoS4mofk6drnbNLcVTvZxn3FnpuHNJ1KVxc
 NTgQJj5AM2X/HK3gWyuNaDEy3A==
X-Google-Smtp-Source: AA6agR7jgM8JWZBNu1rsmqJnQn/jphTPiG4ismAXtRvvJsZ/fP8mhLlgJgwJ7VMAi8Mw3Z2KTh1qtw==
X-Received: by 2002:aa7:8d04:0:b0:52e:1778:bcde with SMTP id
 j4-20020aa78d04000000b0052e1778bcdemr21125368pfe.58.1660005157295; 
 Mon, 08 Aug 2022 17:32:37 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 y3-20020aa793c3000000b005289fad1bbesm9539394pff.94.2022.08.08.17.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 17:32:36 -0700 (PDT)
Date: Tue, 9 Aug 2022 00:32:33 +0000
To: Coleman Dietsch <dietschc@csp.edu>
Subject: Re: [PATCH v3 1/2] KVM: x86/xen: Initialize Xen timer only once
Message-ID: <YvGrIRlJThFoLPsb@google.com>
References: <20220808190607.323899-2-dietschc@csp.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220808190607.323899-2-dietschc@csp.edu>
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
> Add a check for existing xen timers before initializing a new one.
> 
> Currently kvm_xen_init_timer() is called on every
> KVM_XEN_VCPU_ATTR_TYPE_TIMER, which is causing the following ODEBUG
> crash when vcpu->arch.xen.timer is already set.
> 
> ODEBUG: init active (active state 0)
> object type: hrtimer hint: xen_timer_callbac0
> RIP: 0010:debug_print_object+0x16e/0x250 lib/debugobjects.c:502
> Call Trace:
> __debug_object_init
> debug_hrtimer_init
> debug_init
> hrtimer_init
> kvm_xen_init_timer
> kvm_xen_vcpu_set_attr
> kvm_arch_vcpu_ioctl
> kvm_vcpu_ioctl
> vfs_ioctl
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
