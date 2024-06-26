Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5BE192B7A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719432532; cv=none; b=RUP9OxzeLU6U17OiTfA5hMx9eVmOgcdX0P1tpiApVSzFOYUy9LRUZ1mkyg+Geb4xtx8ybvpK7C3aVDdySESi6vfwqShK8nEwj3PwVgAGa2z8Sz6G/fw5XCXn2elxh/PV9kOir/1pOvHJRE8fht6DaWaWyuPL4+KoXslB84xKjLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719432532; c=relaxed/simple;
	bh=4S0EVxaJe8fpJ7++KuVyrQMRoO8WSKD0yaA4rxhijs8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u9PcT/+PmvM2wA2OjLbd9OWkL+mILo8vTLN4nQoRG3as39OAjwKZWN4X45AM8KDiTV73Y9Pipfe+BiJEMG1aIoqivqYXNa7I+fbly+DVEoOeKNXb1MITuYKwODUxNXmXpkOtAAvp1FF6oOJDYIhmiEp5YC9BFm1XeVsWMbdHUg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jvMbGI4y; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jvMbGI4y"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C93401D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 20:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfpwMMbgovoX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jun 2024 20:08:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3uhv8zgykagcxjfsohlttlqj.htr@flex--seanjc.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D45C7401CE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45C7401CE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jvMbGI4y
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D45C7401CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 20:08:49 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2c7a6c639bfso8755737a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 13:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719432529; x=1720037329; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jZUK64owq78D+nkswI+vsRdMEdD3oJn8Wq+egIOghUI=;
        b=jvMbGI4yCmRZ7J3/G+5FjLYB9kbM92U7tn3BtWv6+BC8ur4jwI6JX0VlFHaQvEmuKn
         0ay2E6eaD1DOcCRfANTeRiq321Y1Y9uMl7lOKCMjEMVRqOcCKagoEi28CvNrbRkV61Uu
         p/JbwmOAwiALgYatOsZoW4AwLguX8SBkWdtlXrEcacd/S5UZqSxsv0QTmRR5I4ycrjWa
         7v1/ppOGukYifVvuwyUO45+F5E/8n9Tq0Ek73kKruDofGzmZd1kfWljkfzS67sFCW4Wt
         ToIYqR/skqt6YHUEsqKYqLKIRysErjh2fTgyR0XVVHtuh3aoIYE4ZKzZPpuFV3JG2aku
         Egxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719432529; x=1720037329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZUK64owq78D+nkswI+vsRdMEdD3oJn8Wq+egIOghUI=;
        b=M+yau66ljkaHuLLvvV0g+0MAlPOzsUUrn/buvfTuBaqT+Qy8JouANUtgfDuJ1Io+CR
         uvwVOoU0qa4Gm+3LSt9A7yEtf8rBE9eGxEx4Uo1x3RQBLuwgWU+0Nat/bNL3tMHA5ATo
         EGZEv18HkIeTCGmNPSkrKJxee4t8WSOvDu/mJgz75NsCGCvKBMV7dgrHvFsFEQK5GdNR
         YacWo+UUCUbNHgl2DthkyMQDAYwhaMHMOluluUjzjdzV2D5PM+Av3nkcRNbD+S/abani
         W+bmGt09E3xSEHAkZq3CTWmkGbBT1xmfndNm2ILH0PIZ4yZrJISQGPJqil3KONW6x45l
         bGKA==
X-Forwarded-Encrypted: i=1; AJvYcCWdX6fG8j+bERSOSIl7keOEhLcirdxDERXeySjPfj9TUnIIIFtaCxtsB4wPv5Wcxtbq6KciPArvsONZ6qrOseg4SxcyWu7xdJ6r+USUa1vY7z2y+N9pL4iKTbUfzx72
X-Gm-Message-State: AOJu0YwuVE7S3PjAik+vamq165hS0T6p3Ug7Ur9qC7gUzpQcBEE8V9wz
	oXiJrN3bkaklAxYNqQB6RzkCiFm5/J68UNvKS7C0wXkEI0bmRQYsiV5ctYmbV5L8EOLM1PBM7u+
	gBA==
