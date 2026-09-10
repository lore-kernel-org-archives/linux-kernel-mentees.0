Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DDC22D792
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Sep 2026 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000046; cv=none; b=PYltn3n6j19FNAnAVfuf+iM2mEFs+olQvpHRBr3VtcmdGK56adXFXZ54tdFTnyHJRrFWvu27tCcmb3aPMpFhJdhhwW+G0cYE0Y/Vu1YMN5O5ncFOWfI+Wj76u02UJy0KIu0J3IwaiIGinZILbfMbi9Byi5FIxXyD3yISix72yM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000046; c=relaxed/simple;
	bh=W/cQoJNpCMvhT/b6a6u/tSJdTecPVVcp+05IoAxGuKA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cfOzBl1OjWHFFnZUvIojjprfjN8AwZa44e0KeqKzVogiEc8DKat9f6D2EysAheavyBoZYgr8PqWajmRjdser1LVMCBx0lDGJUQyEHKSLhV8fqPOOP28IoLPFs2+VHRJMlGsOPnGD6gNeP40aeGYDsO/39F5DTstk5INVicv3B+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tKQcFZf2; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tKQcFZf2"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4090886a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 09 Sep 2026 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789000044; x=1789604844; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8JHNVACgZQItEORarLzV/z1PEss/g3cX3jzovh/lk8=;
        b=tKQcFZf2JmURP6nSui+b6f+tyF45ZAzNBUN1QHxb7BiMCjAO1nrmzU5ZN3UOzeSwul
         d3f5LiPLfTQaINcnJhQMFjnGVWvEh1nNH/tAI2fOajcP1aRtJrsJACNOxaobD26L3vy8
         ydU1LKIGgRvar4seR9tOmJmXpRpTjzSyu4G2HNQOdt/QA/tVVJR3xN17vnXx9ZywmiXb
         pYdcfKnZAzF63qqMoJcQUOesSzpk3j5we8OIWd9k1Er1ZePZwUL5RAUNm+S8BVeTT2+n
         AlbYXBitSoT8nw4iNkeP10zok3kewgexoWhvt6OHJQUP3rWCdOiof4QyGeAZ9WkoHuhh
         2JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789000044; x=1789604844;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8JHNVACgZQItEORarLzV/z1PEss/g3cX3jzovh/lk8=;
        b=a1LkmicCv0T2+ocGnMGPqngVTVY+vUvK27AjLZBD+lLqPcGDfYiG2tfjgQWeO+yjQ2
         eHzXNKW7K+ILw74FlNZJgu4TqTLNYb1BGnTXUDpTKclQ2sNmNVNH/njWiUrV8evujUdj
         xY3YC5kwr4UJf4cJ9NO65Y7agt4JC6kgxEB4gWfnnxaJFZv0xGfqLIAKKdS5xQc4pgj6
         FSiqqDUrizL1XXDohxDxTBc2aj1WiYDbfMcBOjHPhsCrDLh2MFQ7z/Z+WlYmlU5Mtj5i
         aZHf/qVfpI+mW7xgy6pcbpLFKndlUYQGPiXydNJgHj3PhOK0nY93D9bqYMuyhf1iMUun
         EcZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz258kZVK5TnVJLacmbuWvQKbNRqUfOzipAQzkzIVuv1Xb5TkOfV7KrnKZWvuSZDI0o38C7Fc3Sx4tiS5n1wdJ2xLu/Sw==@lists.linux.dev
X-Gm-Message-State: AFuF++mN21muohAE/evT2pvPY5n8x4kfYxbicaqSb7i4EY9auyGDAFrj
	499Of/oStvnHwWeMjpe5EFuQnTe5WE9+uXx6ZDsr6DnBiBa51HDLOMUxPFSFIVv9ZyZYIBcMC0Y
	N96Ijcw==
X-Received: from pjqo21.prod.google.com ([2002:a17:90a:ac15:b0:39b:7935:6c42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d87:b0:380:540:d499
 with SMTP id 98e67ed59e1d1-39b26100bfdmr51740780a91.6.1789000043798; Wed, 09
 Sep 2026 17:27:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:27:23 -0700
In-Reply-To: <20260908160426.6547-2-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260908160426.6547-1-tharitt97@gmail.com> <20260908160426.6547-2-tharitt97@gmail.com>
Message-ID: <aqH5azSkQJVXg3ef@google.com>
Subject: Re: [PATCH v1 1/2] KVM: x86: Reject reserved CR8 bits in KVM_SET_SREGS
From: Sean Christopherson <seanjc@google.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, shuah@kernel.org, hpa@zytor.com, 
	binbin.wu@linux.intel.com, kai.huang@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 08, 2026, Tharit Tangkijwanichakul wrote:
> kvm_is_valid_sregs() validates the incoming CR0, CR4, and efer values but
> never checks CR8.
> 
> When userspace passes a CR8 value with any of the
> reserved bits [63:4] set, __set_sregs_common() forwards it to
> kvm_set_cr8(), which rejects the reserved bits and returns early. That
> return value is not checked, so the ioctl reports success while the
> requested value is silently dropped. A subsequent KVM_GET_SREGS then
> returns a CR8 different from the one userspace believed it had written.
> 
> Factor the reserved-bit check out into kvm_is_valid_cr8() and use it both
> in kvm_set_cr8() and in kvm_is_valid_sregs().
> 
> Fixes: 2f5bb3fe5835 ("KVM: x86: Move the bulk of register specific code from x86.c to regs.c")

Heh, this goes back much further than just moving code around, all the way to:

  6aa8b732ca01 ("[PATCH] kvm: userspace interface")

which did this in kvm_vcpu_ioctl_set_sregs():

  6aa8b732ca01 (Avi Kivity         2006-12-10 02:21:36 -0800 2109)        vcpu->cr8 = sregs->cr8;

I suppose one could argue that:

  Fixes: 7017fc3d1a12 ("KVM: Define and use cr8 access functions")

is more appropriate, since this specific behavior was introduced then.  I'll
probably just shove both in there and massage the changelog to explain the history.

No need for a v2, I'll fixup when applying.  Thanks!