X-Google-Smtp-Source: AGHT+IFobNEQjS9eARQk343geD0ViRI6gKHOTxtiSoNxckgqOSHSLxWkgoxi1wsgrpQuiN+Asg30a0OYQEc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4d8c:b0:2bd:f679:24ac with SMTP id
 98e67ed59e1d1-2c857c4b24emr39492a91.0.1719432528807; Wed, 26 Jun 2024
 13:08:48 -0700 (PDT)
Date: Wed, 26 Jun 2024 13:08:47 -0700
In-Reply-To: <20240625-bug5-v1-1-e072ed5fce85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240625-bug5-v1-1-e072ed5fce85@gmail.com>
Message-ID: <Znx1T_hHNA_uThf2@google.com>
Subject: Re: [PATCH] kvm: Fix warning in__kvm_gpc_refresh
From: Sean Christopherson <seanjc@google.com>
To: Pei Li <peili.dev@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com, llvm@lists.linux.dev, 
	syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 25, 2024, Pei Li wrote:
> Check for invalid hva address stored in data before calling
> kvm_gpc_activate_hva() instead of only compare with 0.
> 
> Reported-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
> Tested-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
> Signed-off-by: Pei Li <peili.dev@gmail.com>
> ---
> Syzbot reports a warning message in __kvm_gpc_refresh(). This warning
> requires at least one of gpa and uhva to be valid.
> WARNING: CPU: 0 PID: 5090 at arch/x86/kvm/../../../virt/kvm/pfncache.c:259 __kvm_gpc_refresh+0xf17/0x1090 arch/x86/kvm/../../../virt/kvm/pfncache.c:259
> 
> We are calling it from kvm_gpc_activate_hva(). This function always calls
> __kvm_gpc_activate() with INVALID_GPA. Thus, uhva must be valid to
> disable this warning.
> 
> This patch checks for invalid hva address as well instead of only
> comparing hva with 0 before calling kvm_gpc_activate_hva()
> 
> syzbot has tested the proposed patch and the reproducer did not trigger
> any issue.
> 
> Tested on:
> 
> commit:         55027e68 Merge tag 'input-for-v6.10-rc5' of git://git...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16ea803a980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e40800950091403a
> dashboard link: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=16eeb53e980000
> 
> Note: testing is done by a robot and is best-effort only.
> ---
>  arch/x86/kvm/xen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index f65b35a05d91..de5f34492405 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -881,7 +881,7 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
>  			r = kvm_gpc_activate(&vcpu->arch.xen.vcpu_info_cache,
>  					     data->u.gpa, sizeof(struct vcpu_info));
>  		} else {
> -			if (data->u.hva == 0) {
> +			if (data->u.hva == 0 || kvm_is_error_hva(data->u.hva)) {
>  				kvm_gpc_deactivate(&vcpu->arch.xen.vcpu_info_cache);
>  				r = 0;
>  				break;

Hmm, I think what we want is to return -EINVAL in this case, not deactivate the
region.   I could have sworn KVM does that.  Gah, I caught
KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA during review, but missed this one.  So to fix
this immediate bug, and avoid similar issues in the future, this?

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 93814d3850eb..622fe24da910 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -741,7 +741,7 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
                } else {
                        void __user * hva = u64_to_user_ptr(data->u.shared_info.hva);
 
-                       if (!PAGE_ALIGNED(hva) || !access_ok(hva, PAGE_SIZE)) {
+                       if (!PAGE_ALIGNED(hva)) {
                                r = -EINVAL;
                        } else if (!hva) {
                                kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 0ab90f45db37..728d2c1b488a 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -438,6 +438,9 @@ int kvm_gpc_activate(struct gfn_to_pfn_cache *gpc, gpa_t gpa, unsigned long len)
 
 int kvm_gpc_activate_hva(struct gfn_to_pfn_cache *gpc, unsigned long uhva, unsigned long len)
 {
+       if (!access_ok((void __user *)uhva, len))
+               return -EINVAL;
+
        return __kvm_gpc_activate(gpc, INVALID_GPA, uhva, len);
 }

